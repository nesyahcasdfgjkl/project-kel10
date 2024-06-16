CREATE DATABASE employee;

CREATE TABLE tbl_countries (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    region INT NOT NULL
);

CREATE TABLE tbl_regions (
    id INT PRIMARY KEY,
    name VARCHAR(25) NOT NULL
);

CREATE TABLE tbl_locations (
    id INT PRIMARY KEY,
    street_address VARCHAR(40),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(25),
    country CHAR(3) NOT NULL,
    FOREIGN KEY (country) REFERENCES tbl_countries(id)
);

CREATE TABLE tbl_departments (
    id INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    location INT NOT NULL,
    FOREIGN KEY (location) REFERENCES tbl_locations(id)
);

CREATE TABLE tbl_jobs (
    id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(35) NOT NULL,
    min_salary INT,
    max_salary INT
);

CREATE TABLE tbl_employees (
    id INT PRIMARY KEY,
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

CREATE TABLE tbl_accounts (
    id INT PRIMARY KEY,
    username VARCHAR(25),
    password VARCHAR(255) NOT NULL,
    otp INT,
    is_expired BIT,
    is_used DATETIME,
    FOREIGN KEY (id) REFERENCES tbl_employees(id)
);

CREATE TABLE tbl_roles (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_account_roles (
    id INT PRIMARY KEY,
    account INT NOT NULL,
    role INT NOT NULL,
    FOREIGN KEY (account) REFERENCES tbl_accounts(id),
    FOREIGN KEY (role) REFERENCES tbl_roles(id)
);

CREATE TABLE tbl_permissions (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_role_permissions (
    id INT PRIMARY KEY,
    role INT NOT NULL,
    permission INT NOT NULL,
    FOREIGN KEY (role) REFERENCES tbl_roles(id),
    FOREIGN KEY (permission) REFERENCES tbl_permissions(id)
);

CREATE TABLE tbl_kpi (
    id INT PRIMARY KEY,
    kpi_name VARCHAR(100) NOT NULL,
    description TEXT,
    target FLOAT,
    assigned_date DATE,
    due_date DATE,
    status VARCHAR(50)
);

CREATE TABLE tbl_employee_kpi (
    id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    kpi_id INT NOT NULL,
    assigned_date DATE,
    due_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES tbl_employees(id),
    FOREIGN KEY (kpi_id) REFERENCES tbl_kpi(id)
);

CREATE TABLE tbl_performance_report (
    id INT PRIMARY KEY,
    employee_kpi_id INT NOT NULL,
    record_date DATE,
    actual_value DATE,
    comments TEXT,
    FOREIGN KEY (employee_kpi_id) REFERENCES tbl_employee_kpi(id)
);

CREATE TABLE tbl_feedback (
    id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    manager_id INT NOT NULL,
    feedback_date DATE,
    feedback_text TEXT,
    rating INT,
    FOREIGN KEY (employee_id) REFERENCES tbl_employees(id),
    FOREIGN KEY (manager_id) REFERENCES tbl_employees(id)
);

USE master;
DROP DATABASE employee;


