EXEC usp_update_employee
    @id = 1,
    @first_name = 'John',
    @last_name = 'Doe',
    @gender = 'Male',
    @email = 'john.doe@example.com',
    @phone = '555-1234',
    @hire_date = '2023-01-01',
    @salary = 60000,
    @manager = NULL,  -- NULL jika tidak ada manager
    @job = 'J001',    -- Sesuaikan dengan job ID yang valid
    @department = 1;  -- Sesuaikan dengan department ID yang valid


select * from tbl_employees