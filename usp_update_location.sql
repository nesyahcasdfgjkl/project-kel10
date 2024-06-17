CREATE PROCEDURE usp_update_location
	@id INT,
	@street_address VARCHAR(40),
	@postal_code VARCHAR(12),
	@city VARCHAR(30),
	@state_province VARCHAR(25),
	@country CHAR(3)
AS
BEGIN

    UPDATE tbl_locations
    SET
        street_address = @street_address,
        postal_code = @postal_code,
        city = @city,
		state_province = @state_province,
		country = @country
    WHERE
        id = @id;

    -- Menyertakan log atau pesan output
    SELECT 'Location data updated successfully' AS Message;
END;


