CREATE PROCEDURE usp_login
    @username VARCHAR(25),
    @password VARCHAR(225)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserID INT;

    -- Cek apakah username dan password cocok
    SELECT @UserID = id
    FROM tbl_accounts
    WHERE Username = @username
      AND Password = HASHBYTES('SHA2_256', @password);

    -- Jika ditemukan, return 1 (berhasil login), jika tidak return 0 (gagal login)
    IF (@UserID IS NOT NULL)
    BEGIN
        SELECT 1 AS LoginResult, @UserID AS UserID;
    END
    ELSE
    BEGIN
        SELECT 0 AS LoginResult, NULL AS UserID;
    END
END
