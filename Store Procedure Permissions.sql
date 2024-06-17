-- store procedure AddDataPermissions
CREATE OR ALTER PROCEDURE AddNewPermissions
    @idPerm INT,
	@namePerm varchar(100)
AS
BEGIN
	DECLARE @message VARCHAR(100)
	SET @message = 'Terdapat duplikat data id permission, silahkan cek kembali';
-- Isi dari stored procedure
	IF NOT EXISTS (SELECT 1 FROM tbl_permissions WHERE id = @idPerm)
	BEGIN
		INSERT INTO tbl_permissions( id,name)
		VALUES (@idPerm,@namePerm);
		--setelah insert akan ditampilkan datanya
		SELECT id,name FROM tbl_permissions Where id=@idPerm;
	END
	ELSE
	BEGIN
		PRINT @message
	END
END;
--Pemanggilan/penggunaan Store Procedur
EXEC AddNewPermissions 5,'change';

use Final_Projek;
-- store procedure UpdateDataCountry
CREATE OR ALTER PROCEDURE UpdatePermissions
    @idPerm INT,
	@namePerm varchar(100)
AS
BEGIN
	DECLARE @message VARCHAR(50);
    SET @message = 'Inputan id salah!!';
   

    IF NOT EXISTS (SELECT 1 FROM tbl_permissions WHERE id = @idPerm)
    BEGIN
        PRINT @message;
    END
    ELSE
    BEGIN
		UPDATE tbl_permissions
		SET
        id = @idPerm,
        name = @namePerm
		WHERE id=@idPerm;
        SELECT * FROM tbl_permissions WHERE id = @idPerm;
    END
END;
--Pemanggilan/penggunaan Store Procedur
EXEC UpdatePermissions 5,'View';



-- store procedure DeleteDataCountry
CREATE OR ALTER PROCEDURE DeletePermissions
    @idPerm int
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @message VARCHAR(100)
    
    IF EXISTS (SELECT 1 FROM tbl_permissions WHERE id = @idPerm)
    BEGIN
		DELETE FROM tbl_permissions WHERE id = @idPerm ;
        SET @message = 'Data dengan Id ' + CAST(@idPerm AS VARCHAR) + ' BERHASIL dihapus';
    END
    ELSE
    BEGIN
        SET @message = 'Data dengan Id ' + CAST(@idPerm AS VARCHAR) + ' TIDAK BERHASIL dihapus. DATA TIDAK DITEMUKAN';
    END
	PRINT @message;
END;
--Pemanggilan/penggunaan Store Procedur
EXEC DeletePermissions 5;

