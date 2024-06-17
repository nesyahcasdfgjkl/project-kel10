CREATE FUNCTION func_gender (@Gender VARCHAR(10))
RETURNS BIT
AS
BEGIN
    DECLARE @IsValid BIT;
    
    IF @Gender IN ('male', 'female')
    BEGIN
        SET @IsValid = 1;
    END
    ELSE
    BEGIN
        SET @IsValid = 0;
    END
    
    RETURN @IsValid;
END;

-- Test the func_gender function
SELECT dbo.func_gender('male') AS IsMale; -- Output: 1 (true)
SELECT dbo.func_gender('female') AS IsFemale; -- Output: 1 (true)
SELECT dbo.func_gender('other') AS IsOther; -- Output: 0 (false)
SELECT dbo.func_gender('') AS IsEmpty; -- Output: 0 (false)
SELECT dbo.func_gender(NULL) AS IsNull; -- Output: 0 (false)
