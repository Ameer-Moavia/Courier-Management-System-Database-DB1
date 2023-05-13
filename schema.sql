Create database couriermanagement;

CREATE TABLE Branch (
BranchCode VARCHAR(100) PRIMARY KEY,
street_no INT NOT NULL,
city VARCHAR(200) NOT NULL
);


CREATE TABLE Designation(
DesignationRole INT PRIMARY KEY,
DesignationName VARCHAR(200),
Salary INT NOT NULL,
WorkingHours INT NOT NULL
);

CREATE TABLE Employee (
EmployeeID INT PRIMARY KEY,
Name VARCHAR(200) NOT NULL,
PhoneNumber VARCHAR(200) UNIQUE NOT NULL,
street_no INT NOT NULL,
city VARCHAR(200) NOT NULL,
country VARCHAR(200) NOT NULL,
Email VARCHAR(200),
DesignationRole INT  FOREIGN KEY REFERENCES Designation(DesignationRole),
BranchCode VARCHAR(100) FOREIGN KEY REFERENCES Branch(BranchCode)
ON DELETE CASCADE
);

CREATE TABLE Customer (
CustomerID INT PRIMARY KEY,
Name VARCHAR(200) NOT NULL,
PhoneNumber VARCHAR(200) NOT NULL UNIQUE,
CNIC VARCHAR(200) UNIQUE NOT NULL,
street_no INT NOT NULL,
City VARCHAR(200),
Country VARCHAR(200),
Email VARCHAR(200) UNIQUE,
RegistrationDate DATE
);

CREATE TABLE ComplaintCategory(
ComplaintID INT PRIMARY KEY,
Nature VARCHAR(230) NOT NULL,
Category VARCHAR(200) NOT NULL
);

CREATE TABLE Status(
status_ID INT PRIMARY KEY,
status VARCHAR(200)
);

CREATE TABLE Complaint(
ComplaintNumber INT UNIQUE NOT NULL,
ComplaintID INT FOREIGN KEY REFERENCES ComplaintCategory(ComplaintID),
Description VARCHAR(255) NOT NULL,
ComplaintDate DATE,
Status INT FOREIGN KEY REFERENCES Status(status_ID),
CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
Primary Key(ComplaintID,CustomerID) 
);

CREATE TABLE ParcelCategory(
CategoryID INT PRIMARY KEY,
Nature VARCHAR(200) NOT NULL,
Category VARCHAR(200) NOT NULL
);
 
CREATE TABLE Parcel(
ParcelNumber INT NOT NULL UNIQUE,
CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
Weight_Kg INT NOT NULL,
CategoryID INT FOREIGN KEY REFERENCES ParcelCategory(CategoryID),
BranchCode VARCHAR(100) FOREIGN KEY REFERENCES Branch(BranchCode),
Date DATE,
Primary Key(CustomerID,CategoryID,ParcelNumber)
);
 
CREATE TABLE VehicleCategory(
CategoryID INT PRIMARY KEY,
Type VARCHAR(200) NOT NULL,
ParcelCapacity INT NOT NULL
);



CREATE TABLE CourrierVehicle(
VehicleNumber VARCHAR(200) PRIMARY KEY,
CategoryID INT FOREIGN KEY REFERENCES VehicleCategory(CategoryID),
RegistrationDate DATE 
);

DROP TABLE DeliveryInfo
CREATE TABLE DeliveryInfo(
DeliveryID INT,
TOADDRESS_street_no INT NOT NULL,
City VARCHAR(200),
Country VARCHAR(200),
DueDate DATE,
TrackingID VARCHAR(200) UNIQUE NOT NULL,
CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
VehicleNumber  VARCHAR(200) FOREIGN KEY REFERENCES CourrierVehicle(VehicleNumber),
CategoryID INT FOREIGN KEY REFERENCES BillingCategory(CategoryID),
DeliveryStatus INT FOREIGN KEY REFERENCES Status(status_ID)
);

SELECT * FROM BillingCategory
CREATE TABLE BillingCategory(
CategoryID INT PRIMARY KEY,
Weight_Kg VARCHAR(200),
Price INT,
UpdatedDate Date,
PreviousPrice INT
);
 

CREATE TABLE Billing(
BillingNumber INT UNIQUE NOT NULL,
Date DATE,
BranchCode VARCHAR(100) FOREIGN KEY REFERENCES  Branch(BranchCode),
CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
CategoryID INT FOREIGN KEY REFERENCES BillingCategory(CategoryID),
ParcelNumber INT FOREIGN KEY REFERENCES Parcel(ParcelNumber),
 ShiftID INT FOREIGN KEY REFERENCES VehicleShift(ShiftID)
Primary Key(BranchCode,CustomerID,CategoryID)
);


CREATE TABLE VehicleShift(
ShiftID INT NOT NULL UNIQUE,   
VehicleNumber VARCHAR(200) FOREIGN KEY REFERENCES CourrierVehicle(VehicleNumber),
EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
WorkingHours DATE,
Primary Key(VehicleNumber,EmployeeID,ShiftID)
);



