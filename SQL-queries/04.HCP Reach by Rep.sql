SELECT
    r.RepID,
    r.RepName,
    r.Region,

    COUNT(c.CallID) AS CompletedCalls,

    COUNT(DISTINCT c.HCPID) AS UniqueHCPsReached

FROM Sales_Reps r

LEFT JOIN CRM_Calls c
    ON r.RepID = c.RepID
    AND c.CallStatus = 'Completed'
    AND YEAR(c.CallDate) = 2025

GROUP BY
    r.RepID,
    r.RepName,
    r.Region

ORDER BY
    UniqueHCPsReached DESC;