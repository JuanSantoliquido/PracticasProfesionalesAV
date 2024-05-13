USE practica
	SELECT TOP (1000) [id]
		  ,[nombre]
		  ,[descripcion]
	  FROM [practica].[dbo].[Perfiles]

	 
	INSERT INTO Perfiles(nombre,descripcion)VALUES ('Admin','Usuario Administrador')
	INSERT INTO Perfiles(nombre,descripcion)VALUES ('Usuario con permisos','Usuario normal del sistema con permisos')
	INSERT INTO Perfiles(nombre,descripcion)VALUES ('Usuario del Sistema','Usuario normal del sistema sin permisos')

	SELECT TOP (1000) [id]
		  ,[nombre]
		  ,[descripcion]
	  FROM [practica].[dbo].[Perfiles]
