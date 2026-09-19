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