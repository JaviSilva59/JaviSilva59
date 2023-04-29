use yourdatabasenamehere
go

CREATE PROCEDURE spInsertNewOrder
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

--exec spInsertNewOrder 7, 'Javi', 'Silva', '100 Main', 'Apt 2', 'Stillwater', 35, '74074',
--	 'Javi', 'Silva', '100 Main', 'Apt 2', 'Stillwater', 35, '74074'