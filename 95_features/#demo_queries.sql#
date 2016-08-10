-- UPSERT

SELECT * FROM lwn_subscribers WHERE id > 2993;

INSERT INTO lwn_subscribers
VALUES ( 3001, 'USA', 'San Francisco', 'professional' )
ON CONFLICT (id) DO
UPDATE SET country = EXCLUDED.country,
    city = EXCLUDED.city,
    level = EXCLUDED.level;

SELECT * FROM lwn_subscribers WHERE id > 2993;

INSERT INTO lwn_subscribers
VALUES ( 2998, 'USA', 'New York', 'professional' )
ON CONFLICT (id) DO
UPDATE SET country = EXCLUDED.country,
    city = EXCLUDED.city,
    level = EXCLUDED.level;

SELECT * FROM lwn_subscribers WHERE id > 2993;

INSERT INTO lwn_subscribers
VALUES ( 3001, 'USA', 'San Francisco', 'professional' )
ON CONFLICT (id) DO NOTHING;

SELECT * FROM lwn_subscribers WHERE id > 2993;

INSERT INTO lwn_subscribers
VALUES ( 2996, 'USA', 'San Francisco', 'leader' ),
    ( 2999, 'Australia', 'Perth', 'leader' ),
    ( 3002, 'USA', 'Portland', 'starving' ),
    ( 3003, 'USA', 'Portland', 'starving' )
ON CONFLICT (id) DO
UPDATE SET country = EXCLUDED.country,
    city = EXCLUDED.city,
    level = EXCLUDED.level;

SELECT * FROM lwn_subscribers WHERE id > 2993;

-- row level security

\c libdata

show row_security;

alter table patrons enable row level security;

CREATE POLICY patrons_control ON patrons FOR ALL TO PUBLIC
USING (card_no::TEXT = CURRENT_USER);

GRANT ALL on patrons TO public;

SET SESSION AUTHORIZATION "96555212612710";

SELECT * FROM patrons;

SET SESSION AUTHORIZATION "postgres"

-- JSON

\c libdata

set search_path = public, extensions;

select isbn, jsonb_pretty(bookdata) from titles where titles.isbn = '0-06-211533-2';

update titles set bookdata = jsonb_set(bookdata, array['replacement_cost'], '22')
where titles.isbn = '0-06-211533-2';

select isbn, jsonb_pretty(bookdata) from titles where titles.isbn = '0-06-211533-2';

update titles set bookdata = bookdata || '{ "beer" : "duff" }'
where titles.isbn = '0-06-211533-2';

select isbn, jsonb_pretty(bookdata) from titles where titles.isbn = '0-06-211533-2';

create extension jsquery;

select * from titles
where bookdata @@ '"publisher" = "It Books" AND "replacement_cost" > 50';

-- cube and rollup

\c subscribers

SELECT country, city, count(*)
FROM lwn_subscribers
GROUP BY ROLLUP ( country, city );

SELECT country, level, count(*)
FROM lwn_subscribers
GROUP BY CUBE ( country, level );

SELECT city, level, count(*)
FROM lwn_subscribers
GROUP BY GROUPING SETS ((city, level),(level),());

-- fdw

\c libdata

\dt

CREATE EXTENSION postgres_fdw;

CREATE SERVER subscribers FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
  dbname 'subscribers',
  host '127.0.0.1',
  port '5432',
  updatable 'true'
);

CREATE SCHEMA subscribers;

IMPORT FOREIGN SCHEMA public
  FROM SERVER subs INTO subscribers;

\dt subscribers.*

select * from subscribers.lwn_subscribers;

--- more fdw

\det

\d+ copy_history_master

SELECT * FROM copy_history_master
WHERE began BETWEEN '2009-10-01' AND '2009-10-02';
