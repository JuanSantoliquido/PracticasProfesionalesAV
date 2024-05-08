	CREATE DATABASE practica
	
	USE practica

	CREATE TABLE Generos(
		id INT IDENTITY,
		PRIMARY KEY(id),
		nombre VARCHAR(50)UNIQUE not null,
	)

	CREATE TABLE Usuarios(
		Id INT IDENTITY,
		PRIMARY KEY(Id),
		NombreUsuario VARCHAR(50)UNIQUE not null,
		Email VARCHAR(100)UNIQUE not null,
		Contraseña VARCHAR(255)UNIQUE not null,
		PerfilId INT not null,
		FOREIGN KEY (PerfilId) REFERENCES Perfiles(Id), 
		FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
		UltimoAcceso DATETIME,
		FechaBaja DATETIME
	)
	
	CREATE TABLE Perfiles(
		id INT IDENTITY,
		PRIMARY KEY(id),
		nombre VARCHAR(50)UNIQUE not null,
		descripcion VARCHAR(255)
	)
	
	CREATE TABLE DatosPersonales(
		Id INT IDENTITY,
		PRIMARY KEY(Id),
		UsuarioId INT UNIQUE not null,
		FOREIGN KEY (UsuarioId) REFERENCES Usuarios(Id), 
		Nombre VARCHAR(100),
		Apellido VARCHAR(100),
		FechaNacimiento DATETIME,
		GeneroId INT,
		FOREIGN KEY (GeneroId) REFERENCES Generos(Id),
		Direccion VARCHAR(255),
		Nacionalidad VARCHAR(50),
		Pais VARCHAR(50),
		DNI VARCHAR(20),
		Mail VARCHAR(100)
	)
	
	CREATE TABLE Logins(
		Id INT IDENTITY,
		PRIMARY KEY(id),
		UsuarioId INT not null,
		FOREIGN KEY (UsuarioId) REFERENCES Usuarios(Id),
		FechaHora DATETIME not null,
		DireccionIP VARCHAR(45),
		Exitoso BIT not null
	)
	
