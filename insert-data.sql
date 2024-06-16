
INSERT INTO tbl_regions (id, name) VALUES 
(1, 'North America'),
(2, 'Europe'),
(3, 'Asia');

-- Insert into tbl_countries
INSERT INTO tbl_countries (id, name, region) VALUES 
('USA', 'United States', 1),
('CAN', 'Canada', 1),
('GBR', 'United Kingdom', 2),
('DEU', 'Germany', 2),
('CHN', 'China', 3),
('JPN', 'Japan', 3);

INSERT INTO tbl_locations (id, street_address, postal_code, city, state_province, country) VALUES 
(1, '123 Main St', '12345', 'New York', 'NY', 'USA'),
(2, '456 Maple Dr', '54321', 'Toronto', 'ON', 'CAN'),
(3, '789 Elm St', '67890', 'London', 'LDN', 'GBR'),
(4, '321 Oak Ave', '09876', 'Berlin', 'BE', 'DEU'),
(5, '654 Pine Rd', '11223', 'Beijing', 'BJ', 'CHN'),
(6, '987 Cedar Blvd', '44556', 'Tokyo', 'TK', 'JPN');

-- Insert into tbl_departments
INSERT INTO tbl_departments (id, name, location) VALUES 
(1, 'HR', 1),
(2, 'Finance', 2),
(3, 'IT', 3),
(4, 'Sales', 4),
(5, 'Marketing', 5),
(6, 'R&D', 6);

-- Insert into tbl_jobs
INSERT INTO tbl_jobs (id, title, min_salary, max_salary) VALUES 
('J001', 'Manager', 60000, 120000),
('J002', 'Engineer', 50000, 100000),
('J003', 'Analyst', 40000, 80000),
('J004', 'Clerk', 30000, 60000),
('J005', 'Director', 80000, 160000);

-- Insert into tbl_employees
INSERT INTO tbl_employees (id, first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department) VALUES 
(1, 'John', 'Doe', 'Male', 'john.doe@example.com', '123-456-7890', '2020-01-15', 70000, NULL, 'J001', 1),
(2, 'Jane', 'Smith', 'Female', 'jane.smith@example.com', '234-567-8901', '2019-03-10', 80000, 1, 'J002', 2),
(3, 'Sam', 'Brown', 'Male', 'sam.brown@example.com', '345-678-9012', '2018-05-20', 60000, 1, 'J003', 3),
(4, 'Sue', 'Green', 'Female', 'sue.green@example.com', '456-789-0123', '2021-07-30', 50000, 2, 'J004', 4),
(5, 'Tom', 'White', 'Male', 'tom.white@example.com', '567-890-1234', '2017-09-25', 90000, 2, 'J005', 5);

-- Insert into tbl_job_histories
INSERT INTO tbl_job_histories (employee, start_date, end_date, status, job, department) VALUES 
(1, '2020-01-15', '2021-01-15', 'active', 'J001', 1),
(2, '2019-03-10', '2020-03-10', 'inactive', 'J002', 2),
(3, '2018-05-20', '2019-05-20', 'inactive', 'J003', 3),
(4, '2021-07-30', '2022-07-30', 'active', 'J004', 4),
(5, '2017-09-25', '2018-09-25', 'inactive', 'J005', 5);

-- Insert into tbl_accounts
INSERT INTO tbl_accounts (id, username, password, otp, is_expired, is_used) VALUES 
(1, 'john.doe', 'password123', 123456, 0, '2024-06-15 10:00:00'),
(2, 'jane.smith', 'password123', 123457, 0, '2024-06-15 10:00:00'),
(3, 'sam.brown', 'password123', 123458, 0, '2024-06-15 10:00:00'),
(4, 'sue.green', 'password123', 123459, 0, '2024-06-15 10:00:00'),
(5, 'tom.white', 'password123', 123460, 0, '2024-06-15 10:00:00');


-- Insert into tbl_roles
INSERT INTO tbl_roles (id, name) VALUES 
(1, 'Super Admin'),
(2, 'Admin'),
(3, 'Manajer'),
(4, 'Employee');

-- Insert into tbl_account_roles
INSERT INTO tbl_account_roles (id, account, role) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 3),
(5, 5, 4);

-- Insert into tbl_permissions
INSERT INTO tbl_permissions (id, name) VALUES 
(1, 'Create'),
(2, 'Delete'),
(3, 'Update'),
(4, 'View');

-- Insert into tbl_role_permissions
INSERT INTO tbl_role_permissions (id, role, permission) VALUES 
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 1),
(6, 2, 3),
(7, 2, 4),
(8, 3, 1),
(9, 3, 3),
(10, 3, 4),
(11, 4, 3),
(12, 4, 4);

-- Insert into tbl_kpi
INSERT INTO tbl_kpi (id, kpi_name, description, target, assigned_date, due_date, status) VALUES 
(1, 'Sales Target', 'Achieve 100 sales', 100.0, '2024-01-01', '2024-12-31', 'ongoing'),
(2, 'Customer Satisfaction', 'Maintain 90% satisfaction', 90.0, '2024-01-01', '2024-12-31', 'ongoing');

-- Insert into tbl_employee_kpi
INSERT INTO tbl_employee_kpi (id, employee_id, kpi_id, assigned_date, due_date, status) VALUES 
(1, 1, 1, '2024-01-01', '2024-12-31', 'ongoing'),
(2, 2, 2, '2024-01-01', '2024-12-31', 'ongoing');

-- Insert into tbl_performance_report
INSERT INTO tbl_performance_report (id, employee_kpi_id, record_date, actual_value, comments) VALUES 
(1, 1, '2024-06-01', '2024-08-10', 'On track'),
(2, 2, '2024-06-01', '2024-10-12', 'Slightly below target');

-- Insert into tbl_feedback
INSERT INTO tbl_feedback (id, employee_id, manager_id, feedback_date, feedback_text, rating) VALUES 
(1, 1, 2, '2024-06-15', 'Great work!', 5),
(2, 2, 3, '2024-06-15', 'Needs improvement.', 3);

-- UPDATE TBL ACCOUNTS WITH HASHBYTES
UPDATE tbl_accounts
SET password = HASHBYTES('SHA2_256', 'password123')
WHERE username = 'john.doe';

UPDATE tbl_accounts
SET password = HASHBYTES('SHA2_256', 'password123')
WHERE username = 'jane.smith';

UPDATE tbl_accounts
SET password = HASHBYTES('SHA2_256', 'password123')
WHERE username = 'sam.brown';

UPDATE tbl_accounts
SET password = HASHBYTES('SHA2_256', 'password123')
WHERE username = 'sue.green';

UPDATE tbl_accounts
SET password = HASHBYTES('SHA2_256', 'password123')
WHERE username = 'tom.white';
