CREATE PROCEDURE usp_update_employee
	@id INT, 
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
    SET NOCOUNT ON; 

    UPDATE tbl_employees
    SET
        first_name = @first_name,
        last_name = @last_name,
        gender = @gender,
        email = @email,
		input_password = @input_password,
		password_confirm = @password_confirm,
        phone = @phone,
        hire_date = @hire_date,
        salary = @salary,
        manager = @manager,
        job = @job,
        department = @department
    WHERE
        id = @id;

    -- Menyertakan log atau pesan output
    SELECT 'Employee data updated successfully' AS Message;
END;


