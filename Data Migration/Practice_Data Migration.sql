-- This practice is to define data structures and manipulate data with SQL statements using DDL and DML.


CREATE TABLE ElectricityConsumption
(
	ID Int NOT NULL PRIMARY KEY,
	Country varchar(50),
	Region varchar(50),
	Year2010 numeric(7,3),
	Year2011 numeric(7,3),
	Year2012 numeric(7,3),
	Year2013 numeric(7,3),
	Year2014 numeric(7,3)
);

SELECT * From ElectricityConsumption;


-- Delete a column
ALTER TABLE ElectricityConsumption
DROP COLUMN Year2010;


-- Add columns
ALTER TABLE ElectricityConsumption
ADD Year2015 numeric(7,3);


-- Enter dataset values
INSERT INTO ElectricityConsumption
VALUES (1001, 'Brazil', 'Central&South America', 455.649, 472.135, 488.375, 504.353, 517.690),
	   (1002, 'China', 'Asia&Oceania', 3713.324, 4178.908, 4434.908, 4845.679, 5066.776),
	   (1003, 'Dominica','Central&South America', 0.088, 0.091, 0.089, 0.089, 0.09),
	   (1004, 'Egypt', 'Africa', 122.384, 133.805, 136.594, 139.613, 142.700),
	   (1005, 'France', 'Europe', 474.009, 443.589, 454.661, 455.146, 430.999),
	   (1006, 'Greace','Europ',56.401, 56.373, 57.786, 52.467, 52.628),
	   (1007, 'Iran', 'Middle East', 182.714, 186.195, 195.322, 201.137, 217.874),
	   (1008, 'Japan', 'Asia&Oceania', 1038.37, 1028.56, 966.09, 959.127, 934.427),
	   (1009, 'Kuwait', 'Middle East',46.714, 46.928, 50.003, 49.925, 53.636),
	   (1010, 'Liberia','Africa', 0.233, 0.279, 0.279, 0.279, 0.298),
	   (1011, 'Mexico', 'North America',216.481, 240.612, 246.508, 233.526, 238.388),
	   (1012, 'Moldova', 'Eurasia',5.791, 4.904, 5.056, 4.56, 3.835),
	   (1013, 'Russia', 'Eurasia', 858.512, 874.823, 889.147, 881.105, 890.935),
	   (1014, 'United States', 'North America', 3886.531, 3882.599, 3832.307, 3868.331, 3912.809),
       (1005, 'Canada', 'North America', 501.76, 519.355, 514.349, 530.924, 528.097);

SELECT * FROM ElectricityConsumption;


-- Modify data types
ALTER TABLE ElectricityConsumption
ALTER COLUMN Year2012 decimal(7,3);

ALTER TABLE ElectricityConsumption
ALTER COLUMN Year2013 decimal(7,3);

ALTER TABLE ElectricityConsumption
ALTER COLUMN Year2014 decimal(7,3);

ALTER TABLE ElectricityConsumption
ALTER COLUMN Year2015 decimal(7,3);

-- Update data values
UPDATE ElectricityConsumption
SET Country='Greece' 
WHERE Country='Greace';

UPDATE ElectricityConsumption
SET Year2015=241.70
WHERE ID=1004 AND Year2015=142.70;


-- Remove rows from a table
DELETE FROM ElectricityConsumption
WHERE ID=1005;

SELECT * FROM ElectricityConsumption;

-- Create a new tale named Consumption2015
SELECT ID, Country, Region, Year2015 INTO Consumption2015
FROM ElectricityConsumption;

SELECT * FROM Consumption2015

-- Create views
CREATE VIEW Consumption2015View AS
SELECT Country, Region, Year2015
FROM Consumption2015
WHERE Region='North America';

SELECT * FROM Consumption2015View;

CREATE VIEW Consumption2011View AS
SELECT Country, Region, Year2011
FROM ElectricityConsumption;

SELECT * FROM Consumption2011View;

CREATE VIEW Consumption2012view AS
SELECT Country, Year2012
FROM ElectricityConsumption;

SELECT * FROM Consumption2012View;


-- Use aggregate functions
SELECT AVG(Year2015) AS AVG2015
From ElectricityConsumption;

SELECT COUNT(Region) AS CountRegion
FROM ElectricityConsumption;

SELECT MAX(Year2011) AS Max2011
FROM Consumption2011View;

SELECT MIN(Year2012) AS Min2012
FROM ElectricityConsumption;

SELECT SUM(Year2013) AS Sum2013
FROM ElectricityConsumption;


-- Use scalar functions
SELECT Upper(Country)
FROM ElectricityConsumption;

SELECT Lower(Region)
FROM ElectricityConsumption;


-- Create stored procedures 
CREATE PROCEDURE SelectYear2011
AS
SELECT * FROM Consumption2011View
Go;

EXEC SelectYear2011;


-- Remove records or remove a table
TRUNCATE TABLE Consumption2015;

DROP VIEW Consumption2012View;


-- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements.
SET NOCOUNT ON;







