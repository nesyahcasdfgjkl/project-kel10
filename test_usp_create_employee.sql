EXEC dbo.usp_create_employee
    @first_name = 'Alice',
    @last_name = 'Johnson',
    @gender = 'Female',
    @email = 'alice.johnson@example.com',
    @phone = '555-1234',
    @hire_date = '2024-06-16',
    @salary = 70000,
    @manager = null,  -- Assuming Alice does not have a manager
    @job = J001,         -- Assuming 'Developer' job ID is 1
    @department = 1;

select * from tbl_employees