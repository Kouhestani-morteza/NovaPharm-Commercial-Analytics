-- | Sales & Achievement by Product
--
-- Business question:
-- How did each product perform against its 2025 sales target?
--
-- I grouped the sales data by product and calculated
-- total net sales, total target, and achievement percentage.
--
-- I also used CASE WHEN to classify each product as
-- either "Target Met" or "Below Target".
--
-- Key finding:
-- All four products finished below their annual targets.
-- Cardiovan had the lowest target achievement at 92.30%,
-- while GlucoRelief was closest to its target at 99.65%.

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
