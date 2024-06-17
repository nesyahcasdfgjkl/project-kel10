-- store procedure AddDataCountry
CREATE OR ALTER PROCEDURE AddNewCountries
    @id char(3),
	@name varchar(40),
	@region int
AS
BEGIN
	DECLARE @message VARCHAR(100);
	SET @message = 'Terdapat duplikat data id Job, silahkan cek kembali';
    -- Isi dari stored procedure
	IF NOT EXISTS (SELECT 1 FROM tbl_countries WHERE id = @id)
    BEGIN
		INSERT INTO tbl_countries ( id,name,region)
		VALUES (@id,@name,@region);
		--setelah insert akan ditampilkan datanya
		SELECT id,name,region FROM tbl_countries Where id=@id;
	END
	BEGIN
		PRINT @message
	END
END;
--Pemanggilan/penggunaan Store Procedur
EXEC AddNewCountries 'IDN','Indonesia',3;


-- store procedure UpdateDataCountry
CREATE OR ALTER PROCEDURE UpdateCountries
    @id char(3),
	@name varchar(40),
	@region int
AS
BEGIN
	DECLARE @message VARCHAR(30);
    SET @message = 'Inputan id salah';
    
	IF EXISTS (SELECT 1 FROM tbl_countries WHERE id = @id)
    BEGIN
		UPDATE tbl_countries
		SET
			id = @id,
			name = @name,
			region = @region
		WHERE
			id = @id;
		SELECT * FROM tbl_countries WHERE id = @id;
	END
    ELSE
    BEGIN
		 PRINT @message;
    END
END;
--Pemanggilan/penggunaan Store Procedur
EXEC UpdateCountries 'USA','United States',1;



-- store procedure DeleteDataCountry
CREATE OR ALTER PROCEDURE DeleteCountries
    @id char(3)
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @message VARCHAR(100)
    
    IF EXISTS (SELECT 1 FROM tbl_countries WHERE id = @id)
    BEGIN
		DELETE FROM tbl_countries WHERE id = @id ;
        SET @message = 'Data dengan Id Job ' + @id + ' BERHASIL dihapus';
    END
    ELSE
    BEGIN
        SET @message = 'Data dengan Id Job ' + @id + ' TIDAK BERHASIL dihapus';
    END
	PRINT @message;
END;
--Pemanggilan/penggunaan Store Procedur
EXEC DeleteCountries 'IDN';