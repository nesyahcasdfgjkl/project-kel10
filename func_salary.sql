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
