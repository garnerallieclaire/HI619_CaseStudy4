CREATE TABLE CUSTOMER(
	CustomerID			Int						NOT NULL IDENTITY (1, 1),
	LastName			Char(25)				NOT NULL,
	FirstName			Char(25)				NOT NULL,
	EmailAddress		Varchar(100)			NULL,
	EncryptedPassword	VarChar(50)				NULL,
	Address				Char(35)				NULL,
	City				Char(35)				NULL,
	State				Char(2)					NULL,
	ZIP					Char(10)				NULL,
	Phone				Char(12)				NOT NULL,
	ReferredBy			Int						NULL,
	CONSTRAINT 			CUSTOMER_PK 			PRIMARY KEY(CustomerID),
	CONSTRAINT			CUSTOMER_FK_REFER		FOREIGN KEY (ReferredBy)
								REFERENCES CUSTOMER (CustomerID)
	);

CREATE TABLE EMPLOYEE(
	EmployeeID			Int 					NOT NULL IDENTITY (1, 1),
	LastName			Char(25) 				NOT NULL,
	FirstName			Char(25) 				NOT NULL,
	Position			Char(25)				NOT NULL,
	Supervisor			Int						NULL,
	OfficePhone			Char(12)				NULL,
	EmailAddress		VarChar(100)			NOT NULL UNIQUE,
	CONSTRAINT 			EMPLOYEE_PK 			PRIMARY KEY(EmployeeID),
	CONSTRAINT			EMPLOYEE_FK_SUPER		FOREIGN KEY (Supervisor)
								REFERENCES EMPLOYEE (EmployeeID)
	);

CREATE TABLE VENDOR(
	VendorID			Int						NOT NULL IDENTITY (1, 1),
	CompanyName			Char(100)				NULL,
	ContactLastName		Char(25)				NOT NULL,
	ContactFirstName	Char(25)				NOT NULL,
	Address				Char(35)				NULL,
	City				Char(35)				NULL,
	State				Char(2)					NULL,
	ZIP					Char(10)				NULL,
	Phone				Char(12)				NOT NULL,
	Fax					Char(12)				NULL,
	EmailAddress		VarChar(100)			NULL,
	CONSTRAINT 			VENDOR_PK 				PRIMARY KEY(VendorID)
	);	


CREATE  TABLE ITEM(
	ItemID				Int	 					NOT NULL IDENTITY (1,1),
	ItemDescription		VarChar(255)			NOT NULL,
	PurchaseDate		Date					NOT NULL,
	ItemCost			Numeric(9,2)			NOT NULL,
	ItemPrice			Numeric(9,2)			NOT NULL,
	VendorID			Int						NOT NULL,
	CONSTRAINT 			ITEM_PK					PRIMARY KEY (ItemID),
	CONSTRAINT 			ITEM_VENDOR_FK  		FOREIGN KEY	(VendorID)
								REFERENCES VENDOR(VendorID)
									ON UPDATE NO ACTION
									ON DELETE NO ACTION
	);

CREATE  TABLE SALE(
    SaleID				Int						NOT NULL IDENTITY (1, 1),
	CustomerID			Int	 					NOT NULL,
	EmployeeID			Int						NOT NULL,
	SaleDate			Date					NOT NULL,
	SubTotal			Numeric(15,2)			NULL,
	Tax					Numeric(15,2)			NULL,
	Total				Numeric(15,2)			NULL,
	CONSTRAINT 			SALE_PK 				PRIMARY KEY (SaleID),
	CONSTRAINT 			SALE_CUSTOMER_FK		FOREIGN KEY (CustomerID)
								REFERENCES CUSTOMER(CustomerID)
									ON UPDATE NO ACTION
									ON DELETE NO ACTION,
	CONSTRAINT 			SALE_EMPLOYEE_FK 	FOREIGN KEY(EmployeeID)
								REFERENCES EMPLOYEE(EmployeeID)
									ON UPDATE NO ACTION
									ON DELETE NO ACTION
	);

CREATE  TABLE SALE_ITEM(
	SaleID				Int						NOT NULL,
	SaleItemID			Int						NOT NULL,
	ItemID				Int	 					NOT NULL,
	ItemPrice			Numeric(9,2)			NOT NULL,
	CONSTRAINT 			SALE_ITEM_PK			PRIMARY KEY (SaleID, SaleItemID),
	CONSTRAINT 			SALE_ITEM_SALE_FK		FOREIGN KEY (SaleID)
								REFERENCES SALE(SaleID)
									ON UPDATE NO ACTION
									ON DELETE CASCADE,
	CONSTRAINT 			SALE_ITEM_ITEM_FK		FOREIGN KEY (ItemID)
								REFERENCES ITEM(ItemID)
									ON UPDATE NO ACTION
									ON DELETE NO ACTION
	);
