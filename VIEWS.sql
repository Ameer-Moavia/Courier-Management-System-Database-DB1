SELECT * FROM Designation;
SELECT * FROM Branch;
SELECT * FROM Employee;
SELECT * FROM Customer;
SELECT * FROM ComplaintCategory;
SELECT * FROM status;
SELECT * FROM Complaint;
SELECT * FROM ParcelCategory
SELECT * FROM Parcel
SELECT * FROM VehicleCategory
SELECT * FROM CourrierVehicle
SELECT * FROM BillingCategory
SELECT * FROM DeliveryInfo
SELECT * FROM Billing
SELECT * FROM VehicleShift

SELECT CITY FROM DeliveryInfo WHERE CITY='Swabi'
 




/*To show delivery status of parcel*/
CREATE VIEW customerDelivery
AS
SELECT c.CustomerID,c.City AS Arrival,d.City as Departure,d.DeliveryStatus FROM Customer c
INNER JOIN DeliveryInfo d ON c.CustomerID=d.CustomerID 

SELECT * FROM customerDelivery

/*To view branch total parcel and revenue*/

CREATE VIEW branchData
AS
SELECT br.BranchCode,SUM(bil.Price) AS TotalSALES,COUNT(b.CategoryID) AS Total  FROM Branch br
 INNER JOIN Billing b ON br.BranchCode=b.BranchCode
 INNER JOIN Parcel p ON p.ParcelNumber=b.ParcelNumber
 INNER JOIN BillingCategory bil ON bil.CategoryID=b.CategoryID
 GROUP BY br.BranchCode 

SELECT * FROM branchData 


CREATE VIEW showNatureofParcel
AS
SELECT p.CustomerID,p.BranchCode,p.ParcelNumber,p.Weight_Kg,pc.Nature FROM ParcelCategory pc
INNER JOIN Parcel p ON pc.CategoryID=p.CategoryID 

SELECT * FROM branchData


/*BRACNH TOTAL SALARY*/
 CREATE VIEW branchSalary
 AS
SELECT br.BranchCode,SUM(d.Salary) AS Salary FROM Designation d
INNER JOIN Employee e ON d.DesignationRole=e.DesignationRole
INNER JOIN Branch br ON br.BranchCode=e.BranchCode
group by br.BranchCode

SELECT * FROM branchSalary


	SELECT  SUM(bil.Price) AS TotalSALES FROM Branch br
 INNER JOIN Billing b ON br.BranchCode=b.BranchCode
 INNER JOIN Parcel p ON p.ParcelNumber=b.ParcelNumber
 INNER JOIN BillingCategory bil ON bil.CategoryID=b.CategoryID
  


	
	SELECT * FROM DeliveryInfo 
	select * from Status