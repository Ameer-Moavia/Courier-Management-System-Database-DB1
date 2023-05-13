	/*=========== Employee History Table========*/

--Employee History Table
CREATE TABLE EmployeeHistory(
id INT IDENTITY(1,1),
History VARCHAR(200)
)

--After Insert Trigger For Employee Table
CREATE TRIGGER employeeAfterInsert
ON Employee
FOR INSERT
AS
	BEGIN
		Declare @id int
		Select @id = EmployeeID from inserted
 
 insert into EmployeeHistory
 values('New employee with Id  = ' + Cast(@id as nvarchar(200)) + ' is added at ' + cast(Getdate() as nvarchar(200)))

	END
--insert values in table
INSERT INTO Employee
VALUES
(1213,'Hasan','0336-687301',202,'Gojra','Pakistan','hasan182@gmail.com',2,'HM35')

select * from Employee
select * from EmployeeHistory






--After Delete Trigger For Employee Table
CREATE TRIGGER  employeeAfterDelete
ON Employee
FOR DELETE
AS
BEGIN
 Declare @id int
 Select @id = EmployeeID from deleted
 
 insert into EmployeeHistory 
 values('An existing employee with Id  = ' + Cast(@id as nvarchar(200)) + ' is deleted at ' + Cast(Getdate() as nvarchar(200)))
END

DELETE FROM Employee where EmployeeID=1210;
 select * from EmployeeHistory
 

/*After Update Table and Record to another new table*/

SELECT * FROM Employee;

CREATE TABLE Employee_Audit (
		EmployeeID INT,
		Name VARCHAR(200) NOT NULL,
		PhoneNumber VARCHAR(200) UNIQUE NOT NULL,
		street_no INT NOT NULL,
		city VARCHAR(200) NOT NULL,
		country VARCHAR(200) NOT NULL,
		Email VARCHAR(200),
		DesignationRole INT,
		BranchCode VARCHAR(100),
		Change_Date DateTime
);

CREATE Trigger Employee_History
On Employee
	After Update
As

	Begin

		Set Nocount On;

		Insert Into Employee_Audit(EmployeeID,Name,PhoneNumber,street_no,city,country,Email,DesignationRole,BranchCode,Change_Date)
		Select EmployeeID,Name,PhoneNumber,street_no,city,country,Email,DesignationRole,BranchCode,GetDate() From Inserted I

	End;
Select * From Employee

Select * From Employee_Audit



Update Employee Set Name = 'Haris' Where EmployeeID = 1003

/*==========================================*/



/*After Update delivery status Table and Record to another new table*/

SELECT * FROM DeliveryInfo;

CREATE TABLE DeliveryInfoHistory(
DeliveryID INT,
TOADDRESS_street_no INT NOT NULL,
City VARCHAR(200),
Country VARCHAR(200),
DueDate DATE,
TrackingID VARCHAR(200)  NOT NULL,
CustomerID INT  ,
VehicleNumber  VARCHAR(200)  ,
CategoryID INT  ,
DeliveryStatus INT,
changeDate DATETIME
);

CREATE Trigger DeliveryHistory
On DeliveryInfo
	After Update
As

	Begin

		Set Nocount On;

		Insert Into DeliveryInfoHistory(DeliveryID,TOADDRESS_street_no,City,Country,DueDate,TrackingID,CustomerID,VehicleNumber,CategoryID,DeliveryStatus,changeDate)
		Select DeliveryID,TOADDRESS_street_no,City,Country,DueDate,TrackingID,CustomerID,VehicleNumber,CategoryID,DeliveryStatus,GetDate() From Inserted I

	End;
Select * From DeliveryInfo

Select * From DeliveryInfoHistory


Update DeliveryInfo Set DeliveryStatus = 1 Where DeliveryID = 1122
 
select * from  DeliveryInfo

/*=====================================================*/


--Shift History Table
CREATE TABLE vehicleShiftHistory(
id INT IDENTITY(1,1),
History VARCHAR(200)
)


--After Insert Trigger For Shift Table

CREATE TRIGGER shiftAfterInsert
ON vehicleShift
FOR INSERT
AS
	BEGIN
		Declare @id int
		Select @id = ShiftID from inserted
 
 insert into vehicleShiftHistory
 values('New shift with Id  = ' + Cast(@id as nvarchar(200)) + ' is added at ' + cast(Getdate() as nvarchar(200)))

	END

--insert values in table
INSERT INTO VehicleShift
VALUES
(1202,'Hasan','0336-6873007',202,'Gojra','Pakistan','hasan182@gmail.com',2,'HM35')

select * from VehicleShift

INSERT INTO VehicleShift 
VALUES
(301,'AAJ-94',1170,'2022-02-19')


select * from vehicleShiftHistory

--After Delete Trigger For SHIFT Table
CREATE TRIGGER  shiftAfterDelete
ON VehicleShift
FOR DELETE
AS
BEGIN
 Declare @id int
 Select @id = ShiftID from deleted
 
 insert into vehicleShiftHistory
 values('New shift with Id  = ' + Cast(@id as nvarchar(200)) + ' is deleted at ' + Cast(Getdate() as nvarchar(200)))
END
 
 DELETE FROM VehicleShift WHERE ShiftID=301
select * from vehicleShiftHistory
