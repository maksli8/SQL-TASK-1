-- Удалим таблицы если уже существуют (чтобы пересоздать заново)
IF OBJECT_ID('OrderDetails', 'U') IS NOT NULL DROP TABLE OrderDetails;
IF OBJECT_ID('Orders', 'U') IS NOT NULL DROP TABLE Orders;
IF OBJECT_ID('Products', 'U') IS NOT NULL DROP TABLE Products;
IF OBJECT_ID('Employees', 'U') IS NOT NULL DROP TABLE Employees;
IF OBJECT_ID('Customers', 'U') IS NOT NULL DROP TABLE Customers;
GO

-- Таблица Customers
CREATE TABLE Customers (
    CustomerNo INT PRIMARY KEY,
    FName NVARCHAR(50) NOT NULL,
    LName NVARCHAR(50) NOT NULL,
    MName NVARCHAR(50) NULL,
    Address1 NVARCHAR(100) NULL,
    Address2 NVARCHAR(100) NULL,
    City NVARCHAR(50) NULL,
    Phone NVARCHAR(20) NULL,
    DateInSystem DATE NULL
);
GO

-- Таблица Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FName NVARCHAR(50) NOT NULL,
    LName NVARCHAR(50) NOT NULL,
    MName NVARCHAR(50) NULL,
    Salary MONEY NULL,
    PriorSalary MONEY NULL,
    HireDate DATE NULL,
    TerminationDate DATE NULL,
    ManagerEmpID INT NULL,
    FOREIGN KEY (ManagerEmpID) REFERENCES Employees(EmployeeID)
);
GO

-- Таблица Products
CREATE TABLE Products (
    ProdID INT PRIMARY KEY,
    Description NCHAR(50) NOT NULL,
    UnitPrice MONEY NULL,
    Weight NUMERIC(18,0) NULL
);
GO

-- Таблица Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerNo INT NOT NULL,
    OrderDate DATE NULL,
    EmployeeID INT NOT NULL,
    FOREIGN KEY (CustomerNo) REFERENCES Customers(CustomerNo),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
GO

-- Таблица OrderDetails
CREATE TABLE OrderDetails (
    OrderID INT NOT NULL,
    LineItem INT NOT NULL,
    ProdID INT NOT NULL,
    Qty INT NOT NULL,
    UnitPrice MONEY NOT NULL,
    PRIMARY KEY (OrderID, LineItem),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProdID) REFERENCES Products(ProdID)
);
GO

SELECT * FROM OrderDetails;
SELECT * FROM Orders;
SELECT * FROM Products;
SELECT * FROM Employees;
SELECT * FROM Customers;