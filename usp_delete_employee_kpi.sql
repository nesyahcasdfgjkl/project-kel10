CREATE PROCEDURE usp_delete_employee_kpi
    @id INT
AS
BEGIN
    -- Delete data di tbl_employee_kpi
	DELETE FROM tbl_employee_kpi
    WHERE
        id = @id;

    -- Menyertakan log atau pesan output
    SELECT 'Employee KPI deleted successfully' AS Message;
END;

