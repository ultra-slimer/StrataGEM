USE [master]
GO
/****** Object:  Database [StrataGEM]    Script Date: 24/10/2019 11:46:10 ******/
CREATE DATABASE [StrataGEM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StrataGEM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StrataGEM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StrataGEM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StrataGEM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StrataGEM] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StrataGEM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StrataGEM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StrataGEM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StrataGEM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StrataGEM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StrataGEM] SET ARITHABORT OFF 
GO
ALTER DATABASE [StrataGEM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StrataGEM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StrataGEM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StrataGEM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StrataGEM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StrataGEM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StrataGEM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StrataGEM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StrataGEM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StrataGEM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StrataGEM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StrataGEM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StrataGEM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StrataGEM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StrataGEM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StrataGEM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StrataGEM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StrataGEM] SET RECOVERY FULL 
GO
ALTER DATABASE [StrataGEM] SET  MULTI_USER 
GO
ALTER DATABASE [StrataGEM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StrataGEM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StrataGEM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StrataGEM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StrataGEM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StrataGEM', N'ON'
GO
ALTER DATABASE [StrataGEM] SET QUERY_STORE = OFF
GO
USE [StrataGEM]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [StrataGEM]
GO
/****** Object:  User [alumno]    Script Date: 24/10/2019 11:46:11 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 24/10/2019 11:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[IdGame] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Image] [varchar](50) NOT NULL,
	[Description] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[IdGame] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 24/10/2019 11:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[IdReview] [int] IDENTITY(1,1) NOT NULL,
	[IdGame] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Descrition] [varchar](400) NOT NULL,
	[Userr] [int] NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[IdReview] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 24/10/2019 11:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IdRole] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IdRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24/10/2019 11:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Mail] [varchar](50) NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Games] ON 

INSERT [dbo].[Games] ([IdGame], [Name], [Image], [Description]) VALUES (1, N'Undertale', N'Undertale.png', N'Undertale es un videojuego de rol creado por el desarrollador independiente Toby Fox, en el que se adopta el control de un humano que ha caído en un mundo subterráneo conocido como el subsuelo, una región enorme aislada debajo de la superficie de la tierra, separada por una barrera mágica. A lo largo de la partida se encuentra con varios monstruos durante la misión de regresar a la superficie, principalmente a través del sistema de combate; navegando a través de mini-ataques bullet hell del adversario, y optar por pacificar o someter a los monstruos con el fin de perdonarlos en lugar de asesinarlos. Estas opciones afectan a la jugabilidad, los diálogos, los personajes y la historia, cambiando en función de los resultados.')
INSERT [dbo].[Games] ([IdGame], [Name], [Image], [Description]) VALUES (2, N'Red Dead Redemption 2', N'RDR2.png', N'América, 1899. El ocaso del Salvaje Oeste ha comenzado y las fuerzas de la ley dan caza a las últimas bandas de forajidos. Los que no se rinden o sucumben, son asesinados. Tras un desastroso atraco fallido en la ciudad de Blackwater, Arthur Morgan y la banda de Van der Linde se ven obligados a huir. Con agentes federales y los mejores cazarrecompensas de la nación pisándoles los talones, la banda deberá atracar, robar y luchar, para sobrevivir en su camino por el escabroso territorio del corazón de América. Mientras las divisiones internas aumentan y amenazan con separarlos a todos, Arthur deberá elegir entre sus propios ideales y la lealtad a la banda que lo vio crecer.')
INSERT [dbo].[Games] ([IdGame], [Name], [Image], [Description]) VALUES (3, N'Super Smash Bros. Ultimate', N'SmashUlt.png', N'Super Smash Bros. Ultimate, como otros videojuegos de la serie Super Smash Bros., presenta un crossover de luchadores de diferentes franquicias de Nintendo —como las series de videojuegos de Mario y Metroid— así como combatientes icónicos de propiedades de terceros, tales como Sonic the Hedgehog, Pac-Man, Solid Snake y Mega Man.')
INSERT [dbo].[Games] ([IdGame], [Name], [Image], [Description]) VALUES (4, N'Spider-Man (videojuego de 2018)', N'Spidey.png', N'Peter Parker es un chico de 23 años, becario en un laboratorio Whilst y próximo a graduarse de la universidad.15? Peter ha sido el hombre araña por ocho años y se ha desempeñado como el protector de la Ciudad de Nueva York. En sus comienzos como héroe, Peter logró derrotar a un jefe mafioso llamado Wilson Fisk (alias Kingpin), pero una nueva pandilla conocida como los "Inner Demons" emergió apoderándose de los antiguos territorios de Fisk. El hombre araña llega un día a un edificio en construcción propiedad de Kingpin teniendo que defender a sus hombres, quienes se encontraban bajo ataque de los Inner Demons.16? Tras deshacerse de ellos, Peter descubre que Martin Li, uno de los más prominentes filántropos de Nueva York, es quien lidera a los Inner Demons, bajo su alter ego Señor Negativo. Martin al ser director del albergue para desamparados F.E.A.S.T., complicará la vida personal de Peter, ya que su tía May trabaja en dicha institución.')
INSERT [dbo].[Games] ([IdGame], [Name], [Image], [Description]) VALUES (5, N'New Super Mario Bros. Wii', N'Mario.png', N'La historia inicia cuando se está celebrando el cumpleaños de la Princesa Peach en su castillo y un extraño pastel se recibe en la puerta. Cuando llega a Peach, salen del pastel Bowser Jr. y los siete Koopalings, quienes atrapan a la princesa del Reino Champiñón en el mismo pastel del que salieron y se la llevan, y en persecución de estos van Mario, Luigi, Yellow Toad y Blue Toad. ')
SET IDENTITY_INSERT [dbo].[Games] OFF
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([IdReview], [IdGame], [Rating], [Descrition], [Userr]) VALUES (1, 1, 15, N'Malardo juego bro, quiero mis pewsos de vuelta', 1)
INSERT [dbo].[Reviews] ([IdReview], [IdGame], [Rating], [Descrition], [Userr]) VALUES (2, 2, 60, N'Regular', 2)
INSERT [dbo].[Reviews] ([IdReview], [IdGame], [Rating], [Descrition], [Userr]) VALUES (3, 3, 45, N'Aburre despues de un tiempo', 6)
INSERT [dbo].[Reviews] ([IdReview], [IdGame], [Rating], [Descrition], [Userr]) VALUES (4, 4, 100, N'Epicardo juego man', 4)
INSERT [dbo].[Reviews] ([IdReview], [IdGame], [Rating], [Descrition], [Userr]) VALUES (5, 5, 1, N'Malisima interfaz de usario, para nada intuitiva', 2)
INSERT [dbo].[Reviews] ([IdReview], [IdGame], [Rating], [Descrition], [Userr]) VALUES (6, 1, 53, N'muy pobre el desarrollo del personaje principal', 2)
INSERT [dbo].[Reviews] ([IdReview], [IdGame], [Rating], [Descrition], [Userr]) VALUES (7, 2, 87, N'Muy bueno, no le doy un 100 por lo que pesa el juego', 1)
INSERT [dbo].[Reviews] ([IdReview], [IdGame], [Rating], [Descrition], [Userr]) VALUES (8, 3, 20, N'Pobre recreación de mi anime favorito ', 3)
INSERT [dbo].[Reviews] ([IdReview], [IdGame], [Rating], [Descrition], [Userr]) VALUES (9, 4, 67, N'Esta bueno', 5)
INSERT [dbo].[Reviews] ([IdReview], [IdGame], [Rating], [Descrition], [Userr]) VALUES (10, 5, 22, N'La verdad es re agresivo el juego, mi hijo mato asu tortuga por este juego', 1)
SET IDENTITY_INSERT [dbo].[Reviews] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([IdRole], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([IdRole], [RoleName]) VALUES (2, N'Moderador')
INSERT [dbo].[Roles] ([IdRole], [RoleName]) VALUES (3, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([IdUser], [UserName], [Password], [Mail], [Role]) VALUES (1, N'Manolito', N'Manolito', N'Manolito@manolito.com', 3)
INSERT [dbo].[Users] ([IdUser], [UserName], [Password], [Mail], [Role]) VALUES (2, N'Choi', N'Choi', N'Choisito@gmail.choi', 3)
INSERT [dbo].[Users] ([IdUser], [UserName], [Password], [Mail], [Role]) VALUES (3, N'admin', N'admin', N'admin@admin.com', 1)
INSERT [dbo].[Users] ([IdUser], [UserName], [Password], [Mail], [Role]) VALUES (4, N'Juansito', N'Juansito', N'Juansito@gmail.com', 2)
INSERT [dbo].[Users] ([IdUser], [UserName], [Password], [Mail], [Role]) VALUES (5, N'ultra-slimer', N'ultra-slimer', N'Slimer@gmail.com', 2)
INSERT [dbo].[Users] ([IdUser], [UserName], [Password], [Mail], [Role]) VALUES (6, N'UnPerro', N'UnPerro', N'Perro@gmail.com', 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Games] FOREIGN KEY([IdGame])
REFERENCES [dbo].[Games] ([IdGame])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Games]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users] FOREIGN KEY([Userr])
REFERENCES [dbo].[Users] ([IdUser])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([Role])
REFERENCES [dbo].[Roles] ([IdRole])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[AgregarJuego]    Script Date: 24/10/2019 11:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AgregarJuego]
	@Name varchar(50), @imagen varchar(50),  @Descripcion varchar(100), @Rating int
AS
BEGIN

INSERT INTO Games(Name, Image, Description, Rating) VALUES (@Name, @imagen, @Descripcion, 0);

END
GO
/****** Object:  StoredProcedure [dbo].[CambiarRol]    Script Date: 24/10/2019 11:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CambiarRol] 
	@Id int, @Rol int
AS
BEGIN
	UPDATE Users set Role=@Rol WHERE IdUser = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[CrearUsuario]    Script Date: 24/10/2019 11:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrearUsuario] 
	@Name varchar(50), @Password varchar(50), @Mail varchar(50), @role int
AS
BEGIN
	INSERT INTO Users (UserName, Password, Mail, Role) VALUES (@Name, @Password, @Mail, @role);
END
GO
/****** Object:  StoredProcedure [dbo].[EditarUsuario]    Script Date: 24/10/2019 11:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditarUsuario] 
	@Id int, @UserName varchar(50), @Password varchar(50), @Mail varchar(50)
AS
BEGIN
	if(@UserName is not NULL)
	BEGIN
	UPDATE Users set UserName=@UserName WHERE IdUser = @Id
	END
		if(@Password is not NULL)
	BEGIN
	UPDATE Users set Password=@Password WHERE IdUser = @Id
	END
		if(@Mail is not NULL)
	BEGIN
	UPDATE Users set Mail=@Mail WHERE IdUser = @Id
	END

END
GO
/****** Object:  StoredProcedure [dbo].[EliminarJuego]    Script Date: 24/10/2019 11:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarJuego] 
	@Id int
AS
BEGIN
	
	DELETE FROM Games WHERE IdGame = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarUsuario]    Script Date: 24/10/2019 11:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarUsuario]
	@Id int
AS
BEGIN
	
	DELETE FROM Users WHERE IdUser = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerReseñas]    Script Date: 24/10/2019 11:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObtenerReseñas] 
@IdGame int
AS
BEGIN
	Select * from Reviews where IdGame = @IdGame
END
GO
/****** Object:  StoredProcedure [dbo].[PromedioReviews]    Script Date: 24/10/2019 11:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PromedioReviews]
@id int
AS
BEGIN
	select AVG(Rating) as Promedio from Reviews WHERE IdGame = @id

END
GO
/****** Object:  StoredProcedure [dbo].[TraerUsuario]    Script Date: 24/10/2019 11:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TraerUsuario]
	@Id int
AS
BEGIN

    SELECT * from Users where IdUser = @Id
END
GO
USE [master]
GO
ALTER DATABASE [StrataGEM] SET  READ_WRITE 
GO
