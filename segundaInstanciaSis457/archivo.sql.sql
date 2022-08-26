
<!--Garrado Zarate Juan Carlos final de Sis-457-->

usuario = carlosz
clave = 12345678

CREATE DATABASE finalbd

create table Serie(
id INT PRIMARY KEY not null identity(1,1),
titulo VARCHAR(250) not null,
sinopsis VARCHAR(5000) not null,
director VARCHAR(100) not null,
duracion INT not null,
fechaEstreno DATE not null,
usuarioRegistro VARCHAR(12) not null,
registroActivo BIT null default 1
);

CREATE TABLE Usuario (
  id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
  usuario VARCHAR(12) NOT NULL,
  clave VARCHAR(250) NOT NULL,
  rol VARCHAR(20) NOT NULL,
  registroActivo BIT null default 1
);

USE [master]
GO

CREATE LOGIN [carlos] WITH PASSWORD=N'1234567',
DEFAULT_DATABASE=[finalbd],
CHECK_EXPIRATION=OFF,
CHECK_POLICY=ON
GO

USE [finalbd]
GO

CREATE USER [carlos] FOR LOGIN [carlos]
GO

USE [finalbd]
GO

ALTER ROLE [db_owner] ADD MEMBER [carlos]
GO

USE [master]
GO

CREATE LOGIN [usrfinal] WITH PASSWORD=N'12345678',
DEFAULT_DATABASE=[finalbd],
CHECK_EXPIRATION=OFF,
CHECK_POLICY=ON
GO

USE [finalbd]
GO

CREATE USER [usrfinal] FOR LOGIN [usrfinal]
GO

USE [finalbd]
GO

ALTER ROLE [db_owner] ADD MEMBER [usrfinal]
GO

CREATE PROC paSerieListar @parametro VARCHAR(6000)
AS 
	SELECT id, titulo, sinopsis, director, duracion, fechaEstreno, usuarioRegistro
	FROM Serie
	WHERE registroActivo = 1
		AND titulo+sinopsis like '%'+@parametro+'%'

	insert into Serie values  ('Gato volador', 'Trata de un gato con polainas voladoras','Don Papu', '2', '04/09/2010','gatush05', 1) 

	EXEC paSerieListar ''

insert into Usuario (usuario, clave, rol, registroActivo)
values ('carlosz', ENCRYPTBYPASSPHRASE('SIS457-1nf0!','12345678'),'admin',1)