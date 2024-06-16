CREATE PROCEDURE usp_create_employee
    @first_name VARCHAR(25),
    @last_name VARCHAR(25),
    @gender VARCHAR(10),
    @email VARCHAR(25),
    @phone VARCHAR(20),
    @hire_date DATE,
    @salary INT,
    @manager INT,
    @job VARCHAR(10),
    @department INT
AS
BEGIN
    -- Cek apakah email sudah ada
    IF EXISTS (SELECT 1 FROM tbl_employees WHERE email = @email)
    BEGIN
        RAISERROR ('Email already exists', 16, 1);
        RETURN;
    END

    -- Cek apakah manajer ada
    IF @manager IS NOT NULL AND NOT EXISTS (SELECT 1 FROM tbl_employees WHERE id = @manager)
    BEGIN
        RAISERROR ('Manager does not exist', 16, 1);
        RETURN;
    END

    -- Cek apakah job ada
    IF NOT EXISTS (SELECT 1 FROM tbl_jobs WHERE id = @job)
    BEGIN
        RAISERROR ('Job does not exist', 16, 1);
        RETURN;
    END

    -- Cek apakah departemen ada
    IF NOT EXISTS (SELECT 1 FROM tbl_departments WHERE id = @department)
    BEGIN
        RAISERROR ('Department does not exist', 16, 1);
        RETURN;
    END

    -- Insert the new employee
    INSERT INTO tbl_employees (first_name, last_name, gender, email, phone, hire_date, salary, manager, job, department)
    VALUES (@first_name, @last_name, @gender, @email, @phone, @hire_date, @salary, @manager, @job, @department);
END;