USE springboardopt;
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';
EXPLAIN analyze
-- drop index student_idx1 on Student;
-- 2. List the names of students with id in the range of v2 (id) to v3 (inclusive).
SELECT name FROM Student WHERE id BETWEEN @v2 AND @v3;


-- ---------------TUNING REPORT------------------------------
-- 1. Nothing to optimize in the query. The indexing method di not work
-- 2. Running EXPLAIN ANALYZE showed:
-- after creating index
-- '-> Filter: (student.id between <cache>((@v2)) and <cache>((@v3)))  (cost=41.00 rows=278) (actual time=0.026..0.348 rows=278 loops=1)\n    -> Table scan on Student  (cost=41.00 rows=400) (actual time=0.015..0.283 rows=400 loops=1)\n'

-- after dropping the index 
-- '-> Filter: (student.id between <cache>((@v2)) and <cache>((@v3)))  (cost=5.44 rows=44) (actual time=0.034..0.255 rows=278 loops=1)\n    -> Table scan on Student  (cost=5.44 rows=400) (actual time=0.019..0.194 rows=400 loops=1)\n'



