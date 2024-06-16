-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE usp_update_employee
	@id INT,
	@first_name VARCHAR(25),
    @last_name VARCHAR(25),
    @gender VARCHAR(10),
    @email VARCHAR(25),
    @phone VARCHAR(20),
    @hire_date DATE,
    @salary INT,
    @manager INT,
    @job VARCHAR(10),
    @department INT
AS
BEGIN
    SET NOCOUNT ON; 

    UPDATE tbl_employees
    SET
        first_name = @first_name,
        last_name = @last_name,
        gender = @gender,
        email = @email,
        phone = @phone,
        hire_date = @hire_date,
        salary = @salary,
        manager = @manager,
        job = @job,
        department = @department
    WHERE
        id = @id;

    -- Menyertakan log atau pesan output
    SELECT 'Employee data updated successfully' AS Message;
END;
