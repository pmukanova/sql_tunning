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
Explain analyze
-- 4. List the names of students who have taken a course taught by professor v5 (name).
-- CREATE INDEX id_index on Professor(id);
SELECT name FROM Student,
	(SELECT studId FROM Transcript,
		(SELECT crsCode, semester FROM Professor
			JOIN Teaching
			WHERE Professor.name = @v5 AND Professor.id = Teaching.profId) as alias1
	WHERE Transcript.crsCode = alias1.crsCode AND Transcript.semester = alias1.semester) as alias2
WHERE Student.id = alias2.studId;

-- ---------------TUNING REPORT------------------------------
-- 1. Join type hash join
-- 2. Running EXPLAIN ANALYZE showed query doing full scan on Professor table
-- 3. Used adding index method on Professor table id column. 
-- After Adding index  "Nested loop inner join  (cost=49.22 rows=1)"


