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
ON CONFLICT (id) DO IGNORE;

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

-- cube and rollup

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
