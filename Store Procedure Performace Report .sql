-- store procedure Performance Report
CREATE OR ALTER PROCEDURE AddNewPerformanceReport
    @id INT,
	@employeeKPI_id INT,
	@record_date DATE,
	@actual_value DATE,
	@comments TEXT
AS
BEGIN
	DECLARE @message VARCHAR(100)
	SET @message = 'Terdapat duplikat data id performance Report, silahkan cek kembali';
-- Isi dari stored procedure
	IF NOT EXISTS (SELECT 1 FROM tbl_performance_report WHERE id = @id)
	BEGIN
		INSERT INTO tbl_performance_report(id,employee_kpi_id,record_date,actual_value,comments)
		VALUES (@id,@employeeKPI_id,@record_date,@actual_value,@comments);
		--setelah insert akan ditampilkan datanya
		SELECT id,employee_kpi_id,record_date,actual_value,comments 
		FROM tbl_performance_report Where id=@id;
	END
	ELSE
	BEGIN
		PRINT @message
	END
END;
--Pemanggilan/penggunaan Store Procedur
EXEC AddNewPerformanceReport 3,2,'2024-10-01','2024-10-01','Slightly below target';


-- store procedure UpdatePerformanceReport
CREATE OR ALTER PROCEDURE UpdatePerformanceReport
    @id INT,
	@employeeKPI_id INT,
	@record_date DATE,
	@actual_value DATE,
	@comments TEXT
AS
BEGIN
	DECLARE @message VARCHAR(50);
    SET @message = 'Inputan id salah!!';
    
    IF NOT EXISTS (SELECT 1 FROM tbl_performance_report WHERE id = @id)
    BEGIN
        PRINT @message;
    END
    ELSE
    BEGIN
		UPDATE tbl_performance_report
		 SET
			id = @id,
			employee_kpi_id = @employeeKPI_id,
			record_date = @record_date,
			actual_value= @actual_value,
			comments = @comments  
			WHERE id = @id;
        SELECT * FROM tbl_performance_report WHERE id = @id;
    END
END;
--Pemanggilan/penggunaan Store Procedur
EXEC UpdatePerformanceReport 8,1,'2024-10-01','2024-10-01','Slightly below target';



-- store procedure DeletePerformanceReport
CREATE OR ALTER PROCEDURE DeletePerformanceReport
    @id int
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @message VARCHAR(100)
    
    IF EXISTS (SELECT 1 FROM tbl_performance_report WHERE id = @id)
    BEGIN
		DELETE FROM tbl_performance_report WHERE id = @id ;
        SET @message = 'Data dengan Id ' + CAST(@id AS VARCHAR) + ' BERHASIL dihapus';
    END
    ELSE
    BEGIN
        SET @message = 'Data dengan Id ' + CAST(@id AS VARCHAR) + ' TIDAK BERHASIL dihapus. DATA TIDAK DITEMUKAN';
    END
	PRINT @message;
END;
--Pemanggilan/penggunaan Store Procedur
EXEC DeletePerformanceReport 3;