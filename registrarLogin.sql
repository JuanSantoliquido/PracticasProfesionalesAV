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

    SELECT 

         ERROR_NUMBER() AS ErrorNumber
        ,ERROR_SEVERITY() AS ErrorSeverity
        ,ERROR_STATE() AS ErrorState
        ,ERROR_PROCEDURE() AS ErrorProcedure
        ,ERROR_LINE() AS ErrorLine
        ,ERROR_MESSAGE() AS ErrorMessage;


    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;

IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO

   
   
   