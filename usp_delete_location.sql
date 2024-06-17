CREATE PROCEDURE usp_delete_location
    @id INT
AS
BEGIN
    SET NOCOUNT ON; 

    DELETE FROM tbl_locations
    WHERE
        id = @id;

    -- Menyertakan log atau pesan output
    SELECT 'Location deleted successfully' AS Message;
END;