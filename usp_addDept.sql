CREATE PROCEDURE AddRegion
    @Id INT,
    @Name VARCHAR(25)
AS
BEGIN
    INSERT INTO tbl_regions (id, name)
    VALUES (@Id, @Name);
END;
GO

EXEC AddRegion @Id = 4, @Name = 'Africa';

select * from tbl_regions;