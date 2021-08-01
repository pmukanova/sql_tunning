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
explain 
-- 6. List the names of students who have taken all courses offered by department v8 (deptId).

SELECT t.crsCode,s.name from Transcript as t
inner join Student as s
on t.studId = s.id
where crsCode LIKE concat(@v8, '%')

-- ---------------TUNING REPORT------------------------------
-- 1.complicated joins
-- 2. Running EXPLAIN showed 6 joins with type ALL
-- 3. Used REWRITING QUERY method. only two joins needed, types range and eq_ref
