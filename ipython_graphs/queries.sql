WITH maggs AS ( 
    SELECT measurement_time AS mtime, 
       max(periowait)::float as maxwait, 
       avg(periowait)::float as avgwait
    FROM cpu
    GROUP BY measurement_time
    ORDER BY measurement_time
    )
    SELECT array_agg(mtime), array_agg(avgwait), array_agg(maxwait)
    FROM maggs;
  
SELECT dev,
    array_agg(measurement_time order by measurement_time) as mtime,
    array_agg(tps order by measurement_time) as tps,
    array_agg(rd_sec_s order by measurement_time) as reads,
    array_agg(wr_sec_s order by measurement_time) as writes,
    array_agg(await order by measurement_time) as await,
    array_agg(perutil order by measurement_time) as util
FROM disk
WHERE dev in ('dev8-0','dev253-1')
GROUP BY dev
ORDER BY dev;

CREATE FUNCTION trunc_5min(
    timestamptz)
returns timestamptz
language sql
immutable
as 
$f$
SELECT date_trunc('hour', $1) + date_part('minute', $1)::int / 5 * interval '5 min';
$f$;