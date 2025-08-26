CREATE TABLE enrolled (
    student_id INTEGER,
    course_id INTEGER,
    grade TEXT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY(student_id) REFERENCES Students(student_id),
    FOREIGN KEY(course_id) REFERENCES Courses(course_id)
);


INSERT INTO enrolled (student_id, course_id, grade)
SELECT student_id, course_id, grade
FROM Enrollments;


UPDATE Students
SET department = 'Philosophy'
WHERE name LIKE '%i%';


ALTER TABLE Students
ADD COLUMN email TEXT;


UPDATE Students
SET email = LOWER(name) || '@iitbhilai.ac.in';


SELECT s.name FROM Students s WHERE department = 'Computer Science';


SELECT s.name FROM Students s JOIN Courses c ON s.name = c.course_name;


SELECT s.name AS student_name, c.course_name
FROM enrolled e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
ORDER BY c.course_name;


SELECT s.name AS student_name, c.course_name
FROM Students s
LEFT JOIN enrolled e ON s.student_id = e.student_id
LEFT JOIN Courses c ON e.course_id = c.course_id;


SELECT s.name FROM Students s WHERE name LIKE 'A%';


SELECT DISTINCT s.name
FROM Students s
JOIN enrolled e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.credits > 3;


SELECT s.name
FROM Students s
LEFT JOIN enrolled e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;
