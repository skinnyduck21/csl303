-- Task 3: CREATE TABLE

CREATE TABLE Students (
   StudentID INTEGER PRIMARY KEY,
   FirstName TEXT NOT NULL,
   Lastname TEXT NOT NULL,
   Discipline TEXT
);

CREATE TABLE Faculty (
   FacultyID INTEGER PRIMARY KEY,
   FirstName TEXT NOT NULL,
   LastName TEXT NOT NULL,
   Department TEXT
);

-- Task 4: INSERT

INSERT INTO Students (StudentID, FirstName, LastName, Discipline)
VALUES 
(12341140, 'Keshav', 'Mishra', 'CSE'),
(12341141, 'Rakesh', 'Sharma', 'ME'),
(12341142, 'Neil', 'Armstrong', 'MT'),
(12341146, 'Ananya', 'Verma', 'CSE');

INSERT INTO Faculty (FacultyID, FirstName, LastName, Department)
VALUES 
(12341143, 'Keshav', 'Gupta', 'DSAI'),
(12341144, 'Kalash', 'Sharma', 'CSE'),
(12341145, 'Neil', 'Mishra', 'ME'),
(12341147, 'Suresh', 'Patel', 'CSE');

-- Task 5: Selection
-- 1. Find all students with discipline 'CSE'

SELECT * FROM Students
WHERE Discipline = 'CSE';

-- 2. Find all faculty in the 'CSE' department

SELECT * FROM Faculty
WHERE Department = 'CSE';

-- Task 6: Projection
-- 1. List the first and last names of all students

SELECT FirstName, LastName FROM Students;

-- 2. List the last names and departments of all faculty

SELECT LastName, Department FROM Faculty;

-- Task 7: UNION
-- 1. List all unique first names of both students and faculty

SELECT FirstName FROM Students
UNION
SELECT FirstName FROM Faculty;

-- 2. List all unique last names of both students and faculty

SELECT LastName FROM Students
UNION
SELECT LastName FROM Faculty;

-- Task 8: INTERSECT
-- 1. Find all first names that are common to both students and faculty.

SELECT FirstName FROM Students
INTERSECT
SELECT FirstName FROM Faculty;

-- 2. Find all last names that are common to both students and faculty.

SELECT LastName FROM Students
INTERSECT
SELECT LastName FROM Faculty;
