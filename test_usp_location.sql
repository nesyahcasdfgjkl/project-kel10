---- CREATE ------
-- POSTAL CODE SESUAI --
EXEC dbo.usp_create_location
	@street_address = 'Jl. Melati',
	@postal_code = '12345',
	@city = 'New York',
	@state_province = 'NY',
	@country = 'USA'
SELECT * FROM tbl_locations

-- POSTAL CODE TIDAK SESUAI --
EXEC dbo.usp_create_location
	@street_address = 'Jl. mawar',
	@postal_code = '123AA',
	@city = 'New York',
	@state_province = 'NY',
	@country = 'USA'
SELECT * FROM tbl_locations

---- UPDATE ------
EXEC dbo.usp_update_location
	@id = 7,
	@street_address = 'Jl. Anggrek',
	@postal_code = '123AA',
	@city = 'Hiroshima',
	@state_province = 'Hokaido',
	@country = 'JPN'


select * from tbl_locations

---- DELETE ------
EXEC dbo.usp_delete_location
    @id = 8;  -- ID dari location yang ingin dihapus

select * from tbl_locations