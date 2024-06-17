
--Store Procedure Add New Data Job
CREATE OR ALTER PROCEDURE AddNewDataJob
    @idJob varchar(10),
	@titleJob varchar(35),
	@min_salary int,
	@max_salary int
    
AS
BEGIN
    -- Isi dari stored procedure
    INSERT INTO tbl_jobs ( id,title, min_salary,max_salary)
    VALUES ( @idJob,@titleJob,@min_salary,@max_salary);

	--setelah insert akan ditampilkan datanya
	SELECT id,title,min_salary,max_salary FROM tbl_jobs

END;
--Pemanggilan/penggunaan Store Procedur
EXEC AddNewDataJob 'J006','Manager',65000,125000;
EXEC AddNewDataJob 'J007', 'Manager', 75000, 95000;

--Store Procedure Update Data Job
CREATE OR ALTER PROCEDURE UpdateJob
    @JobID VARCHAR(10),
    @Title VARCHAR(35),
    @MinSalary INT,
    @MaxSalary INT
AS
BEGIN
    DECLARE @message VARCHAR(30);
    SET @message = 'Inputan id salah';
    
    SET NOCOUNT ON;

    UPDATE tbl_jobs
    SET
        title = @Title,
        min_salary = @MinSalary,
        max_salary = @MaxSalary
    WHERE
        id = @JobID;

    IF NOT EXISTS (SELECT 1 FROM tbl_jobs WHERE id = @JobID)
    BEGIN
        PRINT @message;
    END
    ELSE
    BEGIN
        SELECT * FROM tbl_jobs WHERE id = @JobID;
    END
END;

EXEC UpdateJob 'J006', 'Manager', 68000, 90000;
SELECT * FROM tbl_jobs;


--Store Procedure Delete Job
CREATE OR ALTER PROCEDURE DeleteJob
    @JobID VARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @message VARCHAR(100)
    
    IF EXISTS (SELECT 1 FROM tbl_jobs WHERE id = @JobID)
    BEGIN
		DELETE FROM tbl_jobs WHERE id = @JobID ;
        SET @message = 'Data dengan Id Job ' + @JobID + ' BERHASIL dihapus';
    END
    ELSE
    BEGIN
        SET @message = 'Data dengan Id Job ' + @JobID + ' TIDAK BERHASIL dihapus';
    END
	PRINT @message;

END;

EXEC DeleteJob 'J007';
SELECT * FROM tbl_jobs;