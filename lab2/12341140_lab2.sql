--Part 1: Simple Retrieval (SELECT, WHERE, ORDER BY)
--1. Find the names and Grades of all students in discipline ’Physics’.

SELECT Students.sname, Enrolled.grade
FROM Students
JOIN Enrolled USING (sid)
WHERE Students.discipline = 'Physics';

--2. List the course names and their credit values for all courses worth 4 credits.

SELECT cname, credits
FROM Courses
WHERE credits = 4;

--3. Retrieve the student ID and course ID for all enrollments where the grade is ’F’.

SELECT sid, cid
FROM Enrolled
WHERE grade = 'F';

--4. List all student names and their discipline, sorted alphabetically by discipline, and then by name for students in the same discipline.

SELECT sname, discipline
FROM Students
ORDER BY discipline, sname;

--Part 2: Joins
--1. List the names of all students who are enrolled in ’Databases’ (CSL303).

SELECT DISTINCT sname
FROM Students
JOIN Enrolled USING (sid)
JOIN Courses USING (cid)
WHERE cname = 'Databases' AND cid = 'CSL303';

--2. Find the names of all courses that ’Ben Taylor’ is enrolled in.

SELECT cname
FROM Students
JOIN Enrolled USING (sid)
JOIN Courses USING (cid)
WHERE sname = 'Ben Taylor';

--3. Show the name of each student and the name of each course they are enrolled in, along with their grade.

SELECT sname AS student_name, cname AS course_name, grade
FROM Students
JOIN Enrolled USING (sid)
JOIN Courses USING (cid);

--4. List the names of all students who are not enrolled in any courses.

SELECT sname
FROM Students
WHERE sid NOT IN (SELECT sid FROM Enrolled);

--5. Find the names of all students who received a ’B’ in a 3-credit course.

SELECT DISTINCT sname
FROM Students
JOIN Enrolled USING (sid)
JOIN Courses USING (cid)
WHERE grade = 'B' AND credits = 3;

--Part 3: Aggregation and Grouping
--1. For each discipline, find the number of students in it.

SELECT discipline, COUNT(*) AS student_count
FROM Students
GROUP BY discipline;

--2. Count the number of courses offered, grouped by the number of credits (i.e., how many 3-credit courses, 4-credit courses, etc.).

SELECT credits, COUNT(*) AS course_count
FROM Courses
GROUP BY credits;

--3. For each course, find the number of students enrolled. List the course name and the student count.

SELECT cname, COUNT(sid) AS student_count
FROM Courses
LEFT JOIN Enrolled USING (cid)
GROUP BY cid, cname;

--4. Find the ‘cid‘ of all courses that have more than 2 students with a grade of ’A’.

SELECT cid
FROM Enrolled
WHERE grade = 'A'
GROUP BY cid
HAVING COUNT(sid) > 2;

--Challenge: Subqueries and Complex Queries
--1. Find the names of all students who are enrolled in ’Data Structures’ (CSL211). Use a subquery in your WHERE clause.

SELECT sname
FROM Students
WHERE sid IN (
    SELECT sid
    FROM Enrolled
    WHERE cid = 'CSL211'
);

--2. Find the names of courses that have at least one student enrolled but also have at least one student with a grade of ’F’.
SELECT cname
FROM Courses
WHERE cid IN (SELECT cid FROM Enrolled)
  AND cid IN (SELECT cid FROM Enrolled WHERE grade = 'F');

--3. Find the names of students who are enrolled in both ’Intro to Programming’ (CSL100) and ’Databases’ (CSL303).

SELECT sname
FROM Students
WHERE sid IN (SELECT sid FROM Enrolled WHERE cid = 'CSL100')
  AND sid IN (SELECT sid FROM Enrolled WHERE cid = 'CSL303');
