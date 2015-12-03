-- UPSERT

INSERT INTO lwn_subscribers
VALUES ( 3001, 'USA', 'San Francisco', 'professional' )
ON CONFLICT (id) DO
UPDATE SET country = EXCLUDED.country,
    city = EXCLUDED.city,
    level = EXCLUDED.level;

INSERT INTO lwn_subscribers
VALUES ( 2998, 'USA', 'New York', 'professional' )
ON CONFLICT (id) DO
UPDATE SET country = EXCLUDED.country,
    city = EXCLUDED.city,
    level = EXCLUDED.level;

INSERT INTO lwn_subscribers
VALUES ( 3001, 'USA', 'San Francisco', 'professional' )
ON CONFLICT (id) DO IGNORE;

INSERT INTO lwn_subscribers
VALUES ( 2996, 'USA', 'San Francisco', 'leader' ),
    ( 2999, 'Australia', 'Perth', 'leader' ),
    ( 3002, 'USA', 'Portland', 'starving' ),
    ( 3003, 'USA', 'Portland', 'starving' )
ON CONFLICT (id) DO
UPDATE SET country = EXCLUDED.country,
    city = EXCLUDED.city,
    level = EXCLUDED.level;


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

-- 
