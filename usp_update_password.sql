CREATE PROCEDURE usp_update_password
    @employee_id INT,
    @new_password VARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @hashed_password VARCHAR(255);
    SET @hashed_password = HASHBYTES('SHA2_256', @new_password);

    UPDATE tbl_employees
    SET input_password = @hashed_password
    WHERE id = @employee_id;

    SELECT 'Password updated successfully' AS [Message];
END;
