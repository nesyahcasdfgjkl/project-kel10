USE employee;

CREATE OR ALTER PROCEDURE AddNewDepartments
   	@idDept INT,
	@nameDept varchar(30),
	@idLoc INT
AS
BEGIN
	DECLARE @message VARCHAR(100)
	SET @message = 'Terdapat duplikat data id regions, silahkan cek kembali';

-- Isi dari stored procedure
	IF NOT EXISTS (SELECT 1 FROM tbl_departments WHERE id = @idDept)
	BEGIN
		INSERT INTO tbl_departments( id,name,location)
		VALUES (@idDept,@nameDept,@idLoc);

--setelah insert akan ditampilkan datanya
		SELECT id,name,location FROM tbl_dept Where id=@idDept;
	END
	ELSE
	BEGIN
		PRINT @message
	END
END;

--call store procedure
EXEC AddNewDepartments 8, 'Legal', 3; 

select * from tbl_departments;


--UPDATE DEPT
CREATE OR ALTER PROCEDURE updateDepartments
    @idDept INT,
    @nameDept VARCHAR(30),
    @idLoc INT
AS
BEGIN
    DECLARE @message VARCHAR(50);
    SET @message = 'Inputan id salah!!';

    -- Check if the department ID exists
    IF NOT EXISTS (SELECT 1 FROM tbl_departments WHERE id = @idDept)
    BEGIN
        PRINT @message;
    END
    ELSE
    BEGIN
        -- Update the department details
        UPDATE tbl_departments
        SET
            name = @nameDept,
            location = @idLoc
        WHERE id = @idDept;

        -- Select the updated department details
        SELECT * FROM tbl_departments WHERE id = @idDept;
    END
END;

--CALL STORED PROCEDURE
EXEC updateDepartments 8,'Legals', 3;


--DELETE DEPT
CREATE OR ALTER PROCEDURE DeleteDepartments
    @idDept int
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @message VARCHAR(100)
    
    IF EXISTS (SELECT 1 FROM tbl_departments WHERE id = @idDept)
    BEGIN
		DELETE FROM tbl_departments WHERE id = @idDept ;
        SET @message = 'Data dengan Id ' + CAST(@idDept AS VARCHAR) + ' BERHASIL dihapus';
    END
    ELSE
    BEGIN
        SET @message = 'Data dengan Id ' + CAST(@idDept AS VARCHAR) + ' TIDAK BERHASIL dihapus. DATA TIDAK DITEMUKAN';
    END
	PRINT @message;
END;

--CALL STORED PROCEDURE
EXEC DeleteDepartments 8;
