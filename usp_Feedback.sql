CREATE OR ALTER PROCEDURE AddNewFeedback
   	@idFeedback INT,
	@idEMP INT,
	@idManager INT,
	@dateFB date,
	@textFB text,
	@ratingFB INT
	
AS
BEGIN
	DECLARE @message VARCHAR(100)
	SET @message = 'Terdapat duplikat data id Feedback, silahkan cek kembali';

-- Isi dari stored procedure
	IF NOT EXISTS (SELECT 1 FROM tbl_feedback WHERE id = @idFeedback)
	BEGIN
		INSERT INTO tbl_feedback(id,employee_id,manager_id,feedback_date,feedback_text,rating)
		VALUES (@idFeedback,@idEMP,@idManager,@dateFB,@textFB,@ratingFB);

--setelah insert akan ditampilkan datanya
		SELECT id,employee_id,manager_id,feedback_date,feedback_text,rating FROM tbl_feedback Where id=@idFeedback;
	END
	ELSE
	BEGIN
		PRINT @message
	END
END;

--CALL STORED PROCEDURE
EXEC AddNewFeedback 3, 2, 1, '2024-08-13', 'Outstanding! Achieving a 90% satisfaction index is no small feat', 5;


--UPDATE FEEDBACK
CREATE OR ALTER PROCEDURE updateFeedback
    @idFeedback INT,
    @idEMP INT,
    @idManager INT,
    @dateFB DATE,
    @textFB TEXT,
    @ratingFB INT
AS
BEGIN
    DECLARE @message VARCHAR(50);
    SET @message = 'Inputan id salah!!';

    -- Check if the feedback ID exists
    IF NOT EXISTS (SELECT 1 FROM tbl_feedback WHERE id = @idFeedback)
    BEGIN
        PRINT @message;
    END
    ELSE
    BEGIN
        -- Update the feedback details
        UPDATE tbl_feedback
        SET
            employee_id = @idEMP,
            manager_id = @idManager,
            feedback_date = @dateFB,
            feedback_text = @textFB,
            rating = @ratingFB
        WHERE id = @idFeedback;

        -- Select the updated feedback details
        SELECT * FROM tbl_feedback WHERE id = @idFeedback;
    END
END;

--CALL STORED PROCEDURE
EXEC updateFeedback 3, 2, 1, '2024-08-13', 'Outstanding! you are amazing', 5;


--DELETE FEEDBACK
CREATE OR ALTER PROCEDURE DeleteFeedback
    @idFeedback int
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @message VARCHAR(100)
    
    IF EXISTS (SELECT 1 FROM tbl_feedback WHERE id = @idFeedback)
    BEGIN
		DELETE FROM tbl_feedback WHERE id = @idFeedback ;
        SET @message = 'Data dengan Id ' + CAST(@idFeedback AS VARCHAR) + ' BERHASIL dihapus';
    END
    ELSE
    BEGIN
        SET @message = 'Data dengan Id ' + CAST(@idFeedback AS VARCHAR) + ' TIDAK BERHASIL dihapus. DATA TIDAK DITEMUKAN';
    END
	PRINT @message;
END;

--CALL STORED PROCEDURE
EXEC DeleteFeedback 3;