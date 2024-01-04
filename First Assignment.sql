--1. Create a new database named "CompanyDB."
create database CompanyDB;

use CompanyDB;

--2. Design and create tables: Employees.

--3. Employees table should have fields: EmployeeID (int, primary key), FirstName (varchar), LastName (varchar), DepartmentID (int, foreign key to Departments table), and Salary (decimal).
CREATE TABLE Employees (
    EmployeeID INT not null unique identity,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2)
	foreign key (DepartmentID) references Departments(DepartmentID)
);

--7. Insert at least 10 records into the Employees table with appropriate DepartmentIDs.
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary)
VALUES
    ('Zain', 'Sarfraz', 1, 60000.00),
    ('Sohaib', 'Sarfraz', 2, 55000.00),
    ('Tayyaba', 'Shakeel', 4, 65000.00),
    ('Uzair', 'Ahmed', 3, 70000.00),
    ('Umair', 'Ahmed', 2, 50000.00),
    ('Sarfraz', 'Ahmed', 5, 62000.00),
    ('Taha', 'Zahid', 3, 75000.00),
    ('Rizwan', 'Kamran', 5, 53000.00),
    ('Affan', 'Imran', 1, 58000.00),
    ('Safwan', 'Imran', 4, 72000.00);

--2. Design and create tables: Departments.

--4. Departments table should have fields: DepartmentID (int, primary key), DepartmentName (varchar).
CREATE TABLE Departments (
    DepartmentID INT not null unique identity,
    DepartmentName VARCHAR(50)
);

--6. Insert at least 5 records into the Departments table.
INSERT INTO Departments (DepartmentName)
VALUES
    ( 'HR'),
    ( 'IT'),
	( 'HealthCare'),    
	( 'Management'),
    ( 'Finance');


--5. Add a new column called "HireDate" (datetime) to the Employees table.
	alter table Employees add HireDate datetime;

--8. Update the salary of employees in the IT department (assuming IT has DepartmentID 1) to increase it by 10%.
UPDATE Employees SET Salary = Salary * 1.1 WHERE DepartmentID = 2;

--9. Delete the records of employees whose salaries are less than 30000.
DELETE FROM Employees WHERE Salary < 30000;

--10. Select Data using INNER JOIN: Write a SQL query to retrieve the FirstName, LastName, DepartmentName, and Salary of employees by joining the Employees and Departments tables.
SELECT E.FirstName, E.LastName, D.DepartmentName, E.Salary FROM Employees E INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;

--11. Select Data using LEFT JOIN: Write a SQL query to retrieve all departments and the number of employees in each department, even if there are no employees in that department.
SELECT D.DepartmentID, D.DepartmentName, COUNT(E.EmployeeID) AS NumberOfEmployees FROM Departments D LEFT JOIN Employees E ON D.DepartmentID = E.DepartmentID GROUP BY D.DepartmentID, D.DepartmentName;

--12. Select Data using WHERE and JOIN: Write a query to select the FirstName, LastName, and HireDate of employees who were hired after '2023-01-01'.
SELECT FirstName, LastName, HireDate FROM Employees WHERE HireDate > '2023-01-01';