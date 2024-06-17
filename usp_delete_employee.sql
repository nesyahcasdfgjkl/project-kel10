CREATE PROCEDURE usp_delete_employee
    @id INT
AS
BEGIN 

    DELETE FROM tbl_employees
    WHERE
        id = @id;
	
    -- Menyertakan log atau pesan output
    SELECT 'Employee deleted successfully' AS Message;
END;