/*CREATE TABLE Employees_3 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE
);

CREATE TABLE Departments_3 (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Employees_3 (EmployeeID, Name, DepartmentID, Salary, HireDate) VALUES
(1, 'Alice', 1, 70000, '2018-01-15'),
(2, 'Bob', 2, 80000, '2019-03-10'),
(3, 'Charlie', 1, 60000, '2017-07-20'),
(4, 'David', 3, 75000, '2020-05-22'),
(5, 'Eva', 2, 90000, '2016-11-30');

INSERT INTO Departments_3 (DepartmentID, DepartmentName) VALUES
(1, 'Engineering'),
(2, 'Sales'),
(3, 'HR');*/

-- Use a CTE to list employees hired before 2019-01-01 and their respective departments.

WITH EarlyHires AS (
    SELECT EmployeeID, Name, DepartmentID, HireDate
    FROM Employees_3
    WHERE HireDate < '2019-01-01'
)
SELECT e.EmployeeID, e.Name, d.DepartmentName, e.HireDate
FROM EarlyHires e
JOIN Departments_3 d ON e.DepartmentID = d.DepartmentID;

-- Use a CTE to calculate the total salary and average salary for each department.

WITH DepartmentSalary AS (
    SELECT DepartmentID, SUM(Salary) AS TotalSalary, AVG(Salary) AS AvgSalary
    FROM Employees_3
    GROUP BY DepartmentID
)
SELECT ds.DepartmentID, d.DepartmentName, ds.TotalSalary, ds.AvgSalary
FROM DepartmentSalary ds
JOIN Departments_3 d ON ds.DepartmentID = d.DepartmentID;	

-- Use a CTE to find the employee with the earliest hire date in each department.

WITH RankedEmployees AS (
    SELECT EmployeeID, Name, DepartmentID, HireDate,
           ROW_NUMBER() OVER (PARTITION BY DepartmentID ORDER BY HireDate) AS Rank
    FROM Employees_3
)
SELECT e.EmployeeID, e.Name, d.DepartmentName, e.HireDate
FROM RankedEmployees e
JOIN Departments_3 d ON e.DepartmentID = d.DepartmentID
WHERE e.Rank = 1;


-- Use a window function to rank employees by salary within their departments.

SELECT e.EmployeeID, e.Name, d.DepartmentName, e.Salary,
       RANK() OVER (PARTITION BY e.DepartmentID ORDER BY e.Salary DESC) AS SalaryRank
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Calculate the cumulative salary of employees based on their hire date.

SELECT EmployeeID, Name, Salary, HireDate,
       SUM(Salary) OVER (ORDER BY HireDate) AS CumulativeSalary
FROM Employees;

-- Calculate each employee’s salary as a percentage of the total salary in their department.

SELECT e.EmployeeID, e.Name, d.DepartmentName, e.Salary,
       100.0 * e.Salary / SUM(e.Salary) OVER (PARTITION BY e.DepartmentID) AS SalaryPercentage
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;