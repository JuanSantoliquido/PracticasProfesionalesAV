  create database practica
  --test 
  create table Generos(
  id integer identity,
  primary key(id),
  nombre varchar(50)unique not null,
  )



  create table Perfiles(
  id integer identity,
  primary key(id),
  nombre varchar(50)unique not null,
  descripcion varchar(255)
  )

  create table Usuarios(
  Id integer identity,
  primary key(Id),
  NombreUsuario varchar(50)unique not null,
  Email varchar(100)unique not null,
  Contraseña varchar(255)unique not null,
  PerfilId integer not null,
  foreign key (PerfilId) references Perfiles(Id), 
  FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
  UltimoAcceso DATETIME,
  FechaBaja DATETIME
  )



  create table DatosPersonales(
  Id integer identity,
  primary key(Id),
  UsuarioId integer unique not null,
  foreign key (UsuarioId) references Usuarios(Id), 
  Nombre varchar(100),
  Apellido varchar(100),
  FechaNacimiento datetime,
  GeneroId integer,
  foreign key (GeneroId) references Generos(Id),
  Direccion varchar(255),
  Nacionalidad varchar(50),
  Pais varchar(50),
  DNI varchar(20),
  Mail varchar(100)
  )

  create table Logins(
  Id integer identity,
  primary key(id),
  UsuarioId integer not null,
  foreign key (UsuarioId) references Usuarios(Id), --error aca
  FechaHora datetime not null,
  DireccionIP varchar(45),
  Exitoso BIT not null

  )
