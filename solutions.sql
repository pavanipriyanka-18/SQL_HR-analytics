1. List all employees with department and job title
SELECT first_name, last_name, department, job_title
FROM employees;

2. Count employees in each department
SELECT department, COUNT(employee_id) AS total_employees
FROM employees
GROUP BY department;

3. Average salary by department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

4. Employees hired after 2021
SELECT *
FROM employees
WHERE hire_date > '2021-12-31';

---------------------------------------------------------
Performance Analytics
---------------------------------------------------------

5. Average performance score for each employee
SELECT e.first_name, e.last_name, AVG(p.performance_score) AS avg_score
FROM employees e
JOIN performance_reviews p ON e.employee_id = p.employee_id
GROUP BY e.employee_id;

6. Average performance score by department
SELECT department, AVG(performance_score) AS avg_score
FROM employees
JOIN performance_reviews ON employees.employee_id = performance_reviews.employee_id
GROUP BY department;

7. Employees with performance score above 4
SELECT e.first_name, e.last_name, p.performance_score
FROM employees e
JOIN performance_reviews p ON e.employee_id = p.employee_id
WHERE p.performance_score > 4;

8. Departments where avg performance score > 4
SELECT department, AVG(performance_score) AS avg_score
FROM employees
JOIN performance_reviews ON employees.employee_id = performance_reviews.employee_id
GROUP BY department
HAVING AVG(performance_score) > 4;

---------------------------------------------------------
Attendance Insights
---------------------------------------------------------

9. Present vs absent count on a given date
SELECT status, COUNT(*) AS total
FROM attendance
WHERE attendance_date = '2023-06-01'
GROUP BY status;

10. Attendance records for each employee
SELECT e.first_name, e.last_name, a.attendance_date, a.status
FROM employees e
JOIN attendance a ON e.employee_id = a.employee_id;

11. Employees with perfect attendance
SELECT e.first_name, e.last_name
FROM employees e
WHERE e.employee_id NOT IN (
    SELECT employee_id FROM attendance WHERE status = 'Absent'
);

---------------------------------------------------------
Attrition Insights
---------------------------------------------------------

12. Number of employees who left in each department
SELECT department, COUNT(attrition.employee_id) AS attrition_count
FROM employees
JOIN attrition ON employees.employee_id = attrition.employee_id
GROUP BY department;

13. Top 3 departments with highest attrition
SELECT department, COUNT(attrition.employee_id) AS attrition_count
FROM employees
JOIN attrition ON employees.employee_id = attrition.employee_id
GROUP BY department
ORDER BY attrition_count DESC
LIMIT 3;

14. Average tenure (days worked) of employees who left
SELECT department,
       AVG(DATEDIFF(attrition_date, hire_date)) AS avg_tenure_days
FROM employees
JOIN attrition ON employees.employee_id = attrition.employee_id
GROUP BY department;

---------------------------------------------------------
Multi‑Table Analytical Queries
---------------------------------------------------------

15. Salary, performance score, attendance status for a date
SELECT e.first_name, e.last_name, e.salary, p.performance_score, a.status
FROM employees e
JOIN performance_reviews p ON e.employee_id = p.employee_id
JOIN attendance a ON e.employee_id = a.employee_id
WHERE a.attendance_date = '2023-06-01';

16. Departments with high performance (>4) and low attrition
SELECT department
FROM employees
JOIN performance_reviews ON employees.employee_id = performance_reviews.employee_id
LEFT JOIN attrition ON employees.employee_id = attrition.employee_id
GROUP BY department
HAVING AVG(performance_score) > 4
   AND COUNT(attrition.employee_id) < 2;

17. Employees with low performance (<3) who later left
SELECT e.first_name, e.last_name
FROM employees e
JOIN performance_reviews p ON e.employee_id = p.employee_id
JOIN attrition a ON e.employee_id = a.employee_id
WHERE p.performance_score < 3;

18. Department with highest avg salary & performance
SELECT department,
       AVG(salary) AS avg_salary,
       AVG(performance_score) AS avg_score
FROM employees
JOIN performance_reviews ON employees.employee_id = performance_reviews.employee_id
GROUP BY department
ORDER BY avg_salary DESC, avg_score DESC
LIMIT 1;
