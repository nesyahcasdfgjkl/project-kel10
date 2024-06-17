use employee
go 
CREATE FUNCTION func_password_policy (@Password VARCHAR(255))
RETURNS BIT
AS
BEGIN
    DECLARE @IsValid BIT;
    
    IF LEN(@Password) >= 8 
       AND @Password LIKE '%[A-Z]%' -- Mengandung Uppercase
       AND @Password LIKE '%[a-z]%' -- Mengandung lowercase
       AND @Password LIKE '%[0-9]%' -- mengandung angka
       AND @Password LIKE '%[!#$%^&*]%' -- mengandung karakter 
    BEGIN
        SET @IsValid = 1;
    END
    ELSE
    BEGIN
        SET @IsValid = 0;
    END
    
    RETURN @IsValid;
END;
SELECT dbo.func_password_policy('Password12#') AS Result1 -- expected 1
SELECT dbo.func_password_policy('password12#') AS Result1 -- expected 0
SELECT dbo.func_password_policy('Password12') AS Result1 -- expected 0
SELECT dbo.func_password_policy('password') AS Result1 -- expected 0



