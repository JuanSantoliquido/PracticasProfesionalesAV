USE practica
IF OBJECT_ID ( 'obtenerUsuarioPorNombreUsuario' ) IS NOT NULL  
BEGIN
    DROP PROCEDURE obtenerUsuarioPorNombreUsuario;
END
GO 
CREATE PROCEDURE obtenerUsuarioPorNombreUsuario

		@nombreUsuario VARCHAR(100)
		AS 
		BEGIN TRAN
SET XACT_ABORT ON; 
BEGIN TRY
	DECLARE @id INT 
	SELECT @id=id FROM Usuarios WHERE NombreUsuario=@nombreUsuario


	SELECT TOP(200) NombreUsuario,Email,Contraseña,PerfilId,FechaCreacion,Nombre,Apellido,FechaNacimiento,GeneroId,DNI,Nacionalidad,Mail
	FROM Usuarios 
	INNER JOIN DatosPersonales 
	ON DatosPersonales.UsuarioId = Usuarios.Id 
	WHERE NombreUsuario=@nombreUsuario

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

   
   
   