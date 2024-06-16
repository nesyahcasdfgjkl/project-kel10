-- MEMBUAT TABEL ROLE
CREATE TABLE tbl_roles (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

select * from tbl_roles;

-- MEMBUAT TABEL PERMISSION
CREATE TABLE tbl_permissions(
	id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

select * from tbl_permissions;

-- MEMBUAT TABEL ROLE PERMISSION
CREATE TABLE tbl_role_permissions (
    id INT IDENTITY(1,1) PRIMARY KEY,
    role INT NOT NULL,
    permission INT NOT NULL,
    FOREIGN KEY (role) REFERENCES tbl_roles(id),
    FOREIGN KEY (permission) REFERENCES tbl_permissions(id)
);
select * from tbl_role_permissions;

-- MEMBUAT TABEL REGIONS
CREATE TABLE tbl_regions (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(25) NOT NULL
);

-- MEMBUAT TABEL COUNTRY
CREATE TABLE tbl_countries (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    region INT NOT NULL
	FOREIGN KEY (region) REFERENCES tbl_regions(id)
);
select * from tbl_countries;
drop table tbl_countries

-- MEMBUAT TABEL LOCATION
CREATE TABLE tbl_locations (
    id INT IDENTITY(1,1) PRIMARY KEY,
    street_address VARCHAR(40),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(25),
    country CHAR(3) NOT NULL,
    FOREIGN KEY (country) REFERENCES tbl_countries(id)
);
select * from tbl_locations

-- MEMBUAT TABEL DEPARTMENT
CREATE TABLE tbl_departments (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    location INT NOT NULL,
    FOREIGN KEY (location) REFERENCES tbl_locations(id)
);

-- MEMBUAT TABEL JOB
CREATE TABLE tbl_jobs (
    id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(35) NOT NULL,
    min_salary INT,
    max_salary INT
);

-- MEMBUAT TABEL EMPLOYEE
CREATE TABLE tbl_employees (
    id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    gender VARCHAR(10),
    email VARCHAR(25) UNIQUE NOT NULL,
    phone VARCHAR(20),
    hire_date DATE NOT NULL,
    salary INT NOT NULL,
    manager INT,
    job VARCHAR(10) NOT NULL,
    department INT NOT NULL,
    FOREIGN KEY (manager) REFERENCES tbl_employees(id),
    FOREIGN KEY (job) REFERENCES tbl_jobs(id),
    FOREIGN KEY (department) REFERENCES tbl_departments(id)
);

-- MEMBUAT TABEL ACCOUNT
CREATE TABLE tbl_accounts (
    employee INT PRIMARY KEY,
    username VARCHAR(25),
    password VARCHAR(255) NOT NULL,
    otp INT,
    is_expired BIT,
    is_used DATETIME,
    FOREIGN KEY (employee) REFERENCES tbl_employees(id)
);
DROP TABLE tbl_accounts

-- MEMBUAT TABEL ACCOUNT ROLES
CREATE TABLE tbl_account_roles (
    id INT IDENTITY(1,1) PRIMARY KEY,
    account INT NOT NULL,
    role INT NOT NULL,
    FOREIGN KEY (account) REFERENCES tbl_accounts(employee),
    FOREIGN KEY (role) REFERENCES tbl_roles(id)
);

-- MEMBUAT TABEL JOB HISTORIES
CREATE TABLE tbl_job_histories (
    employee INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(10),
    job VARCHAR(10) NOT NULL,
    department INT NOT NULL,
    PRIMARY KEY (employee, start_date),
    FOREIGN KEY (employee) REFERENCES tbl_employees(id),
    FOREIGN KEY (job) REFERENCES tbl_jobs(id),
    FOREIGN KEY (department) REFERENCES tbl_departments(id)
);

-- MEMBUAT TABEL KPI
CREATE TABLE tbl_kpi (
    id INT IDENTITY(1,1) PRIMARY KEY,
    kpi_name VARCHAR(100) NOT NULL,
    description TEXT,
    target FLOAT,
    assigned_date DATE,
    due_date DATE,
    status VARCHAR(50)
);
DROP TABLE tbl_kpi

-- MEMBUAT TABEL EMPLOYEE KPI
CREATE TABLE tbl_employee_kpi (
    id INT IDENTITY(1,1) PRIMARY KEY,
    employee_id INT NOT NULL,
    kpi_id INT NOT NULL,
    assigned_date DATE,
    due_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES tbl_employees(id),
    FOREIGN KEY (kpi_id) REFERENCES tbl_kpi(id)
);
DROP TABLE tbl_employee_kpi

-- MEMBUAT TABEL LAPORAN KINERJA
CREATE TABLE tbl_performance_report (
    id INT IDENTITY(1,1) PRIMARY KEY,
    employee_kpi_id INT NOT NULL,
    record_date DATE,
    actual_value DATE,
    comments TEXT,
    FOREIGN KEY (employee_kpi_id) REFERENCES tbl_employee_kpi(id)
);
drop table tbl_performance_report

-- MEMBUAT TABEL FEEDBACK
CREATE TABLE tbl_feedback (
    id INT IDENTITY(1,1) PRIMARY KEY,
    employee_id INT NOT NULL,
    manager_id INT NOT NULL,
    feedback_date DATE,
    feedback_text TEXT,
    rating INT,
    FOREIGN KEY (employee_id) REFERENCES tbl_employees(id),
    FOREIGN KEY (manager_id) REFERENCES tbl_employees(id)
);
drop table tbl_feedback




