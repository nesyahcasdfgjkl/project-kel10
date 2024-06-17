CREATE OR ALTER PROCEDURE AddNewRegions
   	@idReg INT,
	@nameReg varchar(40)
AS
BEGIN
	DECLARE @message VARCHAR(100)
	SET @message = 'Terdapat duplikat data id regions, silahkan cek kembali';
-- Isi dari stored procedure
	IF NOT EXISTS (SELECT 1 FROM tbl_regions WHERE id = @idReg)
	BEGIN
		INSERT INTO tbl_regions( id,name)
		VALUES (@idReg,@nameReg);
--setelah insert akan ditampilkan datanya
		SELECT id,name FROM tbl_reg Where id=@idReg;
	END
	ELSE
	BEGIN
		PRINT @message
	END
END;

--Call Store Procedur
EXEC AddNewRegions 8,'change';

select * from tbl_regions;


--update regions
CREATE OR ALTER PROCEDURE UpdateRegions
    	@idReg INT,
	@nameReg varchar(40)
AS
BEGIN
	DECLARE @message VARCHAR(40);
    SET @message = 'Inputan id salah!!';
   

    IF NOT EXISTS (SELECT 1 FROM tbl_regions WHERE id = @idReg)
    BEGIN
        PRINT @message;
    END
    ELSE
    BEGIN
		UPDATE tbl_regions
		SET
        id = @idReg,
        name = @nameReg
		WHERE id=@idReg;
        SELECT * FROM tbl_regions WHERE id = @idReg;
    END
END;

--call update
EXEC UpdateRegions 7,'Pacific';
EXEC UpdateRegions 8,'LATAM';


--delete regions
CREATE OR ALTER PROCEDURE DeleteRegions
    @idReg int
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @message VARCHAR(100)
    
    IF EXISTS (SELECT 1 FROM tbl_regions WHERE id = @idReg)
    BEGIN
		DELETE FROM tbl_regions WHERE id = @idReg ;
        SET @message = 'Data dengan Id ' + CAST(@idReg AS VARCHAR) + ' BERHASIL dihapus';
    END
    ELSE
    BEGIN
        SET @message = 'Data dengan Id ' + CAST(@idReg AS VARCHAR) + ' TIDAK BERHASIL dihapus. DATA TIDAK DITEMUKAN';
    END
	PRINT @message;
END;

--call sp delete
EXEC DeleteRegions 8;


