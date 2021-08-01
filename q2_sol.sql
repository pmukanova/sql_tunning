USE springboardopt;
SET @v1 = 1612521;
SET @v2 = 1145072;
SET @v3 = 1828467;
SET @v4 = 'MGT382';
SET @v5 = 'Amber Hill';
SET @v6 = 'MGT';
SET @v7 = 'EE';			  
SET @v8 = 'MAT';
 EXPLAIN ANALYZE
-- 2. List the names of students with id in the range of v2 (id) to v3 (inclusive).
-- SELECT name FROM Student WHERE id BETWEEN @v2 AND @v3;
SELECT name FROM Student WHERE id in (@v2, @v3);
 
 
-- ---------------TUNING REPORT------------------------------
-- 1. Query was scanning whole table
-- 2. Running EXPLAIN ANALYZE showed:
-- > Filter: (student.id between <cache>((@v2)) and <cache>((@v3)))  (cost=41.00 rows=278) (actual time=0.082..0.318 rows=278 loops=1)
--    -> Table scan on Student  (cost=41.00 rows=400) (actual time=0.075..0.268 rows=400 loops=1)
-- 3. Used rewriting the query method:
-- AFTER swithing to IN clause instead of between querry is looking up only two rows
-- -> Index range scan on Student using student_idx1, with index condition: (student.id in (<cache>((@v2)),<cache>((@v3))))  (cost=1.41 rows=2) (actual time=0.036..0.039 rows=2 loops=1)\n'