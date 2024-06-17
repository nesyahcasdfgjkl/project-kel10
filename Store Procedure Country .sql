-- store procedure AddDataCountry
CREATE OR ALTER PROCEDURE AddNewCountries
    @id char(3),
	@name varchar(40),
	@region int
AS
BEGIN
	DECLARE @message VARCHAR(100);

    -- Isi dari stored procedure
    INSERT INTO tbl_countries ( id,name,region)
    VALUES (@id,@name,@region);

	--setelah insert akan ditampilkan datanya
	SELECT id,name,region FROM tbl_countries Where id=@id;

END;
--Pemanggilan/penggunaan Store Procedur
EXEC AddNewCountries 'SPA','Spanyol',2;


-- store procedure UpdateDataCountry
CREATE OR ALTER PROCEDURE UpdateCountries
    @id char(3),
	@name varchar(40),
	@region int
AS
BEGIN
	DECLARE @message VARCHAR(30);
    SET @message = 'Inputan id salah';
    
    SET NOCOUNT ON;

    UPDATE tbl_countries
    SET
        id = @id,
        name = @name,
        region = @region
    WHERE
        id = @id;

    IF NOT EXISTS (SELECT 1 FROM tbl_countries WHERE id = @id)
    BEGIN
        PRINT @message;
    END
    ELSE
    BEGIN
        SELECT * FROM tbl_countries WHERE id = @id;
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