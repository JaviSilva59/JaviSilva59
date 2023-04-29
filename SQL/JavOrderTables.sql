use yourdatabasenamehere
go

CREATE TABLE OrderHeader
(OrderHeaderID int Identity(1,1) not null Primary Key,
 UserID int not null Foreign Key references UserMaster(UserID),
 ShippingFirstName varchar(50) not null,
 ShippingLastName varchar(100) not null,
 ShippingAddress1 varchar(100) not null,
 ShippingAddress2 varchar(50) null,
 ShippingCity varchar(100) not null,
 ShippingStateID int not null Foreign Key references StateMaster(StateID),
 ShippingZipcode char(10) not null,
 BillingFirstName varchar(50) not null,
 BillingLastName varchar(100) not null,
 BillingAddress1 varchar(100) not null,
 BillingAddress2 varchar(50) null,
 BillingCity varchar(100) not null,
 BillingStateID int not null Foreign Key references StateMaster(StateID),
 BillingZipcode char(10) not null)
 go
 
 CREATE TABLE OrderItems
 (OrderItemsID int Identity(1,1) not null Primary Key,
  OrderHeaderID int not null Foreign Key references OrderHeader(OrderHeaderID),
  ProductID int not null Foreign Key references ProductMaster(ProductID),
  Quantity int,
  Price decimal(18,2))
  go

  Create Type OrderItems as Table
(
	ProductID int,
	Quantity int,
	Price decimal(18,2)
)
go


	