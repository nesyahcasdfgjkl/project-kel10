CREATE TRIGGER tr_insert_employee
ON tbl_employees
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO tbl_job_histories (employee, start_date, end_date, status, job, department)
    SELECT 
        i.id,             
        i.hire_date,      
        NULL,             
        'Active',         
        i.job,            
        i.department      
    FROM inserted i;
END;

---- TEST ----
EXEC dbo.usp_create_employee
    @first_name = 'Nadia',
    @last_name = 'Arianesya',
    @gender = 'female',
    @email = 'nesya@example.com',
	@input_password = 'Password12#',
	@password_confirm = 'Password12#',
    @phone = '230543',
    @hire_date = '2024-06-16',
    @salary = 3000000,
    @manager = 1, 
    @job = 'J002',
    @department = 2;
GO

select * from tbl_job_histories

