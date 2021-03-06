USE [master]
GO
/****** Object:  Database [LobaBD]    Script Date: 05/09/2014 22:21:19 ******/
CREATE DATABASE [LobaBD] ON  PRIMARY 
( NAME = N'LobaBD', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\LobaBD.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LobaBD_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\LobaBD_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LobaBD] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LobaBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LobaBD] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [LobaBD] SET ANSI_NULLS OFF
GO
ALTER DATABASE [LobaBD] SET ANSI_PADDING OFF
GO
ALTER DATABASE [LobaBD] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [LobaBD] SET ARITHABORT OFF
GO
ALTER DATABASE [LobaBD] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [LobaBD] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [LobaBD] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [LobaBD] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [LobaBD] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [LobaBD] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [LobaBD] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [LobaBD] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [LobaBD] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [LobaBD] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [LobaBD] SET  DISABLE_BROKER
GO
ALTER DATABASE [LobaBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [LobaBD] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [LobaBD] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [LobaBD] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [LobaBD] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [LobaBD] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [LobaBD] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [LobaBD] SET  READ_WRITE
GO
ALTER DATABASE [LobaBD] SET RECOVERY SIMPLE
GO
ALTER DATABASE [LobaBD] SET  MULTI_USER
GO
ALTER DATABASE [LobaBD] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [LobaBD] SET DB_CHAINING OFF
GO
USE [LobaBD]
GO
/****** Object:  Table [dbo].[tbl_actualizacion]    Script Date: 05/09/2014 22:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_actualizacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contenido] [varchar](500) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_pregunta] [int] NOT NULL,
	[position] [int] NULL,
 CONSTRAINT [PK_tbl_actualizacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_actualizacion] ON
INSERT [dbo].[tbl_actualizacion] ([id], [contenido], [fecha], [id_pregunta], [position]) VALUES (1, N'noo yo tambien tengo varios lunares!', CAST(0x0000A3260093B3B8 AS DateTime), 1, 0)
INSERT [dbo].[tbl_actualizacion] ([id], [contenido], [fecha], [id_pregunta], [position]) VALUES (2, N'es el bocho?', CAST(0x0000A326009EED28 AS DateTime), 5, 0)
INSERT [dbo].[tbl_actualizacion] ([id], [contenido], [fecha], [id_pregunta], [position]) VALUES (3, N'o mi raptor :D ?', CAST(0x0000A326009F036C AS DateTime), 5, 1)
SET IDENTITY_INSERT [dbo].[tbl_actualizacion] OFF
/****** Object:  Table [dbo].[tbl_mejor_respuesta]    Script Date: 05/09/2014 22:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_mejor_respuesta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[comentario] [varchar](500) NOT NULL,
	[valoracion] [int] NOT NULL,
	[id_respuesta] [int] NULL,
 CONSTRAINT [PK_tbl_mejor_respuesta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_mejor_respuesta] ON
INSERT [dbo].[tbl_mejor_respuesta] ([id], [comentario], [valoracion], [id_respuesta]) VALUES (1, N'', 4, 1)
INSERT [dbo].[tbl_mejor_respuesta] ([id], [comentario], [valoracion], [id_respuesta]) VALUES (2, N'Por que si!', 2, 5)
SET IDENTITY_INSERT [dbo].[tbl_mejor_respuesta] OFF
/****** Object:  Table [dbo].[tbl_categoria]    Script Date: 05/09/2014 22:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tbl_categoria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_tbl_categoria] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_categoria] ON
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (1, N'Arte y Humanidades')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (2, N'Autos y Transporte')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (3, N'Belleza y Moda')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (4, N'Ciencias Sociales')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (5, N'Ciencias y Matemáticas')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (6, N'Comer y Beber')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (7, N'Computadoras e Internet')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (8, N'Deportes')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (9, N'Educación y Formación')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (10, N'Electrónica de Consumo')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (11, N'Embarazo y Maternidad')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (12, N'Familia, Amor y Relaciones')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (13, N'Hogar y Jardinería')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (14, N'Juegos y Recreación')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (15, N'Mascotas')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (16, N'Medio Ambiente')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (17, N'Música y Entretenimiento')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (18, N'Negocios Locales')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (19, N'Negocios y Finanzas')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (20, N'Noticias y Eventos')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (21, N'Política y Gobierno')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (22, N'Restaurantes')
INSERT [dbo].[tbl_categoria] ([id], [nombre]) VALUES (23, N'Salud y Belleza')
SET IDENTITY_INSERT [dbo].[tbl_categoria] OFF
/****** Object:  Table [dbo].[tbl_respuesta]    Script Date: 05/09/2014 22:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_respuesta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cuerpo] [varchar](500) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_pregunta] [int] NOT NULL,
	[position] [int] NULL,
 CONSTRAINT [PK_tbl_respuesta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_respuesta] ON
INSERT [dbo].[tbl_respuesta] ([id], [cuerpo], [fecha], [id_usuario], [id_pregunta], [position]) VALUES (1, N'Pues yo tambien tengo lunares, pero no mes los reviso muy frecuentemente', CAST(0x0000A32600942B40 AS DateTime), 2, 1, 0)
INSERT [dbo].[tbl_respuesta] ([id], [cuerpo], [fecha], [id_usuario], [id_pregunta], [position]) VALUES (2, N'soñar con un parto significa que vas a tener nuevas oportunidades...por otra parte soñarse como una novia significa q algún familiar va a fallecer.', CAST(0x0000A3260095BADC AS DateTime), 3, 2, 0)
INSERT [dbo].[tbl_respuesta] ([id], [cuerpo], [fecha], [id_usuario], [id_pregunta], [position]) VALUES (3, N'Distribuiría un poco, pescado, verdura, ensaladas y carne. Un menú equilibrado, que no todo fuese grasa ni frituras. :S', CAST(0x0000A326009D8C6C AS DateTime), 3, 3, 0)
INSERT [dbo].[tbl_respuesta] ([id], [cuerpo], [fecha], [id_usuario], [id_pregunta], [position]) VALUES (5, N'la Lobo de mi tio!! esta alreraddaaaaaa', CAST(0x0000A326009F8904 AS DateTime), 2, 5, 0)
INSERT [dbo].[tbl_respuesta] ([id], [cuerpo], [fecha], [id_usuario], [id_pregunta], [position]) VALUES (6, N'respuestaa', CAST(0x0000A32600A03B24 AS DateTime), 2, 3, 1)
SET IDENTITY_INSERT [dbo].[tbl_respuesta] OFF
/****** Object:  Table [dbo].[tbl_comentario]    Script Date: 05/09/2014 22:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_comentario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contenido] [varchar](500) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_respuesta] [int] NOT NULL,
	[position] [int] NULL,
 CONSTRAINT [PK_tbl_comentario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_comentario] ON
INSERT [dbo].[tbl_comentario] ([id], [contenido], [fecha], [id_usuario], [id_respuesta], [position]) VALUES (1, N'PD: Segun yo, no es malo tener lunares, a menos que sean a causa de los rayos solares, en todo caso serian manchasssss', CAST(0x0000A3260094DE8C AS DateTime), 2, 1, 0)
INSERT [dbo].[tbl_comentario] ([id], [contenido], [fecha], [id_usuario], [id_respuesta], [position]) VALUES (2, N'Yo me los reviso a cada mes, para ver si no me salen manchas por la radiación solar :(', CAST(0x0000A3260095F1F0 AS DateTime), 3, 1, 1)
INSERT [dbo].[tbl_comentario] ([id], [contenido], [fecha], [id_usuario], [id_respuesta], [position]) VALUES (3, N'mi mami cosina sin grasa n.n', CAST(0x0000A326009DC128 AS DateTime), 3, 3, 0)
SET IDENTITY_INSERT [dbo].[tbl_comentario] OFF
/****** Object:  Table [dbo].[tbl_calificacion]    Script Date: 05/09/2014 22:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_calificacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipoVoto] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_respuesta] [int] NOT NULL,
	[position] [int] NULL,
 CONSTRAINT [PK_tbl_calificacion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_calificacion] ON
INSERT [dbo].[tbl_calificacion] ([id], [tipoVoto], [id_usuario], [id_respuesta], [position]) VALUES (1, 0, 3, 2, 0)
INSERT [dbo].[tbl_calificacion] ([id], [tipoVoto], [id_usuario], [id_respuesta], [position]) VALUES (2, 0, 3, 1, 0)
INSERT [dbo].[tbl_calificacion] ([id], [tipoVoto], [id_usuario], [id_respuesta], [position]) VALUES (3, 0, 3, 3, 0)
SET IDENTITY_INSERT [dbo].[tbl_calificacion] OFF
/****** Object:  Table [dbo].[tbl_usuario]    Script Date: 05/09/2014 22:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellidos] [varchar](50) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[nombre_usuario] [varchar](50) NOT NULL,
	[contrasena] [varchar](50) NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[fechaNacimiento] [datetime] NOT NULL,
	[sexo] [int] NOT NULL,
	[path_imagen] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tbl_usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_usuario] ON
INSERT [dbo].[tbl_usuario] ([id], [nombre], [apellidos], [correo], [nombre_usuario], [contrasena], [fechaRegistro], [fechaNacimiento], [sexo], [path_imagen]) VALUES (1, N'Julio', N'Ramos', N'ramos.isw@yahoo.mx', N'ramos.isw', N'12345', CAST(0x0000A32600914B50 AS DateTime), CAST(0x0000857000000000 AS DateTime), 1, N'~/Images/Upload/8082571.jpg')
INSERT [dbo].[tbl_usuario] ([id], [nombre], [apellidos], [correo], [nombre_usuario], [contrasena], [fechaRegistro], [fechaNacimiento], [sexo], [path_imagen]) VALUES (2, N'Edgar', N'Rascon', N'rascon.isw@yahoo.mx', N'rascon.isw', N'12345', CAST(0x0000A3260093EBF8 AS DateTime), CAST(0x000083F900000000 AS DateTime), 1, N'~/Images/hombre.png')
INSERT [dbo].[tbl_usuario] ([id], [nombre], [apellidos], [correo], [nombre_usuario], [contrasena], [fechaRegistro], [fechaNacimiento], [sexo], [path_imagen]) VALUES (3, N'Ivonne', N'Morales', N'ivonne.isw@yahoo.mx', N'ivonne.isw', N'12345', CAST(0x0000A32600956424 AS DateTime), CAST(0x0000852500000000 AS DateTime), 2, N'~/Images/mujer.png')
INSERT [dbo].[tbl_usuario] ([id], [nombre], [apellidos], [correo], [nombre_usuario], [contrasena], [fechaRegistro], [fechaNacimiento], [sexo], [path_imagen]) VALUES (4, N'Jesus', N'Cece', N'cece@yahoo.mx', N'cece', N'12345', CAST(0x0000A326009E4EF4 AS DateTime), CAST(0x00003FCC00000000 AS DateTime), 1, N'~/Images/Upload/8669841.jpeg')
SET IDENTITY_INSERT [dbo].[tbl_usuario] OFF
/****** Object:  Table [dbo].[tbl_pregunta]    Script Date: 05/09/2014 22:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_pregunta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](150) NOT NULL,
	[descripcion] [varchar](1500) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_categoria] [int] NOT NULL,
	[id_subcategoria] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_mejor_respuesta] [int] NULL,
 CONSTRAINT [PK_tbl_pregunta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_pregunta] ON
INSERT [dbo].[tbl_pregunta] ([id], [titulo], [descripcion], [fecha], [id_categoria], [id_subcategoria], [id_usuario], [id_mejor_respuesta]) VALUES (1, N'nada mas que por tu salud seria bueno que te vayas a revisar tus lunares cada tanto.', N'Quiero saber :(', CAST(0x0000A3260093AA58 AS DateTime), 23, 201, 1, 1)
INSERT [dbo].[tbl_pregunta] ([id], [titulo], [descripcion], [fecha], [id_categoria], [id_subcategoria], [id_usuario], [id_mejor_respuesta]) VALUES (2, N'¿necesito ayuda, soñé algo extraño?', N'hola , les comento anoche soñé que nacía un niño de pelo negro, el niño era de mi prima y lo veía al revés! soñé con todas las camas tendidas! eran varias pero en un casa que yo no conozco, soñé que estaba vestida de novia no recuerdo bien , si de blanco, y soñé que subía unas escaleras hermosas y en el cielo había un hermoso castillo, allí estaba toda mi familia de parte de papa vestida de paño, y yo tomaba fotos, pero algunas personas me daban la espalda! y no los veía por hay , yo tomaba la foto y hay si salían ellos en la foto pero las sillas y mesas estaban desocupadas y cuando tome la foto todos aparecieron fue raro , era un castillo hermosisimo jamas había visto algo tan hermoso, yo subía ese castillo con dos personas como niñas que no conocía y una mujer también extraña se despedía de nosotras y subíamos allí, pero no recuerdo quienes eran , luego sentí que subí sola !! es extraño pero me hace pensar en muchas cosas que sera? todos estaban de paño como si hubiese matrimonio ..', CAST(0x0000A32600953544 AS DateTime), 4, 30, 2, NULL)
INSERT [dbo].[tbl_pregunta] ([id], [titulo], [descripcion], [fecha], [id_categoria], [id_subcategoria], [id_usuario], [id_mejor_respuesta]) VALUES (3, N'¿si elaboraras el menu para la semana¿que prepararias para el almuerzo?', N' ', CAST(0x0000A326009C99D8 AS DateTime), 6, 49, 1, NULL)
INSERT [dbo].[tbl_pregunta] ([id], [titulo], [descripcion], [fecha], [id_categoria], [id_subcategoria], [id_usuario], [id_mejor_respuesta]) VALUES (4, N'Voy a pasar Calidad de software??', N'Tengo esa duda!!
Chamacooooosss!!!!!', CAST(0x0000A326009D4298 AS DateTime), 9, 93, 3, NULL)
INSERT [dbo].[tbl_pregunta] ([id], [titulo], [descripcion], [fecha], [id_categoria], [id_subcategoria], [id_usuario], [id_mejor_respuesta]) VALUES (5, N'Cual es el auto mas rapido del mundo', N'tengo esa duda...', CAST(0x0000A326009ED108 AS DateTime), 2, 15, 4, 2)
SET IDENTITY_INSERT [dbo].[tbl_pregunta] OFF
/****** Object:  Table [dbo].[tbl_subcategoria]    Script Date: 05/09/2014 22:21:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_subcategoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[id_categoria] [int] NULL,
	[position] [int] NULL,
 CONSTRAINT [PK_tbl_subcategoria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_subcategoria] ON
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (1, N'Artes Escénicas', 1, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (2, N'Artes Visuales', 1, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (3, N'Danza', 1, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (4, N'Filosofía', 1, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (5, N'Genealogía', 1, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (6, N'Historia', 1, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (7, N'Libros y Autores', 1, 6)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (8, N'Otros - Arte y Humanidades', 1, 7)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (9, N'Poesía', 1, 8)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (10, N'Teatro y Actuación', 1, 9)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (11, N'Aeronavegación', 2, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (12, N'Audio para Autos', 2, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (13, N'Compra y Venta', 2, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (14, N'Mantenimiento y Reparación', 2, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (15, N'Marcas de Autos', 2, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (16, N'Motos', 2, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (17, N'Otros - Transporte y Automóviles', 2, 6)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (18, N'Seguridad', 2, 7)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (19, N'Seguros', 2, 8)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (20, N'Transporte Marítimo', 2, 9)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (21, N'Trenes', 2, 10)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (22, N'Tráfico', 2, 11)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (23, N'Cabello', 3, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (24, N'Cuidado Corporal', 3, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (25, N'Maquillaje', 3, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (26, N'Moda y Accesorios', 3, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (27, N'Antropología', 4, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (28, N'Economía', 4, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (29, N'Estudios sobre el hombre y la mujer', 4, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (30, N'Interpretación de los Sueños', 4, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (31, N'Otras - Ciencias Sociales', 4, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (32, N'Psicología', 4, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (33, N'Sociología', 4, 6)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (34, N'Agricultura', 5, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (35, N'Astronomía', 5, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (36, N'Biología', 5, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (37, N'Botánica', 5, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (38, N'Ciencias Alternativas', 5, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (39, N'Física', 5, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (40, N'Geografía', 5, 6)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (41, N'Geología', 5, 7)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (42, N'Ingeniería', 5, 8)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (43, N'Matemáticas', 5, 9)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (44, N'Medicina', 5, 10)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (45, N'Meteorología', 5, 11)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (46, N'Otras - Ciencias', 5, 12)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (47, N'Química', 5, 13)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (48, N'Zoología', 5, 14)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (49, N'Bebidas sin Alcohol', 6, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (50, N'Cerveza, Vino y Bebidas Alcohólicas', 6, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (51, N'Cocina Étnica', 6, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (52, N'Hardware', 7, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (53, N'Internet', 7, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (54, N'Otros - Computadoras', 7, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (55, N'Programación y Diseño', 7, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (56, N'Redes informáticas', 7, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (57, N'Seguridad', 7, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (58, N'Software', 7, 6)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (59, N'Artes Marciales', 8, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (60, N'Atletismo', 8, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (61, N'Baloncesto', 8, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (62, N'Balonmano', 8, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (63, N'Billar', 8, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (64, N'Boxeo', 8, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (65, N'Buceo y Natación', 8, 6)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (66, N'Béisbol', 8, 7)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (67, N'Carreras de Caballos', 8, 8)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (68, N'Carreras de Motocicletas', 8, 9)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (69, N'Ciclismo', 8, 10)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (70, N'Copa Mundial de Cricket', 8, 11)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (71, N'Deportes', 8, 12)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (72, N'Deportes y Naturaleza', 8, 13)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (73, N'Deportes de Agua', 8, 14)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (74, N'Deportes de Fantasía', 8, 15)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (75, N'Deportes de Invierno', 8, 16)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (76, N'Deportes de Motor', 8, 17)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (77, N'Disciplinas Olímpicas', 8, 18)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (78, N'Fútbol', 8, 19)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (79, N'Fútbol Americano', 8, 20)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (80, N'Fútbol Australiano', 8, 21)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (81, N'Fútbol Canadiense', 8, 22)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (82, N'Golf', 8, 23)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (83, N'Hockey', 8, 24)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (84, N'Lucha Libre', 8, 25)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (85, N'Otros - Deportes', 8, 26)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (86, N'Rugby', 8, 27)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (87, N'Tenis', 8, 28)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (88, N'Voleibol', 8, 29)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (89, N'Ayuda Financiera', 9, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (90, N'Ayuda con los Estudios', 9, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (91, N'Eduación Primaria y Secundaria', 9, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (92, N'Educación Especial', 9, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (93, N'Educación Superior', 9, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (94, N'Estudiar en el Extranjero', 9, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (95, N'Estudios a Distancia', 9, 6)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (96, N'Estándares y Exámenes', 9, 7)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (97, N'Frases Celébres', 9, 8)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (98, N'Juegos de Palabras', 9, 9)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (99, N'Cine en Casa', 10, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (100, N'Cámaras Fotográficas', 10, 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (101, N'Otros - Electrónica', 10, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (102, N'PDAs', 10, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (103, N'Reproductores de Música', 10, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (104, N'TVs', 10, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (105, N'Teléfonos Celulares y Planes', 10, 6)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (106, N'Teléfonos Fijos', 10, 7)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (107, N'Adolescentes y Pre Adolescentes', 11, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (108, N'Adopción', 11, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (109, N'Bebés y Recién Nacidos', 11, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (110, N'Buscando Quedar Embarazada', 11, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (111, N'Educación Primaria', 11, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (112, N'Embarazo', 11, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (113, N'Niños en Edad Pre Escolar', 11, 6)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (114, N'Amigos', 12, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (115, N'Bodas y Compromisos', 12, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (116, N'Familia', 12, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (117, N'Matrimonios y Divorcios', 12, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (118, N'Decoración', 13, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (119, N'Hazlo tu Mismo', 13, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (120, N'Jardinería', 13, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (121, N'Limpieza', 13, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (122, N'Apuestas', 14, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (123, N'Hobbies y Aficiones', 14, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (124, N'Juegos de Cartas', 14, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (125, N'Juegos de Mesa', 14, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (126, N'Juguetes', 14, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (127, N'Otros - Juegos y Recreación', 14, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (128, N'Parques Temáticos', 14, 6)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (129, N'Videojuegos', 14, 7)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (130, N'Aves', 15, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (131, N'Caballos', 15, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (132, N'Gatos', 15, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (133, N'Otros - Mascotas', 15, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (134, N'Peces', 15, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (135, N'Perros', 15, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (136, N'Calentamiento Global', 16, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (137, N'Conservación', 16, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (138, N'Otros- Medio Ambiente', 16, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (139, N'Vehículos de Combustible Alternativo', 16, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (140, N'Vida Ecológica', 16, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (141, N'Celebridades', 17, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (142, N'Chistes y Humor', 17, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (143, N'Comics y Animación', 17, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (144, N'Encuestas y Sondeos de Opinión', 17, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (145, N'Horóscopos', 17, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (146, N'Música', 17, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (147, N'Otros - Música y Entretenimiento', 17, 6)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (148, N'Películas', 17, 7)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (149, N'Alemania', 18, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (150, N'Argentina', 18, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (151, N'Australia', 18, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (152, N'Austria', 18, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (153, N'Brasil', 18, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (154, N'Canadá', 18, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (155, N'España', 18, 6)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (156, N'Estados Unidos de América', 18, 7)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (157, N'Francia', 18, 8)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (158, N'India', 18, 9)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (159, N'Indonesia', 18, 10)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (160, N'Irlanda', 18, 11)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (161, N'Italia', 18, 12)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (162, N'México', 18, 13)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (163, N'Créditos', 19, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (164, N'Empleos', 19, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (165, N'Empresas', 19, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (166, N'Finanzas Personales', 19, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (167, N'Impuestos', 19, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (168, N'Inversiones', 19, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (169, N'Marketing y Publicidad', 19, 6)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (170, N'Otros - Negocios y Finanzas', 19, 7)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (171, N'Actualidad', 20, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (172, N'Medios y Periodismo', 20, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (173, N'Otros - Noticias y Eventos', 20, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (174, N'Elecciones', 21, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (175, N'Embajadas y Consulados', 21, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (176, N'Fuerzas Armadas', 21, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (177, N'Gobierno', 21, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (178, N'Alemania', 22, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (179, N'Argentina', 22, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (180, N'Australia', 22, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (181, N'Austria', 22, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (182, N'Brasil', 22, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (183, N'Canadá', 22, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (184, N'Comida Rápida', 22, 6)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (185, N'España', 22, 7)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (186, N'Estados Unidos', 22, 8)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (187, N'Filipinas', 22, 9)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (188, N'Francia', 22, 10)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (189, N'India', 22, 11)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (190, N'Indonesia', 22, 12)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (191, N'Irlanda', 22, 13)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (192, N'Italia', 22, 14)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (193, N'Malasia', 22, 15)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (194, N'México', 22, 16)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (195, N'Cuidados Generales de la Salud', 23, 0)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (196, N'Dieta y Ponerse en Forma', 23, 1)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (197, N'Enfermedades', 23, 2)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (198, N'Medicinas Alternativas', 23, 3)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (199, N'Odontología', 23, 4)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (200, N'Oftalmología', 23, 5)
INSERT [dbo].[tbl_subcategoria] ([id], [nombre], [id_categoria], [position]) VALUES (201, N'Otros - Salud y Belleza', 23, 6)
GO
print 'Processed 200 total records'
SET IDENTITY_INSERT [dbo].[tbl_subcategoria] OFF
/****** Object:  ForeignKey [FK_tbl_actualizacion_tbl_pregunta]    Script Date: 05/09/2014 22:21:19 ******/
ALTER TABLE [dbo].[tbl_actualizacion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_actualizacion_tbl_pregunta] FOREIGN KEY([id_pregunta])
REFERENCES [dbo].[tbl_pregunta] ([id])
GO
ALTER TABLE [dbo].[tbl_actualizacion] CHECK CONSTRAINT [FK_tbl_actualizacion_tbl_pregunta]
GO
/****** Object:  ForeignKey [FK_tbl_mejor_respuesta_tbl_respuesta]    Script Date: 05/09/2014 22:21:19 ******/
ALTER TABLE [dbo].[tbl_mejor_respuesta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_mejor_respuesta_tbl_respuesta] FOREIGN KEY([id_respuesta])
REFERENCES [dbo].[tbl_respuesta] ([id])
GO
ALTER TABLE [dbo].[tbl_mejor_respuesta] CHECK CONSTRAINT [FK_tbl_mejor_respuesta_tbl_respuesta]
GO
/****** Object:  ForeignKey [FK_tbl_respuesta_tbl_pregunta]    Script Date: 05/09/2014 22:21:19 ******/
ALTER TABLE [dbo].[tbl_respuesta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_respuesta_tbl_pregunta] FOREIGN KEY([id_pregunta])
REFERENCES [dbo].[tbl_pregunta] ([id])
GO
ALTER TABLE [dbo].[tbl_respuesta] CHECK CONSTRAINT [FK_tbl_respuesta_tbl_pregunta]
GO
/****** Object:  ForeignKey [FK_tbl_respuesta_tbl_usuario]    Script Date: 05/09/2014 22:21:20 ******/
ALTER TABLE [dbo].[tbl_respuesta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_respuesta_tbl_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tbl_usuario] ([id])
GO
ALTER TABLE [dbo].[tbl_respuesta] CHECK CONSTRAINT [FK_tbl_respuesta_tbl_usuario]
GO
/****** Object:  ForeignKey [FK_tbl_comentario_tbl_respuesta]    Script Date: 05/09/2014 22:21:20 ******/
ALTER TABLE [dbo].[tbl_comentario]  WITH CHECK ADD  CONSTRAINT [FK_tbl_comentario_tbl_respuesta] FOREIGN KEY([id_respuesta])
REFERENCES [dbo].[tbl_respuesta] ([id])
GO
ALTER TABLE [dbo].[tbl_comentario] CHECK CONSTRAINT [FK_tbl_comentario_tbl_respuesta]
GO
/****** Object:  ForeignKey [FK_tbl_comentario_tbl_usuario]    Script Date: 05/09/2014 22:21:20 ******/
ALTER TABLE [dbo].[tbl_comentario]  WITH CHECK ADD  CONSTRAINT [FK_tbl_comentario_tbl_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tbl_usuario] ([id])
GO
ALTER TABLE [dbo].[tbl_comentario] CHECK CONSTRAINT [FK_tbl_comentario_tbl_usuario]
GO
/****** Object:  ForeignKey [FK_tbl_calificacion_tbl_respuesta]    Script Date: 05/09/2014 22:21:20 ******/
ALTER TABLE [dbo].[tbl_calificacion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_calificacion_tbl_respuesta] FOREIGN KEY([id_respuesta])
REFERENCES [dbo].[tbl_respuesta] ([id])
GO
ALTER TABLE [dbo].[tbl_calificacion] CHECK CONSTRAINT [FK_tbl_calificacion_tbl_respuesta]
GO
/****** Object:  ForeignKey [FK_tbl_calificacion_tbl_usuario]    Script Date: 05/09/2014 22:21:20 ******/
ALTER TABLE [dbo].[tbl_calificacion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_calificacion_tbl_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tbl_usuario] ([id])
GO
ALTER TABLE [dbo].[tbl_calificacion] CHECK CONSTRAINT [FK_tbl_calificacion_tbl_usuario]
GO
/****** Object:  ForeignKey [FK_tbl_pregunta_tbl_categoria]    Script Date: 05/09/2014 22:21:20 ******/
ALTER TABLE [dbo].[tbl_pregunta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_pregunta_tbl_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[tbl_categoria] ([id])
GO
ALTER TABLE [dbo].[tbl_pregunta] CHECK CONSTRAINT [FK_tbl_pregunta_tbl_categoria]
GO
/****** Object:  ForeignKey [FK_tbl_pregunta_tbl_mejor_respuesta]    Script Date: 05/09/2014 22:21:20 ******/
ALTER TABLE [dbo].[tbl_pregunta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_pregunta_tbl_mejor_respuesta] FOREIGN KEY([id_mejor_respuesta])
REFERENCES [dbo].[tbl_mejor_respuesta] ([id])
GO
ALTER TABLE [dbo].[tbl_pregunta] CHECK CONSTRAINT [FK_tbl_pregunta_tbl_mejor_respuesta]
GO
/****** Object:  ForeignKey [FK_tbl_pregunta_tbl_subcategoria]    Script Date: 05/09/2014 22:21:20 ******/
ALTER TABLE [dbo].[tbl_pregunta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_pregunta_tbl_subcategoria] FOREIGN KEY([id_subcategoria])
REFERENCES [dbo].[tbl_subcategoria] ([id])
GO
ALTER TABLE [dbo].[tbl_pregunta] CHECK CONSTRAINT [FK_tbl_pregunta_tbl_subcategoria]
GO
/****** Object:  ForeignKey [FK_tbl_pregunta_tbl_usuario]    Script Date: 05/09/2014 22:21:20 ******/
ALTER TABLE [dbo].[tbl_pregunta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_pregunta_tbl_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tbl_usuario] ([id])
GO
ALTER TABLE [dbo].[tbl_pregunta] CHECK CONSTRAINT [FK_tbl_pregunta_tbl_usuario]
GO
/****** Object:  ForeignKey [FK_tbl_subcategoria_tbl_categoria]    Script Date: 05/09/2014 22:21:20 ******/
ALTER TABLE [dbo].[tbl_subcategoria]  WITH CHECK ADD  CONSTRAINT [FK_tbl_subcategoria_tbl_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[tbl_categoria] ([id])
GO
ALTER TABLE [dbo].[tbl_subcategoria] CHECK CONSTRAINT [FK_tbl_subcategoria_tbl_categoria]
GO
/****** Object:  ForeignKey [FK_tbl_subcategoria_tbl_categoria1]    Script Date: 05/09/2014 22:21:20 ******/
ALTER TABLE [dbo].[tbl_subcategoria]  WITH CHECK ADD  CONSTRAINT [FK_tbl_subcategoria_tbl_categoria1] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[tbl_categoria] ([id])
GO
ALTER TABLE [dbo].[tbl_subcategoria] CHECK CONSTRAINT [FK_tbl_subcategoria_tbl_categoria1]
GO
