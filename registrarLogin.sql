USE practica
IF OBJECT_ID ( 'registrarLogin' ) IS NOT NULL  
BEGIN
    DROP PROCEDURE registrarLogin;
END
GO 
CREATE PROCEDURE registrarLogin

		@usuarioId INT,
		@direccionIP VARCHAR(45),
		@exitoso BIT
		AS 
		BEGIN TRAN
SET XACT_ABORT ON; 
BEGIN TRY
	
	INSERT INTO Logins(Usuarioid,FechaHora,DireccionIP,Exitoso)VALUES (@usuarioId,GETDATE(),@direccionIP,@exitoso)
				

END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION

	DECLARE @result INT
    DECLARE @COUNT INT =0

	SELECT @COUNT = COUNT(*) FROM DatosPersonales WHERE usuarioId=@usuarioId
	IF @COUNT = 0
	BEGIN
		SET @result=2
		RETURN @result
	END

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;

IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO

   
   
   