-- MENAMBAHKAN DATA DI TABEL ROLE
INSERT INTO tbl_roles (name) VALUES
	('Super Admin'),
	('Admin'),
	('Manager'),
	('Employee');


-- MENAMBAHKAN DATA DI TABEL PERMISSIONS
INSERT INTO tbl_permissions (name) VALUES 
	('Create'),
	('Update'),
	('Delete'),
	('View');

-- MENAMBAHKAN DATA DI TABEL ROLE PERMISSIONS
INSERT INTO tbl_role_permissions (role, permission) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(2, 1),
	(2, 2),
	(2, 3),
	(3, 2),
	(3, 4),
	(4, 4);

-- MENAMBAHKAN DATA DI TABEL REGION
INSERT INTO tbl_regions (name) VALUES
	('North America'),
	('Europe'),
	('Asia');

-- MENAMBAHKAN DATA DI TABEL COUNTRY
INSERT INTO tbl_countries (id, name, region) VALUES 
	('USA', 'United States', 1),
	('CAN', 'Canada', 1),
	('GBR', 'United Kingdom', 2),
	('DEU', 'Germany', 2),
	('CHN', 'China', 3),
	('JPN', 'Japan', 3);

-- MENAMBAHKAN DATA DI TABEL LOCATION
INSERT INTO tbl_locations (street_address, postal_code, city, state_province, country) VALUES 
('123 Main St', '12345', 'New York', 'NY', 'USA'),
('456 Maple Dr', '54321', 'Toronto', 'ON', 'CAN'),
('789 Elm St', '67890', 'London', 'LDN', 'GBR'),
('321 Oak Ave', '09876', 'Berlin', 'BE', 'DEU'),
('654 Pine Rd', '11223', 'Beijing', 'BJ', 'CHN'),
('987 Cedar Blvd', '44556', 'Tokyo', 'TK', 'JPN');


-- MENAMBAHKAN DATA DI TABEL DEPARTMENT 
INSERT INTO tbl_departments (name, location) VALUES 
('HR', 1),
('Finance', 2),
('IT', 3),
('Sales', 4),
('Marketing', 5),
('R&D', 6);

-- MENAMBAHKAN DATA DI TABEL JOB
INSERT INTO tbl_jobs (id, title, min_salary, max_salary) VALUES 
('J001', 'Manager', 60000, 120000),
('J002', 'Engineer', 50000, 100000),
('J003', 'Analyst', 40000, 80000),
('J004', 'Clerk', 30000, 60000),
('J005', 'Director', 80000, 160000);

-- MENAMBAHKAN DATA DI TABEL EMPLOYEE
INSERT INTO tbl_employees (first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department) VALUES 
('John', 'Doe', 'Male', 'john.doe@example.com', '123-456-7890', '2020-01-15', 70000, NULL, 'J001', 1),
('Jane', 'Smith', 'Female', 'jane.smith@example.com', '234-567-8901', '2019-03-10', 80000, 1, 'J002', 2),
('Sam', 'Brown', 'Male', 'sam.brown@example.com', '345-678-9012', '2018-05-20', 60000, 1, 'J003', 3),
('Sue', 'Green', 'Female', 'sue.green@example.com', '456-789-0123', '2021-07-30', 50000, 2, 'J004', 4),
('Tom', 'White', 'Male', 'tom.white@example.com', '567-890-1234', '2017-09-25', 90000, 2, 'J005', 5);


-- MENAMBAHKAN DATA DI TABEL ACCOUNTS
INSERT INTO tbl_accounts (employee, username, password, otp, is_expired, is_used) VALUES 
(1, 'john.doe', HASHBYTES('SHA2_256', 'password123'), 123456, 0, '2024-06-15 10:00:00'),
(2, 'jane.smith',HASHBYTES('SHA2_256', 'password123'), 123457, 0, '2024-06-15 10:00:00'),
(3, 'sam.brown', HASHBYTES('SHA2_256', 'password123'), 123458, 0, '2024-06-15 10:00:00'),
(4, 'sue.green', HASHBYTES('SHA2_256', 'password123'), 123459, 0, '2024-06-15 10:00:00'),
(5, 'tom.white', HASHBYTES('SHA2_256', 'password123'), 123460, 0, '2024-06-15 10:00:00');

-- MENAMBAHKAN DATA DI TABEL ACCOUNT ROLE
INSERT INTO tbl_account_roles (account, role) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 4);

-- MENAMBAHKAN DATA DI TABEL JOB HISTORIES
INSERT INTO tbl_job_histories (employee, start_date, end_date, status, job, department) VALUES 
(1, '2020-01-15', '2021-01-15', 'active', 'J001', 1),
(2, '2019-03-10', '2020-03-10', 'inactive', 'J002', 2),
(3, '2018-05-20', '2019-05-20', 'inactive', 'J003', 3),
(4, '2021-07-30', '2022-07-30', 'active', 'J004', 4),
(5, '2017-09-25', '2018-09-25', 'inactive', 'J005', 5);

-- MENAMBAHKAN DATA DI TABEL KPI
INSERT INTO tbl_kpi (kpi_name, description, target, assigned_date, due_date, status) VALUES 
('Sales Target', 'Achieve 100 sales', 100.0, '2024-01-01', '2024-12-31', 'ongoing'),
('Customer Satisfaction', 'Maintain 90% satisfaction', 90.0, '2024-01-01', '2024-12-31', 'ongoing');

-- MENAMBAHKAN DATA DI TABEL EMPLOYEE KPI
INSERT INTO tbl_employee_kpi (employee_id, kpi_id, assigned_date, due_date, status) VALUES 
(1, 1, '2024-01-01', '2024-12-31', 'ongoing'),
(2, 2, '2024-01-01', '2024-12-31', 'ongoing');

-- MENAMBAKAN DATA DI TABEL PERFORMANCE REPORT
INSERT INTO tbl_performance_report (employee_kpi_id, record_date, actual_value, comments) VALUES 
(1, '2024-06-01', '2023-12-05', 'On track'),
(2, '2024-06-01', '2023-10-04', 'Slightly below target');

-- MENAMBAHKAN DATA DI TABEL FEEDBACK
INSERT INTO tbl_feedback (employee_id, manager_id, feedback_date, feedback_text, rating) VALUES 
(1, 2, '2024-06-15', 'Great work!', 5),
(2, 3, '2024-06-15', 'Needs improvement.', 3);

