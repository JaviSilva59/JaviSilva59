use f21_ksjavsilv
go 

drop table UserMaster
drop table UserProfile
drop table Cart
drop table Shop
drop table OrderHeader
drop table OrderItems


create table UserMaster (
UserID int identity(1,1) primary key not null, 
FirstName varchar(50) not null,
MiddNameOrInitial varchar(50) not null,
LastName varchar(50) not null,
EmailUsername varchar(100) not null, 
UserPassword varbinary(max) not null,
PasswordSalt char(100) not null)
go

	create unique index ind_UserMaster
	on UserMaster(EmailUsername);


create table Shop (
ShopID int identity(1,1) primary key not null,
ItemName varchar(50) not null,
ItemPrice varchar(100) not null,
ItemDescription varchar(100) not null)
go

create table StateMaster (
StateID int identity(1, 1) primary key not null,
StateAbbr char(2) not null)
go

create table OrderHeader (
OrderHeaderID int Identity(1,1) not null Primary Key,
 UserID int not null Foreign Key references UserMaster(UserID),
 ShippingStateID int not null foreign key references StateMaster(StateID),
 ShippingFirstName varchar(50) not null,
 ShippingLastName varchar(100) not null,
 ShippingAddress1 varchar(100) not null,
 ShippingAddress2 varchar(50) null,
 ShippingCity varchar(100) not null,
 ShippingZipcode char(10) not null,
 BillingStateID int not null Foreign Key references StateMaster(StateID),
 BillingFirstName varchar(50) not null,
 BillingLastName varchar(100) not null,
 BillingAddress1 varchar(100) not null,
 BillingAddress2 varchar(50) null,
 BillingCity varchar(100) not null,
 BillingZipcode char(10) not null)
 go


  create table OrderItems (
 OrderItemsID int Identity(1,1) not null Primary Key,
  OrderHeaderID int not null Foreign Key references OrderHeader(OrderHeaderID),
  ProductID int not null Foreign Key references Shop(ShopID),
  Quantity int,
  Price decimal(18,2))
  go


  /*create Type OrderItems as Table (
	ProductID int,
	Quantity int,
	Price decimal(18,2))*/


/*Stored Procedure*/
create procedure spInsertNewOrder
@UserID int,
@ShippingFirstName varchar(50),
@ShippingLastName varchar(50),
@ShippingAddress1 varchar(100),
@ShippingAddress2 varchar(50),
@ShippingCity varchar(100),
@ShippingStateID int,
@ShippingZipcode char(10),
@BillingFirstName varchar(50),
@BillingLastName varchar(50),
@BillingAddress1 varchar(100),
@BillingAddress2 varchar(50),
@BillingCity varchar(100),
@BillingStateID int,
@BillingZipcode char(10),
@OrderHeaderID int output,
@OrderItems OrderItems READONLY
as
BEGIN
	INSERT INTO OrderHeader
	(UserID, ShippingFirstName, ShippingLastName, ShippingAddress1, ShippingAddress2, ShippingCity, ShippingStateID, ShippingZipcode,
	 BillingFirstName, BillingLastName, BillingAddress1, BillingAddress2, BillingCity, BillingStateID, BillingZipcode)
	VALUES
	(@UserID, @ShippingFirstName, @ShippingLastName, @ShippingAddress1, @ShippingAddress2, @ShippingCity, @ShippingStateID, @ShippingZipcode,
	 @BillingFirstName, @BillingLastName, @BillingAddress1, @BillingAddress2, @BillingCity, @BillingStateID, @BillingZipcode)

	 Set @OrderHeaderID = SCOPE_IDENTITY();

	 INSERT INTO OrderItems
	 (OrderHeaderID, ProductID, Quantity, Price)
	 SELECT @OrderHeaderID, ProductID, Quantity, Price
	 FROM @OrderItems
END
GO




insert into Shop (ItemName, ItemPrice, ItemDescription) values (' Champ','12.99','Champion Shirt'),('Chewy','9.99','Chewy Dog Bowl'),('Puppy Elf','15.99','Efl Costume'),('Cozy Ears','8.99','Dog Beanie'),('Fall Coat','15.99','Rain Coat with Dog bag'), ('Cowboy','4.99','Bandana');

 


 create procedure prStates
 as 
 Begin
	select StateID, StateAbbr
	from StateMaster
	order by StateAbbr
 End
 Go