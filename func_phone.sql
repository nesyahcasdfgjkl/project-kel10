use employee
go 

CREATE FUNCTION func_phone (
    @phone VARCHAR(20)
)
RETURNS BIT
AS
BEGIN
    DECLARE @isNumeric BIT = 1;
    DECLARE @len INT = LEN(@phone);
    DECLARE @i INT = 1;

    WHILE @i <= @len AND @isNumeric = 1
    BEGIN
        IF ASCII(SUBSTRING(@phone, @i, 1)) < 48 OR ASCII(SUBSTRING(@phone, @i, 1)) > 57
            SET @isNumeric = 0;
        SET @i = @i + 1;
    END

    RETURN @isNumeric;
END;

select dbo.func_phone('123aa)
