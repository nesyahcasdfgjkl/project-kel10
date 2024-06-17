CREATE OR ALTER PROCEDURE AddNewKPI
   	@idKPI INT,
	@nameKPI varchar(100),
	@descKPI text,
	@targetKPI float,
	@assignKPI date,
	@dueKPI date,
	@statKPI varchar(50)
AS
BEGIN
	DECLARE @message VARCHAR(100)
	SET @message = 'Terdapat duplikat data id KPI, silahkan cek kembali';

-- Isi dari stored procedure
	IF NOT EXISTS (SELECT 1 FROM tbl_kpi WHERE id = @idKPI)
	BEGIN
		INSERT INTO tbl_kpi(id,kpi_name,description,target,assigned_date,due_date,status)
		VALUES (@idKPI,@nameKPI,@descKPI,@targetKPI,@assignKPI,@dueKPI,@statKPI);

--setelah insert akan ditampilkan datanya
		SELECT id,kpi_name,description,target,assigned_date,due_date,status FROM tbl_kpi Where id=@idKPI;
	END
	ELSE
	BEGIN
		PRINT @message
	END
END;

--CALL STORED PROCEDURE
EXEC AddNewKPI 3, 'Mean Time to Repair', 'Measures the average time taken to repair a defect or issue in 5 hours', 5, '2024-02-01', '2024-02-02', 'on going';

SELECT * FROM tbl_kpi;


--UPDATE KPI
CREATE OR ALTER PROCEDURE updateKPI
    @idKPI INT,
	@nameKPI varchar(100),
	@descKPI text,
	@targetKPI float,
	@assignKPI date,
	@dueKPI date,
	@statKPI varchar(50)
AS
BEGIN
    DECLARE @message VARCHAR(50);
    SET @message = 'Inputan id salah!!';

    -- Check if the department ID exists
    IF NOT EXISTS (SELECT 1 FROM tbl_kpi WHERE id = @idKPI)
    BEGIN
        PRINT @message;
    END
    ELSE
    BEGIN
        -- Update the department details
        UPDATE tbl_kpi
        SET
			kpi_name = @nameKPI,
			description = @descKPI,
			target = @targetKPI,
			assigned_date = @assignKPI,
			due_date = @dueKPI,
			status = @statKPI
        WHERE id = @idKPI;

        -- Select the updated department details
        SELECT * FROM tbl_kpi WHERE id = @idKPI;
    END
END;

--CALL STORED PROCEDURE
EXEC updateKPI 3, 'Mean Time to Repair', 'Measures the average time taken to repair a defect or issue in 5 hours', 5, '2024-02-01', '2024-02-02', 'finished';


--DELETE KPI
CREATE OR ALTER PROCEDURE DeleteKPI
    @idKPI int
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @message VARCHAR(100)
    
    IF EXISTS (SELECT 1 FROM tbl_kpi WHERE id = @idKPI)
    BEGIN
		DELETE FROM tbl_kpi WHERE id = @idKPI ;
        SET @message = 'Data dengan Id ' + CAST(@idKPI AS VARCHAR) + ' BERHASIL dihapus';
    END
    ELSE
    BEGIN
        SET @message = 'Data dengan Id ' + CAST(@idKPI AS VARCHAR) + ' TIDAK BERHASIL dihapus. DATA TIDAK DITEMUKAN';
    END
	PRINT @message;
END;

--CALL STORED PROCEDURE
EXEC DeleteKPI 3;

