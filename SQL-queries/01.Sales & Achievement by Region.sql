--| Sales & Achievement by Region
--
-- Business question:
-- How did each region perform against its sales target in 2025?
--
-- I joined the sales data with the region master table
-- to calculate total net sales, total target, and target
-- achievement for each region.
--
-- Achievement is calculated as total sales divided by
-- total target, rather than averaging individual
-- achievement percentages.
--
-- Key finding:
-- Aegean had the lowest regional target achievement
-- at approximately 91.54%.
--
-- This identifies an area for further investigation,
-- but does not explain the cause of the performance gap.

SELECT
    r.Region,
    ROUND(SUM(s.NetSalesTRY), 2) AS NetSalesTRY,
    ROUND(SUM(s.TargetTRY), 2) AS TargetTRY,

    ROUND(
        SUM(s.NetSalesTRY) * 100.0
        / NULLIF(SUM(s.TargetTRY), 0),
        2
    ) AS AchievementPct

FROM Sales_Data s

INNER JOIN Regions r
    ON s.RegionID = r.RegionID

WHERE s.Year = 2025

GROUP BY r.Region

ORDER BY AchievementPct DESC;
