--------------------------------- CREATE ----------------------------------
exec dbo.usp_create_role 
	@name = 'admin1';

select * from tbl_roles;

--------------------------------- UPDATE ----------------------------------
exec dbo.usp_update_role 
	@id = 2,
	@name = 'Admin';
select * from tbl_roles;

--------------------------------- DELETE ----------------------------------

exec dbo.usp_delete_role
	@id = 5;
select * from tbl_roles;