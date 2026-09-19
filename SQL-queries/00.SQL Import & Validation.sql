-- | Import Validation
--
-- Before starting the analysis, I checked that the Excel data
-- had been imported correctly into SQL Server.
--
-- This script checks record counts and date coverage across
-- the main tables.
--
-- Expected row counts:
-- Products: 4
-- Regions: 4
-- Sales_Reps: 12
-- HCP_Master: 150
-- Sales_Data: 1,152
-- Market_Data: 384
-- CRM_Calls: 3,065
--
-- Sales and market data cover January 2024 to December 2025.

SELECT 'Products' AS TableName, COUNT(*) AS "RowCount"
FROM Products

UNION ALL

SELECT 'Regions', COUNT(*)
FROM Regions

UNION ALL

SELECT 'Sales_Reps', COUNT(*)
FROM Sales_Reps

UNION ALL

SELECT 'HCP_Master', COUNT(*)
FROM HCP_Master

UNION ALL

SELECT 'Sales_Data', COUNT(*)
FROM Sales_Data

UNION ALL

SELECT 'Market_Data', COUNT(*)
FROM Market_Data

UNION ALL

SELECT 'CRM_Calls', COUNT(*)
FROM CRM_Calls; 
------------------------------------------------------
SELECT
    'Sales_Data' AS TableName,
    MIN(Month) AS MinDate,
    MAX(Month) AS MaxDate
FROM Sales_Data

UNION ALL

SELECT
    'Market_Data',
    MIN(Month),
    MAX(Month)
FROM Market_Data;
-------------------------------------------------------
SELECT
    MIN(CallDate) AS MinCallDate,
    MAX(CallDate) AS MaxCallDate
FROM CRM_Calls;
