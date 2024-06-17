use employee
go 

CREATE FUNCTION func_postal_code (
    @postal_code VARCHAR(12)
)
RETURNS BIT
AS
BEGIN
    DECLARE @isNumeric BIT = 1;
    DECLARE @len INT = LEN(@postal_code);
    DECLARE @i INT = 1;

    WHILE @i <= @len AND @isNumeric = 1
    BEGIN
        IF ASCII(SUBSTRING(@postal_code, @i, 1)) < 48 OR ASCII(SUBSTRING(@postal_code, @i, 1)) > 57
            SET @isNumeric = 0;
        SET @i = @i + 1;
    END

    RETURN @isNumeric;
END;

select dbo.func_postal_code('12312')
