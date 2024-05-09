create database practica
--Tablas
create table Generos(
  id integer identity,
  primary key(id),
  Nombre varchar(50)unique not null,
  )
  create table Perfiles(
  id int identity,
  primary key(id),
  Nombre varchar(50)unique not null,
  Descripcion varchar(255)
  )
  create table Usuarios(
  id int identity,
  primary key (id),
  Nombre varchar(50) unique not null,
  Contraseña varchar(255) unique not null,
  Email varchar(100) unique not null,
  Perfilid int not null 
  foreign key (Perfilid) references Perfiles(id),
  FechaCreacion datetime not null default getdate(),
  UiltimoAcceso datetime,
  FechaBaja datetime
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
  Email varchar(100)
  )
  create table Logins(
  Id integer identity,
  primary key(id),
  UsuarioId integer not null,
  foreign key (UsuarioId) references Usuarios(Id),
  FechaHora datetime not null,
  DireccionIP varchar(45),
  Exitoso BIT not null
  )
