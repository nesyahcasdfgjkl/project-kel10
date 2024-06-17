CREATE FUNCTION func_salary (@salary INT)
RETURNS BIT
AS
BEGIN
    DECLARE @IsValid BIT;
    
    IF @salary > 1000000 
		AND @salary < 10000000
    BEGIN
        SET @IsValid = 1;
    END
    ELSE
    BEGIN
        SET @IsValid = 0;
    END
    
    RETURN @IsValid;
END;

select dbo.func_salary(1500000) AS Result1 -- expected 1
select dbo.func_salary(12000000) AS Result2 -- expected 0