CREATE TRIGGER tr_update_employee_job
ON tbl_employees
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(job)
    BEGIN
        INSERT INTO tbl_job_histories (employee, start_date, end_date, status, job, department)
        SELECT 
            i.id,                 -- Employee ID from the inserted row
            i.hire_date,          -- Start date as the hire date
            GETDATE(),            -- End date as the current date
            'Hand Over',          -- Status set to 'Hand Over'
            d.job,                -- Job from the deleted row
            d.department          -- Department from the deleted row
        FROM inserted i
        JOIN deleted d ON i.id = d.id;
    END
END;