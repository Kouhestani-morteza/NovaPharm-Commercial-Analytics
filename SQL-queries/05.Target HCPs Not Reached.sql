
-- | Target HCPs Not Reached
--
-- Business question:
-- Which targeted HCPs had no completed calls from their
-- assigned sales representative during 2025?
--
-- I first used a CTE to create a list of distinct HCPs
-- reached by each representative through completed calls.
--
-- I then matched targeted HCPs to their assigned
-- representatives using TerritoryID.
--
-- A LEFT JOIN was used to identify targeted HCPs
-- without a matching completed call in 2025.
--
-- Key finding:
-- Four targeted HCPs were not reached during 2025.
-- All four were located in the Aegean region.
--
-- These HCPs were sorted by PotentialScore to create
-- a coverage action list for further review.
--
-- Aegean also had the lowest regional sales target
-- achievement. However, this analysis does not establish
-- that the coverage gaps caused the lower sales performance.
--
-- Note:
-- Sales data is not available at the individual HCP level.
-- Therefore, no direct relationship between individual
-- HCP visits and sales outcomes is assumed.

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
