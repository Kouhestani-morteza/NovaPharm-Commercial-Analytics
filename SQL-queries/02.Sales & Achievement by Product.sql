SELECT
    p.ProductName,

    ROUND(SUM(s.NetSalesTRY), 2) AS NetSalesTRY,

    ROUND(SUM(s.TargetTRY), 2) AS TargetTRY,

    ROUND(
        SUM(s.NetSalesTRY) * 100.0
        / NULLIF(SUM(s.TargetTRY), 0),
        2
    ) AS AchievementPct,

    CASE
        WHEN SUM(s.NetSalesTRY) >= SUM(s.TargetTRY)
            THEN 'Target Met'
        ELSE 'Below Target'
    END AS TargetStatus

FROM Sales_Data s

INNER JOIN Products p
    ON s.ProductID = p.ProductID

WHERE s.Year = 2025

GROUP BY p.ProductName

ORDER BY AchievementPct DESC;