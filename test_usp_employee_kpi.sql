------------------------- CREATE ----------------------------------
EXEC dbo.usp_create_employee_kpi 
	@employee_id = 8 , 
	@kpi_id = 2,
    @assigned_date = '2023-10-04' ,
    @due_date = '2023-04-10' ,
    @status = 'ongoing';


-- Ketika employee_id tidak ada
EXEC dbo.usp_create_employee_kpi 
	@employee_id = 10 , 
	@kpi_id = 2,
    @assigned_date = '2023-10-04' ,
    @due_date = '2023-04-10' ,
    @status = 'ongoing';

-- Ketika kpi_id tidak ada
EXEC dbo.usp_create_employee_kpi 
	@employee_id = 8, 
	@kpi_id = 6,
    @assigned_date = '2023-10-04' ,
    @due_date = '2023-04-10' ,
    @status = 'ongoing';

select * from tbl_employee_kpi;

------------------------- UPDATE ----------------------------------
EXEC dbo.usp_update_employee_kpi 
	@id = 4,
	@employee_id = 8 , 
	@kpi_id = 2,
    @assigned_date = '2023-10-04' ,
    @due_date = '2023-04-10' ,
    @status = 'finished';

select * from tbl_employee_kpi;

------------------------- DELETE ----------------------------------
EXEC dbo.usp_delete_employee_kpi 
	@id = 3;

select * from tbl_employee_kpi;
