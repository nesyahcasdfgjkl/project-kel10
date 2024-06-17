
--------------------------------- CREATE ---------------------------------------------
-- Sesuai semua --
EXEC dbo.usp_create_employee
    @first_name = 'Alice',
    @last_name = 'Johnson',
    @gender = 'male',
    @email = 'alicejohnson@example.com',
	@input_password = 'Password12#',
	@password_confirm = 'Password12#',
    @phone = '5551234',
    @hire_date = '2024-06-16',
    @salary = 2000000,
    @manager = 1, 
    @job = 'J001',
    @department = 1;


-- Password tidak sesuai --
EXEC dbo.usp_create_employee
    @first_name = 'Alice',
    @last_name = 'Johnson',
    @gender = 'Female',
    @email = 'alice.johnson@example.com',
	@input_password = 'password123',
	@password_confirm = 'password123',
    @phone = '5551234',
    @hire_date = '2024-06-16',
    @salary = 2000000,
    @manager = 1,  
    @job = 'J001',         
    @department = 1;

-- Gender tidak sesuai --
EXEC dbo.usp_create_employee
    @first_name = 'Alice',
    @last_name = 'Johnson',
    @gender = 'Other',
    @email = 'alice.johnson@example.com',
	@input_password = 'Password12#',
	@password_confirm = 'Password12#',
    @phone = '5551234',
    @hire_date = '2024-06-16',
    @salary = 2000000,
    @manager = 1,  
    @job = 'J001',         
    @department = 1;

-- Email tidak sesuai --
EXEC dbo.usp_create_employee
    @first_name = 'Alice',
    @last_name = 'Johnson',
    @gender = 'Female',
    @email = 'alice.johnsonxample.com',
	@input_password = 'Password12#',
	@password_confirm = 'Password12#',
    @phone = '5551234',
    @hire_date = '2024-06-16',
    @salary = 2000000,
    @manager = 1,  
    @job = 'J001',         
    @department = 1;

-- Phone tidak sesuai --
EXEC dbo.usp_create_employee
    @first_name = 'Alice',
    @last_name = 'Johnson',
    @gender = 'Female',
    @email = 'alice.johnson@example.com',
	@input_password = 'Password12#',
	@password_confirm = 'Password12#',
    @phone = '555A123',
    @hire_date = '2024-06-16',
    @salary = 2000000,
    @manager = 1,  
    @job = 'J001',         
    @department = 1;

-- Password tidak cocok --
EXEC dbo.usp_create_employee
    @first_name = 'Alice',
    @last_name = 'Johnson',
    @gender = 'Female',
    @email = 'alice.johnson@example.com',
	@input_password = 'Password12#',
	@password_confirm = 'Password#',
    @phone = '5551234',
    @hire_date = '2024-06-16',
    @salary = 2000000,
    @manager = 1,  
    @job = 'J001',         
    @department = 1;

-- Manager tidak ditemukan --
EXEC dbo.usp_create_employee
    @first_name = 'Alice',
    @last_name = 'Johnson',
    @gender = 'Female',
    @email = 'alice.johnson@example.com',
	@input_password = 'Password12#',
	@password_confirm = 'Password12#',
    @phone = '5551234',
    @hire_date = '2024-06-16',
    @salary = 2000000,
    @manager = 10,  
    @job = 'J001',         
    @department = 1;

-- Salary tidak sesuai --
EXEC dbo.usp_create_employee
    @first_name = 'Alice',
    @last_name = 'Johnson',
    @gender = 'Female',
    @email = 'alice.johnson@example.com',
	@input_password = 'Password12#',
	@password_confirm = 'Password12#',
    @phone = '5551234',
    @hire_date = '2024-06-16',
    @salary = 12000000,
    @manager = 1,  
    @job = 'J001',         
    @department = 1;


select * from tbl_employees

--------------------------------- UPDATE ---------------------------------------------
EXEC dbo.usp_update_employee
	@id = 9,
    @first_name = 'Alice',
    @last_name = 'Johnson',
    @gender = 'male',
    @email = 'alicejohnson@example.com',
	@input_password = 'Password12#',
	@password_confirm = 'Password12#',
    @phone = '123456',
    @hire_date = '2024-06-16',
    @salary = 1500000,
    @manager = 1, 
    @job = 'J001',
    @department = 1;

select * from tbl_employees


--------------------------------- DELETE ---------------------------------------------
EXEC dbo.usp_delete_employee
    @id = 9;  -- ID dari karyawan yang ingin dihapus

select * from tbl_employees