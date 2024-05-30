USE practica
IF OBJECT_ID ( 'actualizarDatosPersonales' ) IS NOT NULL  
BEGIN
    DROP PROCEDURE actualizarDatosPersonales;
END
GO 
CREATE PROCEDURE actualizarDatosPersonales 
		@usuarioId INT,
		@nombre VARCHAR(50),
		@apellido VARCHAR(100),
		@fechaNacimiento DATETIME,
		@generoId INT,
		@direccion VARCHAR(255),
		@nacionalidad VARCHAR(50),
		@pais VARCHAR(50),
		@dni VARCHAR(20),
		@mail VARCHAR(100)
		AS 
		BEGIN TRAN
SET XACT_ABORT ON; 
			BEGIN TRY
     
				UPDATE DatosPersonales 
				SET Nombre=@nombre,
					Apellido=@apellido,
					FechaNacimiento=@fechaNacimiento,
					GeneroId=@generoId,
					Direccion=@direccion,
					Nacionalidad=@nacionalidad,
					Pais=@pais,
					DNI=@dni,
					Mail=@mail
				WHERE UsuarioId=@usuarioId
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

   
   
   