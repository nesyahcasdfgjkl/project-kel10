CREATE PROCEDURE usp_create_employee_kpi
    @employee_id INT,
    @kpi_id INT,
    @assigned_date DATE,
    @due_date DATE,
    @status VARCHAR(50)
AS
BEGIN
    DECLARE @emp_count INT;
    DECLARE @kpi_count INT;

    -- Cek apakah employee id ada
    SELECT @emp_count = COUNT(*)
    FROM tbl_employees
    WHERE id = @employee_id;

    IF @emp_count = 0
    BEGIN
        PRINT 'Employee ID tidak ditemukan';
        RETURN;
    END

    -- Cek apakah kpi id ada
    SELECT @kpi_count = COUNT(*)
    FROM tbl_kpi
    WHERE id = @kpi_id;

    IF @kpi_count = 0
    BEGIN
        PRINT 'KPI ID tidak ditemukan';
        RETURN;
    END

    -- Insert data ke tbl_employee_kpi
    INSERT INTO tbl_employee_kpi (employee_id, kpi_id, assigned_date, due_date, status)
    VALUES (@employee_id, @kpi_id, @assigned_date, @due_date, @status);
END;
