CREATE TRIGGER tr_delete_employee
ON tbl_employees
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO tbl_job_histories (employee, start_date, end_date, status, job, department)
    SELECT 
        d.id,             -- Employee ID from the deleted row
        d.hire_date,      -- Start date as the hire date
        GETDATE(),        -- End date as the current date
        'Resign',         -- Status set to 'Resign'
        d.job,            -- Job from the deleted row
        d.department      -- Department from the deleted row
    FROM deleted d;
END;