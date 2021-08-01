
USE springboardopt;
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';

-- EXPLAIN ANALYZE
-- 1. List the name of the student with id equal to v1 (id).
-- DROP INDEX student_idx1 ON Student;
 CREATE UNIQUE INDEX student_idx1 ON Student(id);
-- DROP INDEX student_idx1 ON Student;
SELECT name FROM Student WHERE id = @v1;


-- ---------------TUNING REPORT------------------------------
-- 1. Query was doing full table scan because of where clause
-- 2. BEFORE adding an index
-- Filter: (student.id = <cache>((@v1)))  (cost=41.00 rows=40) (actual time=0.070..0.217 rows=1 loops=1)\n    -> Table scan on Student  (cost=41.00 rows=400) (actual time=0.018..0.174 rows=400 loops=1)\n'
-- 3. Used adding index method
-- AFTER adding an index:
-- Rows fetched before execution  (cost=0.00 rows=1) (actual time=0.000..0.000 rows=1 loops=1)\n'