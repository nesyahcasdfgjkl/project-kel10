-- Uji dengan username dan password yang benar
DECLARE @username VARCHAR(25) = 'john.doe';
DECLARE @password VARCHAR(225) = 'password123';

EXEC usp_login @username, @password;
GO

-- Uji dengan username yang benar tetapi password yang salah
DECLARE @username VARCHAR(25) = 'john.doe';
DECLARE @password VARCHAR(225) = 'password1';

EXEC usp_login @username, @password;
GO

-- Uji dengan username yang salah
DECLARE @username VARCHAR(25) = 'johndoe';
DECLARE @password VARCHAR(225) = 'password123';

EXEC usp_login @username, @password;
GO

SELECT * FROM tbl_accounts;