/****** Script for SelectTopNRows command from SSMS  ******/
BEGIN TRAN
USE practica
SELECT * FROM [practica].[dbo].[DatosPersonales]

	DECLARE @idperfil INT 
	SELECT TOP(1) @idperfil=id FROM Perfiles
	DECLARE @HashThis VARCHAR(255);  
	SET @HashThis = 'prueba1';
	SET @HashThis= HASHBYTES('SHA2_256', @HashThis);
	INSERT INTO Usuarios (NombreUsuario,Email,Contraseña,PerfilId)VALUES ('Nombre de Prueba1','prueba1@gmail.com',@HashThis,@idperfil)
	DECLARE @IdUsuario INT = @@IDENTITY
	INSERT INTO Generos(nombre) VALUES ('Genero de Prueba')
	DECLARE @IdGenero INT = @@IDENTITY
	INSERT INTO DatosPersonales(UsuarioID,Nombre,Apellido,FechaNacimiento,GeneroId,Direccion,Nacionalidad,Pais,DNI,Mail)
	VALUES (@IdUsuario,'Nombre de Prueba1','Apellido de Prueba1',GETDATE(),@IdGenero,'Dirrecion de prueba1','Nacionalidad de prueba1','Pais de Prueba1','12345678','prueba1@gmail.com')
	
SELECT * FROM [practica].[dbo].[DatosPersonales]

ROLLBACK TRAN
--COMMIT TRAN