
set search_path = public, extensions;

select isbn, jsonb_pretty(bookdata) from titles where titles.isbn = '0-06-211533-2'::isbn;

update titles set bookdata = jsonb_set(bookdata, array['replacement_cost'], '22')
where titles.isbn = '0-06-211533-2'::isbn;

select isbn, jsonb_pretty(bookdata) from titles where titles.isbn = '0-06-211533-2'::isbn;

update titles set bookdata = bookdata || '{ "beer" : "duff" }'
where titles.isbn = '0-06-211533-2'::isbn;

select isbn, jsonb_pretty(bookdata) from titles where titles.isbn = '0-06-211533-2'::isbn;

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
