USE [master]
GO
/****** Object:  Database [practica]    Script Date: 31/5/2024 15:14:13 ******/
CREATE DATABASE [practica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'practica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\practica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'practica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\practica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [practica] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [practica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [practica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [practica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [practica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [practica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [practica] SET ARITHABORT OFF 
GO
ALTER DATABASE [practica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [practica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [practica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [practica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [practica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [practica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [practica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [practica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [practica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [practica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [practica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [practica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [practica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [practica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [practica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [practica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [practica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [practica] SET RECOVERY FULL 
GO
ALTER DATABASE [practica] SET  MULTI_USER 
GO
ALTER DATABASE [practica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [practica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [practica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [practica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [practica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [practica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'practica', N'ON'
GO
ALTER DATABASE [practica] SET QUERY_STORE = OFF
GO
USE [practica]
GO
/****** Object:  Table [dbo].[DatosPersonales]    Script Date: 31/5/2024 15:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatosPersonales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Apellido] [varchar](100) NULL,
	[FechaNacimiento] [datetime] NULL,
	[GeneroId] [int] NULL,
	[Direccion] [varchar](255) NULL,
	[Nacionalidad] [varchar](50) NULL,
	[Pais] [varchar](50) NULL,
	[DNI] [varchar](20) NULL,
	[Mail] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 31/5/2024 15:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logins]    Script Date: 31/5/2024 15:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[DireccionIP] [varchar](45) NULL,
	[Exitoso] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfiles]    Script Date: 31/5/2024 15:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 31/5/2024 15:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Contraseña] [varchar](255) NOT NULL,
	[PerfilId] [int] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UltimoAcceso] [datetime] NULL,
	[FechaBaja] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[NombreUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Contraseña] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[DatosPersonales]  WITH CHECK ADD FOREIGN KEY([GeneroId])
REFERENCES [dbo].[Generos] ([id])
GO
ALTER TABLE [dbo].[DatosPersonales]  WITH CHECK ADD FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Logins]  WITH CHECK ADD FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([PerfilId])
REFERENCES [dbo].[Perfiles] ([id])
GO
/****** Object:  StoredProcedure [dbo].[actualizarDatosPersonales]    Script Date: 31/5/2024 15:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[actualizarDatosPersonales] 
		@usuarioId INT,
		@nombre VARCHAR(100),
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
/****** Object:  StoredProcedure [dbo].[obtenerUsuarioPorNombreUsuario]    Script Date: 31/5/2024 15:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerUsuarioPorNombreUsuario]

		@nombreUsuario VARCHAR(100)
		AS 
		BEGIN TRAN
SET XACT_ABORT ON; 
BEGIN TRY
	DECLARE @id INT 
	SELECT @id=id FROM Usuarios WHERE NombreUsuario=@nombreUsuario


	SELECT TOP(200) NombreUsuario,Email,Contraseña,PerfilId,FechaCreacion,Nombre,Apellido,FechaNacimiento,GeneroId,DNI,Nacionalidad,Mail
	FROM Usuarios 
	INNER JOIN DatosPersonales 
	ON DatosPersonales.UsuarioId = Usuarios.Id 
	WHERE NombreUsuario=@nombreUsuario

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
/****** Object:  StoredProcedure [dbo].[obtenerUsuarios]    Script Date: 31/5/2024 15:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerUsuarios]

		
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
/****** Object:  StoredProcedure [dbo].[registrarLogin]    Script Date: 31/5/2024 15:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[registrarLogin]

		@usuarioId INT,
		@direccionIP VARCHAR(45),
		@exitoso BIT
		AS 
		BEGIN TRAN
SET XACT_ABORT ON; 
BEGIN TRY
	
	INSERT INTO Logins(Usuarioid,FechaHora,DireccionIP,Exitoso)VALUES (@usuarioId,GETDATE(),@direccionIP,@exitoso)
				

END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION

	DECLARE @result INT
    DECLARE @COUNT INT =0

	SELECT @COUNT = COUNT(*) FROM Usuarios WHERE id=@usuarioId
	IF @COUNT = 0
	BEGIN
		SET @result=2
		RETURN @result
	END

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
END CATCH;

IF @@TRANCOUNT > 0
    COMMIT TRANSACTION;
GO
/****** Object:  StoredProcedure [dbo].[registrarUsuario]    Script Date: 31/5/2024 15:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[registrarUsuario] 
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
/****** Object:  StoredProcedure [dbo].[usp_GetErrorInfo]    Script Date: 31/5/2024 15:14:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
-- Create procedure to retrieve error information.  
CREATE PROCEDURE [dbo].[usp_GetErrorInfo]  
AS  
SELECT  
    ERROR_NUMBER() AS ErrorNumber  
    ,ERROR_SEVERITY() AS ErrorSeverity  
    ,ERROR_STATE() AS ErrorState  
    ,ERROR_PROCEDURE() AS ErrorProcedure  
    ,ERROR_LINE() AS ErrorLine  
    ,ERROR_MESSAGE() AS ErrorMessage;  
GO
USE [master]
GO
ALTER DATABASE [practica] SET  READ_WRITE 
GO
