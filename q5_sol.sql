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

explain analyze

-- 5. List the names of students who have taken a course from department v6 (deptId), but not v7.
SELECT * FROM Student, 
	(SELECT studId FROM Transcript, Course WHERE deptId = @v6 AND deptId!=@v7 and Course.crsCode = Transcript.crsCode
	) as alias
WHERE Student.id = alias.studId;

-- ---------------TUNING REPORT------------------------------
-- 1. dependent subqueries
-- 2. Running EXPLAIN showed 5 joins
-- 3. Used REWRITING QUERY method. got rid of extra subquery

