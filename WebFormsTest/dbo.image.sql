CREATE TABLE [dbo].Images
(
	[Id] INT NOT NULL identity(1,1) PRIMARY KEY,
	image_path varchar(100),
	image_alt varchar(100),
)
