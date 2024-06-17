CREATE PROCEDURE usp_forgot_password
    @username NVARCHAR(25),
    @new_password NVARCHAR(255),
    @confirm_password NVARCHAR(255),
    @reset_otp INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserID INT;
    DECLARE @ExistingOTP INT;
    DECLARE @IsPasswordMatch BIT;
    DECLARE @IsPasswordValid BIT;

    BEGIN TRY
        -- Cek apakah user tersedia dan reset token
        SELECT 
            @UserID = id,
            @ExistingOTP = otp
        FROM tbl_accounts
        WHERE username = @username;

        IF @UserID IS NULL
            RAISERROR('User not found', 16, 1);

        -- validasi reset token
        IF @ExistingOTP IS NULL OR @ExistingOTP <> @reset_otp
            RAISERROR('Invalid or expired reset token', 16, 1);

        -- cek apakah new password cocok dengan confirm password
        DECLARE @password_match BIT;
        SET @password_match = (SELECT dbo.func_password_match(@new_password, @confirm_password));
        IF @password_match = 0
            RAISERROR('Passwords do not match', 16, 1);

        -- cek apakah new password memenuhi kebijakan
        DECLARE @password_policy BIT;
        SET @password_policy = (SELECT dbo.func_password_policy(@new_password));
        IF @password_policy = 0
            RAISERROR('Password does not meet policy requirements', 16, 1);

        -- Update user password dan reset token
        UPDATE tbl_accounts
        SET 
            password = HASHBYTES('SHA2_256', @new_password),
            otp = NULL
        WHERE id = @UserID;
    END TRY
    BEGIN CATCH
        -- Handle errors here
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH;

	--message ketika password berhasil diubah
	PRINT 'Password successfully updated';
END;

