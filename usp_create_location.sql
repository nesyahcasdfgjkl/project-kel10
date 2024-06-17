CREATE PROCEDURE usp_create_location 
	@street_address VARCHAR(40),
	@postal_code VARCHAR(12),
	@city VARCHAR(30),
	@state_province VARCHAR(25),
	@country CHAR(3)
AS
BEGIN 
	-- cek apakah postal code sesuai format
	IF dbo.func_postal_code(@postal_code) = 0
	BEGIN
		PRINT 'Postal code hanya mengandung angka';
		RETURN;
	END

	-- insert data ke tabel locations
	INSERT INTO tbl_locations (street_address, postal_code, city, state_province, country)
    VALUES (@street_address, @postal_code, @city, @state_province, @country);
END;
	
