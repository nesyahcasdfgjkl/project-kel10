CREATE PROCEDURE usp_create_employee
    @first_name VARCHAR(25),
    @last_name VARCHAR(25),
    @gender VARCHAR(10),
    @email VARCHAR(25),
	@input_password VARCHAR(255),
	@password_confirm VARCHAR(255),
    @phone VARCHAR(20),
    @hire_date DATE,
    @salary INT,
    @manager INT,
    @job VARCHAR(10),
    @department INT
AS
BEGIN
	 -- Cek apakah password sesuai format
	IF dbo.func_password_policy(@input_password) = 0
	BEGIN
		PRINT 'Password tidak sesuai format';
		RETURN;
	END

    -- Cek apakah gender yang diinput benar
	IF dbo.func_gender(@gender) = 0
	BEGIN
		PRINT 'Gender tidak sesuai';
		RETURN;
	END

	-- Cek apakah email sesuai dengan format
	IF dbo.func_email_format(@email) = 0
	BEGIN
		PRINT 'Email tidak sesuai format';
		RETURN;
	END

	-- Cek apakah email sesuai dengan format
	IF dbo.func_phone(@phone) = 0
	BEGIN
		PRINT 'Phone tidak sesuai format';
		RETURN;
	END

	-- Cek apakah email sesuai dengan format
	IF dbo.func_password_match(@input_password, @password_confirm) = 0
	BEGIN
		PRINT 'Password tidak cocok';
		RETURN;
	END

	-- Cek apakah manager id ada
	 IF @manager IS NOT NULL AND NOT EXISTS (SELECT 1 FROM tbl_employees WHERE id = @manager)
    BEGIN
        PRINT 'Manager ID not found!';
        RETURN;
    END

	-- Cek apakah salary tidak kurang atau lebih
	IF dbo.func_salary(@salary) = 0
	BEGIN
		PRINT 'Salary tidak sesuai format';
		RETURN;
	END


    -- Insert the new employee
    INSERT INTO tbl_employees (first_name, last_name, gender, email, input_password, password_confirm, phone, hire_date, salary, manager, job, department)
    VALUES (@first_name, @last_name, @gender, @email, @input_password, @password_confirm, @phone, @hire_date, @salary, @manager, @job, @department);
END;

