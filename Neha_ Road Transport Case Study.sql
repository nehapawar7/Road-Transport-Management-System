-- Case Study: Road Transport Management System
CREATE DATABASE RTMS;
USE RTMS;
-- Create Owners Table
CREATE TABLE Owners (
    OwnerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(255),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100)
);

-- Create Vehicles Table
CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY AUTO_INCREMENT,
    RegistrationNumber VARCHAR(20) UNIQUE NOT NULL,
    OwnerID INT,
    VehicleType VARCHAR(20) NOT NULL, -- e.g., Car, Truck, Motorcycle
    Make VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    RegistrationDate DATE,
    FOREIGN KEY (OwnerID) REFERENCES Owners(OwnerID) ON DELETE CASCADE
);

-- Create Drivers Table
CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    LicenseNumber VARCHAR(20) UNIQUE NOT NULL,
    LicenseType VARCHAR(20) NOT NULL, -- e.g., Regular, Commercial
    IssueDate DATE,
    ExpiryDate DATE
);

-- Create TrafficViolations Table
CREATE TABLE TrafficViolations (
    ViolationID INT PRIMARY KEY AUTO_INCREMENT,
    DriverID INT,
    VehicleID INT,
    ViolationType VARCHAR(50) NOT NULL, -- e.g., Speeding, Running a Red Light
    FineAmount DECIMAL(10, 2) NOT NULL,
    ViolationDate DATE NOT NULL,
    Location VARCHAR(255),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID) ON DELETE CASCADE,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID) ON DELETE CASCADE
);

-- Create Routes Table
CREATE TABLE Routes (
    RouteID INT PRIMARY KEY AUTO_INCREMENT,
    StartLocation VARCHAR(255) NOT NULL,
    EndLocation VARCHAR(255) NOT NULL,
    Distance DECIMAL(10, 2) NOT NULL, -- in kilometers or miles
    EstimatedTime INT NOT NULL, -- in minutes
    RoadConditions VARCHAR(50) NOT NULL -- e.g., Good, Under Construction
);

-- Create RouteAssignments Table
CREATE TABLE RouteAssignments (
    AssignmentID INT PRIMARY KEY AUTO_INCREMENT,
    RouteID INT,
    DriverID INT,
    VehicleID INT,
    AssignmentDate DATE NOT NULL,
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID) ON DELETE CASCADE,
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID) ON DELETE CASCADE,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID) ON DELETE CASCADE
);

-- Insert records into Owners table
INSERT INTO Owners (FirstName, LastName, Address, ContactNumber, Email) VALUES
('John', 'Doe', '123 Main St', '1234567890', 'john.doe@example.com'),
('Jane', 'Smith', '456 Elm St', '0987654321', 'jane.smith@example.com'),
('Michael', 'Johnson', '789 Oak St', '2345678901', 'michael.johnson@example.com'),
('Emily', 'Davis', '101 Maple St', '3456789012', 'emily.davis@example.com'),
('Chris', 'Brown', '202 Pine St', '4567890123', 'chris.brown@example.com'),
('Jessica', 'Miller', '303 Birch St', '5678901234', 'jessica.miller@example.com'),
('Daniel', 'Wilson', '404 Cedar St', '6789012345', 'daniel.wilson@example.com'),
('Sarah', 'Moore', '505 Walnut St', '7890123456', 'sarah.moore@example.com'),
('David', 'Taylor', '606 Cherry St', '8901234567', 'david.taylor@example.com'),
('Laura', 'Anderson', '707 Willow St', '9012345678', 'laura.anderson@example.com');

-- Insert records into Vehicles table
INSERT INTO Vehicles (RegistrationNumber, OwnerID, VehicleType, Make, Model, Year, RegistrationDate) VALUES
('ABC123', 1, 'Car', 'Toyota', 'Camry', 2015, '2023-01-15'),
('XYZ456', 2, 'Truck', 'Ford', 'F-150', 2018, '2023-02-20'),
('DEF789', 3, 'Motorcycle', 'Honda', 'CBR500R', 2020, '2023-03-10'),
('GHI012', 4, 'Car', 'Tesla', 'Model 3', 2021, '2023-04-12'),
('JKL345', 5, 'SUV', 'Chevrolet', 'Tahoe', 2017, '2023-05-18'),
('MNO678', 6, 'Car', 'BMW', '3 Series', 2016, '2023-06-25'),
('PQR901', 7, 'Truck', 'Ram', '1500', 2019, '2023-07-30'),
('STU234', 8, 'Motorcycle', 'Yamaha', 'MT-07', 2021, '2023-08-15'),
('VWX567', 9, 'SUV', 'Toyota', 'Highlander', 2020, '2023-09-10'),
('YZA890', 10, 'Car', 'Audi', 'A4', 2019, '2023-10-05');

-- Insert records into Drivers table
INSERT INTO Drivers (FirstName, LastName, LicenseNumber, LicenseType, IssueDate, ExpiryDate) VALUES
('Oliver', 'Jackson', 'LN12345', 'Regular', '2021-01-01', '2026-01-01'),
('Emma', 'White', 'LN67890', 'Commercial', '2020-05-15', '2025-05-15'),
('Liam', 'Martinez', 'LN23456', 'Regular', '2019-03-20', '2024-03-20'),
('Ava', 'Garcia', 'LN78901', 'Regular', '2022-08-10', '2027-08-10'),
('William', 'Rodriguez', 'LN34567', 'Commercial', '2021-11-30', '2026-11-30'),
('Sophia', 'Hernandez', 'LN89012', 'Regular', '2023-02-25', '2028-02-25'),
('James', 'Lopez', 'LN45678', 'Regular', '2018-07-15', '2023-07-15'),
('Isabella', 'Gonzalez', 'LN90123', 'Regular', '2020-09-05', '2025-09-05'),
('Benjamin', 'Wilson', 'LN56789', 'Commercial', '2019-12-20', '2024-12-20'),
('Mia', 'Perez', 'LN01234', 'Regular', '2021-04-12', '2026-04-12');

-- Insert records into TrafficViolations table
INSERT INTO TrafficViolations (DriverID, VehicleID, ViolationType, FineAmount, ViolationDate, Location) VALUES
(1, 1, 'Speeding', 100.00, '2023-01-20', 'Main St and 1st Ave'),
(2, 2, 'Running a Red Light', 200.00, '2023-02-25', 'Elm St and 2nd Ave'),
(3, 3, 'Illegal Parking', 50.00, '2023-03-15', 'Oak St and 3rd Ave'),
(4, 4, 'Speeding', 150.00, '2023-04-22', 'Maple St and 4th Ave'),
(5, 5, 'No Seatbelt', 75.00, '2023-05-10', 'Pine St and 5th Ave'),
(6, 6, 'Distracted Driving', 250.00, '2023-06-18', 'Birch St and 6th Ave'),
(7, 7, 'Running a Red Light', 200.00, '2023-07-26', 'Cedar St and 7th Ave'),
(8, 8, 'Speeding', 100.00, '2023-08-05', 'Walnut St and 8th Ave'),
(9, 9, 'Illegal U-turn', 100.00, '2023-09-12', 'Cherry St and 9th Ave'),
(10, 10, 'Speeding', 150.00, '2023-10-02', 'Willow St and 10th Ave');

-- Insert records into Routes table
INSERT INTO Routes (StartLocation, EndLocation, Distance, EstimatedTime, RoadConditions) VALUES
('Downtown', 'Airport', 15.0, 25, 'Good'),
('City Center', 'University', 8.5, 15, 'Under Construction'),
('Station', 'Mall', 10.2, 20, 'Good'),
('Hospital', 'Park', 5.5, 12, 'Good'),
('Residential Area', 'Industrial Zone', 20.0, 35, 'Under Construction'),
('Shopping District', 'Business District', 7.3, 18, 'Good'),
('Suburbs', 'City Center', 25.0, 40, 'Good'),
('Old Town', 'New Town', 12.8, 22, 'Good'),
('North Side', 'South Side', 18.4, 30, 'Under Construction'),
('East End', 'West End', 14.6, 28, 'Good');

-- Insert records into RouteAssignments table
INSERT INTO RouteAssignments (RouteID, DriverID, VehicleID, AssignmentDate) VALUES
(1, 1, 1, '2023-01-20'),
(2, 2, 2, '2023-02-22'),
(3, 3, 3, '2023-03-18'),
(4, 4, 4, '2023-04-14'),
(5, 5, 5, '2023-05-25'),
(6, 6, 6, '2023-06-21'),
(7, 7, 7, '2023-07-16'),
(8, 8, 8, '2023-08-11'),
(9, 9, 9, '2023-09-05'),
(10, 10, 10, '2023-10-01');

-- 1.Retrieve all vehicles registered in the year 2020.
SELECT * FROM vehicles WHERE Year='2020';

-- 2.List all drivers who have a Regular license.
SELECT * FROM Drivers WHERE LicenseType = 'Regular';

-- 3.Find the email addresses of all owners.
SELECT Email FROM Owners;

-- 4.Get all traffic violations that occurred in 2023.
SELECT * FROM TrafficViolations WHERE ViolationDate BETWEEN '2023-01-01' AND '2023-12-31';

-- 5.List all routes that have a distance greater than 15 kilometers.
SELECT * FROM Routes WHERE Distance > 15;

-- 6.Find the make and model of vehicles owned by 'John Doe'.
SELECT Make, Model 
FROM Vehicles 
JOIN Owners ON Vehicles.OwnerID = Owners.OwnerID 
WHERE Owners.FirstName = 'John' AND Owners.LastName = 'Doe';

-- 7.Retrieve all records from the Drivers table sorted by LastName.
SELECT * FROM Drivers ORDER BY LastName;

-- 8.Find the total number of vehicles registered.
SELECT COUNT(*) AS TotalVehicles FROM Vehicles;

-- 9.Get the details of the route assignments that took place in September 2023.
SELECT * FROM RouteAssignments WHERE AssignmentDate BETWEEN '2023-09-01' AND '2023-09-30';

-- 10.Find all vehicles that are either Cars or Trucks.
SELECT * FROM Vehicles WHERE VehicleType IN ('Car', 'Truck');

------------------------------------------------------------------
-- 1.Find the total fine amount collected for speeding violations.
SELECT SUM(FineAmount) AS TotalSpeedingFines 
FROM TrafficViolations 
WHERE ViolationType = 'Speeding';

-- 2.List all drivers who have committed more than two traffic violations.
SELECT DriverID, COUNT(*) AS ViolationCount 
FROM TrafficViolations 
GROUP BY DriverID 
HAVING ViolationCount > 2;

-- 3.Retrieve the names of owners who have more than one vehicle registered.
SELECT Owners.FirstName, Owners.LastName, COUNT(Vehicles.VehicleID) AS VehicleCount
FROM Owners
JOIN Vehicles ON Owners.OwnerID = Vehicles.OwnerID
GROUP BY Owners.OwnerID
HAVING VehicleCount > 1;

-- 4.Find the vehicles that have never been assigned to any route.
SELECT * FROM Vehicles
WHERE VehicleID NOT IN (SELECT VehicleID FROM RouteAssignments);

-- 5.Get the average fine amount for traffic violations per vehicle type.
SELECT Vehicles.VehicleType, AVG(TrafficViolations.FineAmount) AS AverageFine
FROM TrafficViolations
JOIN Vehicles ON TrafficViolations.VehicleID = Vehicles.VehicleID
GROUP BY Vehicles.VehicleType;

-- 6.Retrieve the top 3 routes with the longest estimated time.
SELECT * FROM Routes ORDER BY EstimatedTime DESC LIMIT 3;

-- 7.List the total number of traffic violations by violation type.
SELECT ViolationType, COUNT(*) AS TotalViolations 
FROM TrafficViolations 
GROUP BY ViolationType;

-- 8.Find the most common violation type for each driver.
SELECT DriverID, ViolationType, COUNT(*) AS Frequency
FROM TrafficViolations
GROUP BY DriverID, ViolationType
HAVING COUNT(*) = (
    SELECT MAX(Count)
    FROM (
        SELECT DriverID, COUNT(*) AS Count 
        FROM TrafficViolations 
        GROUP BY DriverID, ViolationType
    ) AS SubQuery
    WHERE SubQuery.DriverID = TrafficViolations.DriverID
);

-- 9.Retrieve the details of the oldest vehicle in the database.
SELECT * FROM Vehicles 
ORDER BY Year ASC 
LIMIT 1;

-- 10.Find the name of the driver with the most route assignments.
SELECT Drivers.FirstName, Drivers.LastName, COUNT(RouteAssignments.AssignmentID) AS AssignmentCount
FROM RouteAssignments
JOIN Drivers ON RouteAssignments.DriverID = Drivers.DriverID
GROUP BY Drivers.DriverID
ORDER BY AssignmentCount DESC
LIMIT 1;

-- 11.List all drivers who have a license expiring within the next year.
SELECT * FROM Drivers
WHERE ExpiryDate BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 1 YEAR);

-- 12.Calculate the total distance covered by all routes in the system.
SELECT SUM(Distance) AS TotalDistance FROM Routes;

-- 13.Get the details of vehicles assigned to more than one route.
SELECT Vehicles.VehicleID, Vehicles.RegistrationNumber, COUNT(RouteAssignments.RouteID) AS RouteCount
FROM Vehicles
JOIN RouteAssignments ON Vehicles.VehicleID = RouteAssignments.VehicleID
GROUP BY Vehicles.VehicleID
HAVING RouteCount > 1;

-- 14.Find the route with the shortest distance that is currently under construction.
SELECT * FROM Routes 
WHERE RoadConditions = 'Under Construction' 
ORDER BY Distance ASC 
LIMIT 1;

-- 15.Retrieve the average registration year of vehicles per owner.
SELECT Owners.FirstName, Owners.LastName, AVG(Vehicles.Year) AS AverageYear
FROM Owners
JOIN Vehicles ON Owners.OwnerID = Vehicles.OwnerID
GROUP BY Owners.OwnerID;

-- 16.List all violations that occurred in a specific location (e.g., 'Main St and 1st Ave').
SELECT * FROM TrafficViolations WHERE Location = 'Main St and 1st Ave';

-- 17.Get the details of the driver with the oldest license issue date.
SELECT * FROM Drivers ORDER BY IssueDate ASC LIMIT 1;

-- 18.Find all vehicles registered before 2018 that have been involved in a traffic violation.
SELECT DISTINCT Vehicles.*
FROM Vehicles
JOIN TrafficViolations ON Vehicles.VehicleID = TrafficViolations.VehicleID
WHERE Vehicles.Year < 2018;

-- 19.Retrieve the number of drivers per license type.
SELECT LicenseType, COUNT(*) AS TotalDrivers
FROM Drivers
GROUP BY LicenseType;

-- 20.Get the route assignments for a driver with a specific last name (e.g., 'Jackson').
SELECT RouteAssignments.*, Routes.StartLocation, Routes.EndLocation
FROM RouteAssignments
JOIN Drivers ON RouteAssignments.DriverID = Drivers.DriverID
JOIN Routes ON RouteAssignments.RouteID = Routes.RouteID
WHERE Drivers.LastName = 'Jackson';

-- 21. Find the details of all vehicles owned by people who live on 'Maple St'.
SELECT Vehicles.*
FROM Vehicles
JOIN Owners ON Vehicles.OwnerID = Owners.OwnerID
WHERE Owners.Address LIKE '%Maple St%';

-- 22.Calculate the total fine amount per driver.
SELECT DriverID, SUM(FineAmount) AS TotalFines
FROM TrafficViolations
GROUP BY DriverID;

-- 23.Get the details of all vehicles that have not been involved in any traffic violation.
SELECT * FROM Vehicles
WHERE VehicleID NOT IN (SELECT VehicleID FROM TrafficViolations);

-- 24. List all routes that have been assigned to drivers with a Commercial license.
SELECT * FROM Routes
JOIN RouteAssignments ON Routes.RouteID = RouteAssignments.RouteID
JOIN Drivers ON RouteAssignments.DriverID = Drivers.DriverID
WHERE Drivers.LicenseType = 'Commercial';

-- 25. Retrieve the names and contact numbers of owners who have registered a vehicle after 2022.
SELECT Owners.FirstName, Owners.LastName, Owners.ContactNumber
FROM Owners
JOIN Vehicles ON Owners.OwnerID = Vehicles.OwnerID
WHERE Vehicles.RegistrationDate > '2022-12-31';

-- 26. Find the route with the maximum number of assignments.
SELECT RouteID, COUNT(*) AS AssignmentCount
FROM RouteAssignments
GROUP BY RouteID
ORDER BY AssignmentCount DESC
LIMIT 1;

-- 27.Get the list of drivers who have driven on a route longer than 20 kilometers.
SELECT DISTINCT Drivers.*
FROM Drivers
JOIN RouteAssignments ON Drivers.DriverID = RouteAssignments.DriverID
JOIN Routes ON RouteAssignments.RouteID = Routes.RouteID
WHERE Routes.Distance > 20;

-- 28. Calculate the average fine per violation type.
SELECT ViolationType, AVG(FineAmount) AS AverageFine
FROM TrafficViolations
GROUP BY ViolationType;

-- 29. Find the vehicles that have been assigned to routes under construction
SELECT DISTINCT *
FROM Vehicles
JOIN RouteAssignments ON Vehicles.VehicleID = RouteAssignments.VehicleID
JOIN Routes ON RouteAssignments.RouteID = Routes.RouteID
WHERE Routes.RoadConditions = 'Under Construction';

-- 30. Retrieve the top 5 most frequent violations.
SELECT ViolationType, COUNT(*) AS ViolationCount
FROM TrafficViolations
GROUP BY ViolationType
ORDER BY ViolationCount DESC
LIMIT 5;

-- 31. List all the routes where no assignments have been made.
SELECT * FROM Routes
WHERE RouteID NOT IN (SELECT RouteID FROM RouteAssignments);

-- 32. Get the list of owners who have been fined for any vehicle they own.
SELECT DISTINCT *
FROM Owners
JOIN Vehicles ON Owners.OwnerID = Vehicles.OwnerID
JOIN TrafficViolations ON Vehicles.VehicleID = TrafficViolations.VehicleID;

-- 33. Find the most recent traffic violation for each driver.
SELECT DriverID, MAX(ViolationDate) AS LatestViolationDate
FROM TrafficViolations
GROUP BY DriverID;

-- 34. Retrieve the list of vehicles that have been registered in the past two years.
SELECT * FROM Vehicles WHERE RegistrationDate > DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- 35. Calculate the total number of assignments per route
SELECT RouteID, COUNT(*) AS TotalAssignments
FROM RouteAssignments
GROUP BY RouteID;

-- 36. Get the list of drivers who have not committed any traffic violation.
SELECT * FROM Drivers
WHERE DriverID NOT IN (SELECT DriverID FROM TrafficViolations);

-- 37.List the owners who have at least one vehicle involved in a traffic violation.
SELECT DISTINCT *
FROM Owners
JOIN Vehicles ON Owners.OwnerID = Vehicles.OwnerID
JOIN TrafficViolations ON Vehicles.VehicleID = TrafficViolations.VehicleID;

-- 38. Retrieve the list of routes that take longer than the average estimated time.
SELECT * FROM Routes
WHERE EstimatedTime > (SELECT AVG(EstimatedTime) FROM Routes);

-- 39. Find the total number of violations and the average fine per driver.
SELECT DriverID, COUNT(*) AS TotalViolations, AVG(FineAmount) AS AverageFine
FROM TrafficViolations
GROUP BY DriverID;

-- 40. List Routes with Current Assignments
SELECT R.RouteID, R.StartLocation, R.EndLocation, D.FirstName, D.LastName, V.RegistrationNumber
FROM RouteAssignments RA
INNER JOIN Routes R ON RA.RouteID = R.RouteID
INNER JOIN Drivers D ON RA.DriverID = D.DriverID
INNER JOIN Vehicles V ON RA.VehicleID = V.VehicleID;
