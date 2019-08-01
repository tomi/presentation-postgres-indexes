
------ Scanning techniques ------
DROP INDEX IF EXISTS t_a_idx;

-- Sequential scan
EXPLAIN(costs off) SELECT * FROM t WHERE a = 5;

-- Add index
CREATE INDEX t_a_idx ON t(a);

-- Index scan
EXPLAIN(costs off) SELECT * FROM t WHERE a = 5;

-- Bitmap scan
EXPLAIN(costs off) SELECT * FROM t WHERE a <= 100;

-- Index only-scan
EXPLAIN(costs off) SELECT a FROM t WHERE a = 5;

------ Partial indexes ------
CREATE INDEX IF NOT EXISTS t_c_idx ON t(c);
EXPLAIN(costs off) SELECT * FROM t WHERE c;
EXPLAIN(costs off) SELECT * FROM t WHERE NOT c;
-- Check number of pages
SELECT relpages FROM pg_class WHERE relname='t_c_idx';

DROP INDEX IF EXISTS t_c_idx;
CREATE INDEX IF NOT EXISTS t_c_idx ON t(c) WHERE c;



