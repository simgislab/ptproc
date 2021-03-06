CREATE TABLE pt_nodes (node_id INT PRIMARY KEY,bus_ref TEXT,trolleybus_ref TEXT,tram_ref TEXT,share_taxi_ref TEXT);
CREATE TABLE pt_ways (way_id INT PRIMARY KEY,bus_ref TEXT,trolleybus_ref TEXT,tram_ref TEXT,share_taxi_ref TEXT);
CREATE OR REPLACE FUNCTION tags2pairs(a text[]) RETURNS text[] AS $SQL$
    SELECT array_agg($1[i] || '=' || $1[i+1])
    FROM generate_series(1, array_upper($1,1)) i
    WHERE i % 2 = 1
$SQL$ LANGUAGE sql;
