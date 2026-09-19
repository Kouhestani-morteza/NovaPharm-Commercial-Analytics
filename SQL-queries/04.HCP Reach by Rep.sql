
-- | HCP Reach by Sales Representative
--
-- Business question:
-- How many completed calls did each sales representative
-- make in 2025, and how many unique HCPs were reached?
--
-- I used the CRM call data to calculate two important
-- sales force effectiveness metrics: completed calls
-- and unique HCP reach.
--
-- COUNT measures the total number of completed calls,
-- while COUNT(DISTINCT HCPID) counts each HCP only once,
-- regardless of how many times they were contacted.
--
-- I used a LEFT JOIN to include all sales representatives,
-- even those with no completed calls during the year.
--
-- This analysis helps distinguish between call activity
-- and HCP reach. A higher number of calls does not
-- necessarily mean that more unique HCPs were reached.

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
