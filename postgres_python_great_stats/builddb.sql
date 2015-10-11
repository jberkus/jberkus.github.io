create table input.bikeparking (
    ADDRESS text,
    LOCATION_NAME text,
    STREET_NAME text,
    RACKS int,
    SPACES int,
    PLACEMENT text,
    MO_INSTALLED text,
    YR_INSTALLED text,
    COORDINATES text
);

create table input.crimedata(
    IncidntNum INT,
    Category text,
    Descrip text,
    DayOfWeek text,
    IncidentDate DATE,
    IncidentTime Time,
    PdDistrict text,
    Resolution text,
    Address text,
    xcoord numeric,
    ycoord numeric,
    Location point,
    Pdid BIGINT
);

create table risk (
    stdev numrange,
    risk text );

insert into risk values
  ( '[ -1000, -2.0 )', 'very safe' ),
  ( '[ -2.0, -0.7 )', 'safe' ),
  ( '[ -0.7, -0.3 )', 'kinda safe' ),
  ( '[ -0.3, 0.5 )', 'average' ),
  ( '[ 0.5, 1.0 )', 'kinda risky' ),
  ( '[ 1.0, 2.0 )', 'risky' ),
  ( '[ 2.0, 4.0 )', 'very risky' ),
  ( '[ 4.0, 1000 )', 'already stolen' );

create or replace function chisq_p(
    popvals float[] )
returns float
language plpythonu
as $f$
from scipy import stats
popmean, p = stats.chisquare(popvals)
return p
$f$;

create aggregate chisq_agg ( float ) (
    initcond = '{}',
    sfunc = array_append,
    stype = FLOAT[],
    finalfunc = chisq_p
);
    

create OR REPLACE function bikecoord (text)
returns text
language sql 
as 
$f$
with destring as (
select string_to_array(
(string_to_array($1,'
'))[2],',') as coords )
select 'POINT(' || regexp_replace(coords[2],'[ ()]','','g') || ' ' || regexp_replace(coords[1],'[ ()]','','g') || ')'
from destring;
$f$;

create table bikeparking as
select address, location_name,
street_name as street,
racks, spaces,
placement,
(case when yr_installed ~* '\d+' then yr_installed
    else null end || '-' ||
case when mo_installed ~* '\d+' then mo_installed
    else '01' end || '-01')::date as installed_in,
st_geogfromtext(bikecoord(coordinates)) as location
from input.bikeparking;

create table crimedata as
select incidntnum as incidentid,
    category,
    descript as description,
    dayofweek as dayofweek,
    incidentdate + incidenttime as incident_ts,
    pddistrict as district,
    resolution,
    address,
    st_geogfromtext('POINT(' || xcoord || ' ' || ycoord || ')' ) as location
from input.crimedata;

create index on bikeparking using gist(location);

create index on crimedata using gist(location)
where description ilike '%bicycle%';

select location_name, bikeparking.address, count(*)
from bikeparking
    join crimedata
    on st_dwithin(bikeparking.location, crimedata.location, 50)
        and crimedata.description ilike '%bicycle%'
group by location_name, bikeparking.address
order by 3 desc;

create materialized view rackthefts as
    select location_name, bikeparking.address, count(*)/racks::float as thefts
    from bikeparking
        join crimedata
        on st_dwithin(bikeparking.location, crimedata.location, 50)
            and crimedata.description ilike '%bicycle%'
    group by location_name, bikeparking.address, racks;

select chisq_agg(thefts)::numeric
from rackthefts;

create or replace function std_compare(
    val float, popvals float[])
returns float
language plpythonu
as $f$
import numpy
std = numpy.std(popvals)
avg = numpy.mean(popvals)
stdvar = ( val - avg ) / std
return stdvar
$f$;

with racktheft_window as (
    select rackthefts.*, 
        array_agg(thefts) over () as all_thefts
    from rackthefts
)
select location_name,
    address,
    std_compare(thefts, all_thefts) as risk_factor
from racktheft_window
order by risk_factor desc;

with racktheft_window as (
    select rackthefts.*, 
        array_agg(thefts) over () as all_thefts
    from rackthefts
), risk_factors as (
select location_name,
    address,
    std_compare(thefts, all_thefts) as risk_factor
from racktheft_window
)
select risk_factors.*, risk
    from risk_factors
        join risk ON risk_factor::numeric <@ stdev
order by risk_factor desc;



