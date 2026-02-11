-- Employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    job_title VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10,2)
);

-- Performance Reviews table
CREATE TABLE performance_reviews (
    review_id INT PRIMARY KEY,
    employee_id INT,
    review_date DATE,
    performance_score INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Attendance table
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Attrition table
CREATE TABLE attrition (
    attrition_id INT PRIMARY KEY,
    employee_id INT,
    attrition_date DATE,
    reason VARCHAR(100),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
