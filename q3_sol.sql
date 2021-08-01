USE springboardopt;

-- -------------------------------------
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';
-- EXPLAIN ANALYZE;

-- 3. List the names of students who have taken course v4 (crsCode).
CREATE INDEX crsCode_index on Transcript(crsCode);
SELECT name FROM Student WHERE id IN (SELECT studId FROM Transcript WHERE crsCode = @v4);

-- ---------------TUNING REPORT------------------------------
-- 1. Join type ALL 
-- 2. Running EXPLAIN ANALYZE showed "Nested loop inner join  (cost=3.25 rows=10)"
-- 3. Used adding index method on Transcript table. 
-- After Adding index  "Nested loop inner join  (cost=0.85 rows=2)"