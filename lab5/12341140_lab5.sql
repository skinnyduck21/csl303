SELECT emp_name
FROM Employees
WHERE dept_id = (
    SELECT dept_id FROM Departments WHERE dept_name = 'Marketing'
);

SELECT emp_name, salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);

SELECT e.emp_name
FROM Employees e
JOIN Assignments a ON e.emp_id = a.emp_id
WHERE a.proj_id = (
    SELECT proj_id FROM Projects WHERE proj_name = 'Project Phoenix'
);

SELECT emp_name
FROM Employees
WHERE emp_id NOT IN (SELECT emp_id FROM Assignments);

SELECT emp_name
FROM Employees
WHERE salary > (
    SELECT MIN(salary) 
    FROM Employees 
    WHERE dept_id = (SELECT dept_id FROM Departments WHERE dept_name = 'Marketing')
);

SELECT emp_name
FROM Employees
WHERE salary > (
    SELECT MAX(salary) 
    FROM Employees 
    WHERE dept_id = (SELECT dept_id FROM Departments WHERE dept_name = 'Marketing')
);




SELECT emp_name, hire_date
FROM Employees
WHERE strftime('%Y', hire_date) = '2023';

SELECT emp_name
FROM Employees
WHERE manager_id IS NULL;

SELECT emp_name
FROM Employees
WHERE emp_name LIKE '% Smith' OR emp_name LIKE '% Williams';

SELECT emp_name
FROM Employees
WHERE hire_date >= DATE('now', '-2 years');




SELECT d.dept_name, e.emp_name, e.salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employees
    WHERE dept_id = e.dept_id
);

SELECT e.emp_name
FROM Employees e
WHERE e.dept_id = (SELECT dept_id FROM Departments WHERE dept_name = 'Engineering')
AND e.emp_id NOT IN (
    SELECT a.emp_id
    FROM Assignments a
    WHERE a.proj_id = (SELECT proj_id FROM Projects WHERE proj_name = 'Project Neptune')
);

SELECT d.dept_name
FROM Departments d
JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_id
HAVING AVG(e.salary) > (SELECT AVG(salary) FROM Employees);




ALTER TABLE Employees ADD COLUMN email TEXT;

UPDATE Employees
SET email = LOWER(REPLACE(emp_name, ' ', '')) || 'engineering.com'
WHERE dept_id = (SELECT dept_id FROM Departments WHERE dept_name = 'Engineering');

CREATE TABLE HighEarners (
    emp_id INTEGER,
    emp_name TEXT
);
INSERT INTO HighEarners (emp_id, emp_name)
SELECT emp_id, emp_name
FROM Employees
WHERE salary > 95000;
