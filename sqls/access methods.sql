DROP INDEX IF EXISTS t_a_idx;

-- Sequential scan
EXPLAIN SELECT * FROM t WHERE a = 5;

-- Add index
CREATE INDEX t_a_idx ON t(a);

-- Index scan
EXPLAIN SELECT * FROM t WHERE a = 5;

-- Bitmap scan
EXPLAIN SELECT * FROM t WHERE a <= 100;

-- Index only-scan
EXPLAIN SELECT a FROM t WHERE a = 5;
