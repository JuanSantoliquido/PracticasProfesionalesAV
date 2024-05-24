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
		@PerfilId INT
		
		AS 
		BEGIN TRAN
SET XACT_ABORT ON; 
			BEGIN TRY
     
				
				DECLARE @HashThis VARCHAR(255);  
				SET @HashThis = CONVERT(VARCHAR(255),@Contraseña);
				SET @HashThis= HASHBYTES('SHA2_256', @HashThis);
				INSERT INTO Usuarios (NombreUsuario,Email,Contraseña,PerfilId)VALUES (@NombreUsuario,@Email,@HashThis,@PerfilId)
				
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

   
   
   