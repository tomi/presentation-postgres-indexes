BEGIN;
DROP TABLE IF EXISTS t;
COMMIT;

BEGIN;
create table t(a integer, b text, c boolean);
insert into t(a,b,c)
  select s.id, chr((32+random()*94)::integer), random() < 0.01
  from generate_series(1,1000000) as s(id)
order by chr;
COMMIT;
