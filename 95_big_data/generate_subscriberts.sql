DO $f$
DECLARE cit TEXT;
  count TEXT;
  randcit INT;
  lev TEXT;
  levs TEXT[] := '{"starving","starving","professional","professional","leader","supporter"}';
  i INT;
BEGIN
    FOR i IN 1..3000 LOOP
        lev := levs[((random() * 6)::INT)];
        IF lev IS NULL THEN
            lev := 'professional';
        END IF;
        randcit := (random()*5)::INT;
        CASE randcit
            WHEN 1 THEN
                cit := 'San Francisco';
                count := 'USA';
            WHEN 2 THEN
                cit := 'Portland';
                count := 'USA';
            WHEN 3 THEN
                cit := 'New York';
                count := 'USA';
            WHEN 4 THEN
                cit := 'Brisbane';
                count := 'Australia';
            WHEN 5 THEN
                cit := 'Melbourne';
                count := 'Australia';
            ELSE
                cit := 'Perth';
                count := 'Australia';
        END CASE;
        INSERT INTO lwn_subscribers
        VALUES ( i, count, cit, lev );

    END LOOP;
END;
$f$;

