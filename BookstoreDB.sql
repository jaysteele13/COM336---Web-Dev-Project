CREATE DATABASE Bookstore;
#Make student id 9 chars
-- SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE Bookstore.Customer (
  CustomerID varchar(8) NOT NULL,
  FName varchar(20) NOT NULL,
  SName varchar (30) NOT NULL,
  Street varchar(50) NULL,
  City varchar (20) NULL,
  Postcode varchar(8) NOT NULL,
  DOB date NOT NULL,  
  Sex varchar(1) NULL,
  Email varchar(50) NOT NULL,
  Password varchar(30) NOT NULL,
  
  CONSTRAINT Customer_PK PRIMARY KEY (CustomerID),
  CONSTRAINT Customer_AK UNIQUE KEY (Email)
);

CREATE TABLE Bookstore.Admin (
  AdminID varchar(8) NOT NULL,
  FName varchar(20) NOT NULL,
  SName varchar (30) NOT NULL,
  Street varchar(50) NULL,
  City varchar (20) NULL,
  Postcode varchar(8) NOT NULL,
  DOB date NOT NULL,  
  Sex varchar(1) NULL,
  Email varchar(50) NOT NULL,
  Password varchar(30) NOT NULL,
  
  CONSTRAINT Admin_PK PRIMARY KEY (AdminID),
  CONSTRAINT Admin_AK UNIQUE KEY (Email)
);

CREATE TABLE Bookstore.Book (
	BookID varchar(8) NOT NULL,
	Description varchar(350) NOT NULL,
	BookTitle varchar (50) NOT NULL,
	Genre varchar (30) NOT NULL,
	Price float NOT NULL,
	BookFormat varchar (15) NOT NULL,
	NumPages int NOT NULL,
	BookLanguage varchar(20) NOT NULL,
	DatePublished date NOT NULL,
	AmountInStock int NOT NULL,
	
	CONSTRAINT Book_PK PRIMARY KEY (BookID),
	CONSTRAINT Book_AK UNIQUE KEY (BookTitle)
);


CREATE TABLE Bookstore.Reviews (
	ReviewID varchar(8) NOT NULL,
	CustomerID varchar(8) NOT NULL,
	BookID varchar(8) NOT NULL,
	Rating varchar(3) NOT NULL, 
	Description varchar (300) NULL,
	ReviewDate date NOT NULL,
	
	CONSTRAINT Review_PK PRIMARY KEY (ReviewID),
	CONSTRAINT Review_FK1 FOREIGN KEY(CustomerID) REFERENCES Bookstore.Customer(CustomerID),
	CONSTRAINT Review_FK2 FOREIGN KEY(BookID) REFERENCES Bookstore.Book(BookID)
	
);

CREATE TABLE Bookstore.Orders (
	OrderID varchar(16) NOT NULL,
	CustomerID varchar(8) NOT NULL,
	BookID varchar(8) NOT NULL,
	
	CONSTRAINT Orders_PK PRIMARY KEY (OrderID),
	CONSTRAINT Orders_FK1 FOREIGN KEY(CustomerID) REFERENCES Bookstore.Customer(CustomerID),
	CONSTRAINT Orders_FK2 FOREIGN KEY(BookID) REFERENCES Bookstore.Book(BookID)

);

CREATE TABLE Bookstore.BookOrders (
	BookID varchar(8) NOT NULL,
	OrderID varchar(16) NOT NULL,
	Quantity int NOT NULL,
	
	CONSTRAINT BookOrders_PK PRIMARY KEY (BookID, OrderID),
	CONSTRAINT BookOrders_FK1 FOREIGN KEY(BookID) REFERENCES Bookstore.Book(BookID),
	CONSTRAINT BookOrders_FK2 FOREIGN KEY(OrderID) REFERENCES Bookstore.Orders(OrderID)

);

-- DROP Database Bookstore;