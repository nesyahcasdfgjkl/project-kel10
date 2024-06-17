CREATE FUNCTION func_password_match (
	@input_password VARCHAR(255),
	@password_confirm VARCHAR(255)
	)
RETURNS BIT
AS
BEGIN
	DECLARE @isValid BIT;
	IF @input_password = @password_confirm
		SET @isValid = 1; -- PASSWORD COCOK
	ELSE 
		SET @isValid = 0; -- PASSWORD TIDAK COCOK
	RETURN @isValid;
END;

SELECT dbo.func_password_match('Password12#', 'Password12#') AS Result1 -- expected 1
SELECT dbo.func_password_match('Password12#', 'Password12') AS Result2 -- expected 0
