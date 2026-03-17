/* *** SQL-Statement-QACS_CH07-D *** */

UPDATE ITEM
SET ItemDescription = 'Desk Lamps'
WHERE ItemDescription = 'Desk Lamp';

/* *** SQL-Statement-QACS_CH07-E *** */

INSERT INTO SALE
VALUES
(2, 2, '17-Feb-13', 80.00, 9.96, 89.96);

INSERT INTO SALE_ITEM
VALUES (16, 1, 4, 50.00)

INSERT INTO SALE_ITEM
VALUES (16, 2, 25, 60.00)

DELETE FROM SALE
WHERE SaleID = 16

/* *** SQL-Statement-QACS_CH07-F *** */

CREATE FUNCTION FullNameFunction 
(@FirstName CHAR(25), @LastName CHAR(25))
RETURNS VARCHAR (60)
AS
BEGIN
	DECLARE @FullName VARCHAR (60);
	SELECT @FullName = RTRIM(@FirstName) + ' ' + RTRIM (@LastName);
	RETURN @FullName;
END; 

/* *** SQL-Statement-QACS_CH07-G *** */

CREATE VIEW CustomerFullNameSaleHistoryView AS
SELECT 
SALE.SaleID,
SALE.SaleDate,
dbo.FullNameFunction (CUSTOMER.FirstName, CUSTOMER.LastName) AS FullName,
SUM(ITEM.ItemPrice) AS SumItemPrice, 
AVG(ITEM.ItemPrice) AS AveItemPrice
FROM 
SALE
INNER JOIN CUSTOMER ON SALE.CustomerID = CUSTOMER.CustomerID
INNER JOIN SALE_ITEM ON SALE.SaleID = SALE_ITEM.SaleID
INNER JOIN ITEM ON SALE_ITEM.ItemID = ITEM.ItemID
GROUP BY
SALE.SaleID, SALE.SaleDate, dbo.FULLNameFunction (CUSTOMER.FirstName, CUSTOMER.LastName);

SELECT * FROM dbo.CustomerFullNameSaleHistoryView;

/* *** SQL-Statement-QACS_CH07-H *** */

CREATE VIEW EmployeeSupervisorView AS
SELECT E.LastName AS EmployeeLastName, 
E.FirstName AS EmployeeFirstName, 
E.Position AS Position, 
S.LastName AS SupervisorLastName, 
S.FirstName AS SupervisorFirstName
FROM EMPLOYEE E
JOIN EMPLOYEE S
ON E.Supervisor = S.EmployeeID

SELECT * FROM dbo.EmployeeSupervisorView

/* *** SQL-Statement-QACS_CH08-B *** */

CREATE TABLE CUSTOMER_SALE_INT (
CustomerID		Int		NOT NULL,
SaleID			Int		NOT NULL,
CONSTRAINT		CustomerSale_PK
	PRIMARY KEY (CustomerID, SaleID),
CONSTRAINT		Customer_Sale_Int_Customer_FK
	FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID),
CONSTRAINT		Customer_Sale_Int_Sale_FK
	FOREIGN KEY	(SaleID) REFERENCES SALE(SaleID) );

INSERT INTO CUSTOMER_SALE_INT (CustomerID, SaleID)
SELECT CustomerID, SaleID
FROM SALE;

ALTER TABLE SALE
DROP CONSTRAINT SALE_CUSTOMER_FK;

ALTER TABLE SALE
DROP COLUMN CustomerID;







