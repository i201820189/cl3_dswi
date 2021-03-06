USE CLINICA
--STORED PROCEDURE PACIENTE
--SELECT * FROM PACIENTE

IF OBJECT_ID('SP_LISTAPACIENTE') IS NOT NULL 
	DROP PROC SP_LISTAPACIENTE
GO
CREATE PROC SP_LISTAPACIENTE
AS
	SELECT * FROM dbo.PACIENTE
GO

--REGISTRA PACIENTE
IF OBJECT_ID('SP_NUEVOPACIENTE')IS NOT NULL 
	DROP PROC SP_NUEVOPACIENTE
GO
CREATE PROC SP_NUEVOPACIENTE(@NOM VARCHAR(30), @APE VARCHAR(30), @FNA_PAC DATE, @FON CHAR(15))
AS
	INSERT INTO dbo.PACIENTE
	VALUES(@NOM,@APE,@FNA_PAC,@FON)
GO

EXEC SP_NUEVOPACIENTE 'Giomar','Limo','10/10/2020','985632585'
GO

--ACTUALIZA PACIENTE
IF OBJECT_ID('SP_ACTUALIZAPACIENTE')IS NOT NULL 
	DROP PROC SP_ACTUALIZAPACIENTE
GO
CREATE PROC SP_ACTUALIZAPACIENTE(@ID_PAC INT,@NOM VARCHAR(30), @APE VARCHAR(30), @FNA_PAC DATE, @FON CHAR(15))
AS
	UPDATE dbo.PACIENTE
	SET NOM_PAC = @NOM,APE_PAC = @APE,FNA_PAC = @FNA_PAC, FON_PAC = @FON
	WHERE IDE_PAC=@ID_PAC
GO

EXEC SP_ACTUALIZAPACIENTE 24,'GIOMAR','LIMO','10/10/2020','923325849'
GO

--ELIMINA PACIENTE
IF OBJECT_ID('SP_ELIMINAPACIENTE') IS NOT NULL 
	DROP PROC SP_ELIMINAPACIENTE
GO
CREATE PROC SP_ELIMINAPACIENTE(@ID_PAC INT)
AS
	DELETE FROM dbo.PACIENTE WHERE IDE_PAC=@ID_PAC
GO

EXEC SP_ELIMINAPACIENTE 23
GO