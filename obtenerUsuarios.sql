USE practica
IF OBJECT_ID ( 'obtenerUsuarios' ) IS NOT NULL  
BEGIN
    DROP PROCEDURE obtenerUsuarios;
END
GO 
CREATE PROCEDURE obtenerUsuarios

		
		AS 
		BEGIN TRAN
SET XACT_ABORT ON; 
BEGIN TRY
	
	SELECT NombreUsuario,Email,Contraseña,PerfilId,FechaCreacion,a.Nombre,Apellido,FechaNacimiento,GeneroId,DNI,Nacionalidad,Mail,b.nombre,descripcion
	FROM Usuarios
	INNER JOIN DatosPersonales a
	ON a.UsuarioId = Usuarios.Id 
	INNER JOIN Perfiles b 
	ON b.Id = Usuarios.PerfilId 
				

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

   
   
   