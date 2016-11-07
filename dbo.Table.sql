CREATE TABLE [dbo].[Table]
(
	[Id] INT NOT NULL identity(1,1) PRIMARY KEY,
	[price] float null,
bathrooms int,
bedrooms int,
home_location varchar(100),
contact_name varchar(50),
email_contact varchar(50),
phone varchar(12),
home_address varchar(100),
square_feet varchar(10),
year_built varchar(15),
garages varchar(5),
notes varchar(4000)
)
