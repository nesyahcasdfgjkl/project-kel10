CREATE FUNCTION func_email_format (@Email VARCHAR(50))
RETURNS BIT
AS
BEGIN
    DECLARE @IsValid BIT;

    IF @Email LIKE '%_@__%.__%'
        AND @Email NOT LIKE '%[^a-zA-Z0-9._%+-@]%'
        AND @Email NOT LIKE '%@%@%'
        AND @Email NOT LIKE '%..%'
        AND LEN(@Email) - LEN(REPLACE(@Email, '.', '')) >= 1
        AND CHARINDEX('.', @Email) < LEN(@Email) - 1
    BEGIN
        SET @IsValid = 1;
    END
    ELSE
    BEGIN
        SET @IsValid = 0;
    END

    RETURN @IsValid;
END;

SELECT dbo.func_email_format('user@example.com') AS Result1; -- Expected 1
SELECT dbo.func_email_format('alice_johnson@example.co.uk') AS Result2; -- Expected 1
SELECT dbo.func_email_format('plainaddress') AS Result3; -- Expected 0