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