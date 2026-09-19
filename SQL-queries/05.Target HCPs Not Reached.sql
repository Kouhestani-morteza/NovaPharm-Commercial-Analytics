WITH ReachedHCPs AS
(
    SELECT DISTINCT
        RepID,
        HCPID
    FROM CRM_Calls
    WHERE
        CallStatus = 'Completed'
        AND YEAR(CallDate) = 2025
)

SELECT
    r.Region,
    r.RepID,
    r.RepName,

    h.HCPID,
    h.HCPName,
    h.Specialty,
    h.Segment,
    h.PotentialScore,
    h.EngagementScore

FROM HCP_Master h

INNER JOIN Sales_Reps r
    ON h.TerritoryID = r.TerritoryID

LEFT JOIN ReachedHCPs rh
    ON r.RepID = rh.RepID
    AND h.HCPID = rh.HCPID

WHERE
    h.TargetFlag = 1
    AND rh.HCPID IS NULL

ORDER BY
    h.PotentialScore DESC;