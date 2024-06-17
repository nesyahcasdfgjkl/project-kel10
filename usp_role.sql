--------------------------------- CREATE ----------------------------------
CREATE PROCEDURE usp_create_role
    @name VARCHAR(50)
AS
BEGIN 

	-- insert data ke tabel locations
	INSERT INTO tbl_roles(name)
    VALUES (@name);
END;

--------------------------------- UPDATE ----------------------------------
CREATE PROCEDURE usp_update_role
	@id INT,
    @name VARCHAR(50)
AS
BEGIN 
	UPDATE tbl_roles
	SET name = @name
	WHERE id = @id
END;



--------------------------------- DELETE ----------------------------------
CREATE PROCEDURE usp_delete_role
    @id INT
AS
BEGIN

    DELETE FROM tbl_roles
    WHERE
        id = @id;

    -- Menyertakan log atau pesan output
    SELECT 'Role deleted successfully' AS Message;
END;
