USE practica
IF OBJECT_ID ( 'registrarUsuario' ) IS NOT NULL  
BEGIN
    DROP PROCEDURE registrarUsuario;
END
GO 
CREATE PROCEDURE registrarUsuario 
		@NombreUsuario VARCHAR(50),
		@Email VARCHAR(100),
		@Contraseña VARCHAR(255),
		@PerfilId INT,
		@Genero INT
		
		AS 
		BEGIN TRAN
SET XACT_ABORT ON; 
			BEGIN TRY
     
				
				DECLARE @HashThis VARCHAR(255);  
				SET @HashThis = CONVERT(VARCHAR(255),@Contraseña);
				SET @HashThis= HASHBYTES('SHA2_256', @HashThis);
				INSERT INTO Usuarios (NombreUsuario,Email,Contraseña,PerfilId)VALUES (@NombreUsuario,@Email,@HashThis,@PerfilId)
				DECLARE @IdUsuario INT = @@IDENTITY
				INSERT INTO DatosPersonales(UsuarioID,Nombre,Apellido,FechaNacimiento,GeneroId,Direccion,Nacionalidad,Pais,DNI,Mail)
				VALUES (@IdUsuario,@NombreUsuario,NULL,GETDATE(),@Genero,NULL,NULL,NULL,NULL,@Email)
	
			END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION

	DECLARE @result INT
	IF EXISTS (SELECT NombreUsuario,Email,Contraseña,PerfilId FROM Usuarios WHERE NombreUsuario=@NombreUsuario OR Email=@Email)
					BEGIN
						
						SET @result=1
						RETURN @result
				
					END
  


    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;

IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO

   
   
   