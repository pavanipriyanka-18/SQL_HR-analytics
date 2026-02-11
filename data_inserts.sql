INSERT INTO employees (employee_id, first_name, last_name, department, job_title, hire_date, salary) VALUES
(1, 'Aarav', 'Sharma', 'HR', 'HR Coordinator', '2021-03-15', 55000),
(2, 'Emily', 'Johnson', 'IT', 'Software Engineer', '2020-07-10', 85000),
(3, 'Michael', 'Brown', 'Finance', 'Financial Analyst', '2019-11-01', 72000),
(4, 'Sophia', 'Davis', 'Sales', 'Sales Executive', '2022-01-20', 60000),
(5, 'Daniel', 'Wilson', 'IT', 'Data Analyst', '2021-09-05', 78000);

INSERT INTO performance_reviews (review_id, employee_id, review_date, performance_score) VALUES
(101, 1, '2023-01-10', 4),
(102, 2, '2023-02-15', 5),
(103, 3, '2023-03-12', 3),
(104, 4, '2023-04-18', 4),
(105, 5, '2023-05-22', 5);

INSERT INTO attendance (attendance_id, employee_id, attendance_date, status) VALUES
(201, 1, '2023-06-01', 'Present'),
(202, 2, '2023-06-01', 'Absent'),
(203, 3, '2023-06-01', 'Present'),
(204, 4, '2023-06-01', 'Present'),
(205, 5, '2023-06-01', 'Present');

INSERT INTO attrition (attrition_id, employee_id, attrition_date, reason) VALUES
(301, 3, '2023-08-10', 'Resigned'),
(302, 4, '2023-09-05', 'Terminated');
