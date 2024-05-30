BEGIN TRAN
USE practica


DROP TABLE Logins
DROP TABLE DatosPersonales
DROP TABLE Usuarios
DROP TABLE Perfiles
DROP TABLE Generos


CREATE TABLE Generos(
	id INT IDENTITY,
	PRIMARY KEY(id),
	nombre VARCHAR(50)UNIQUE not null,
)

CREATE TABLE Perfiles(
	id INT IDENTITY,
	PRIMARY KEY(id),
	nombre VARCHAR(50)UNIQUE not null,
	descripcion VARCHAR(255)
)

CREATE TABLE Usuarios(
	Id INT IDENTITY,	
	NombreUsuario VARCHAR(50)UNIQUE not null,
	Email VARCHAR(100)UNIQUE not null,
	PRIMARY KEY(Id,NombreUsuario,Email),
	Contraseña VARCHAR(255) not null,
	PerfilId INT not null,
	FOREIGN KEY (PerfilId) REFERENCES Perfiles(Id), 
	FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
	UltimoAcceso DATETIME,
	FechaBaja DATETIME
)
	

	
CREATE TABLE DatosPersonales(
	Id INT IDENTITY,
	PRIMARY KEY(Id),
	UsuarioId INT UNIQUE not null,
	Nombre VARCHAR(50),-- cambiado varcha de 100 a 50
	Apellido VARCHAR(100),
	FechaNacimiento DATETIME,
	GeneroId INT,
	FOREIGN KEY (GeneroId) REFERENCES Generos(Id),
	Direccion VARCHAR(255),
	Nacionalidad VARCHAR(50),
	Pais VARCHAR(50),
	DNI VARCHAR(20),
	Mail VARCHAR(100),
	FOREIGN KEY (UsuarioId,Nombre,Mail) REFERENCES Usuarios(Id,NombreUsuario,Email), 
)
	
CREATE TABLE Logins(
	Id INT IDENTITY,
	PRIMARY KEY(id),
	UsuarioId INT not null,
	FOREIGN KEY (UsuarioId) REFERENCES DatosPersonales,
	FechaHora DATETIME not null,
	DireccionIP VARCHAR(45),
	Exitoso BIT not null
)
	
ROLLBACK TRAN
--COMMIT TRAN