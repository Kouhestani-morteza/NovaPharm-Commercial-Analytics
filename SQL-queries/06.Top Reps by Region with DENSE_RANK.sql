
-- | Sales Representative Ranking by Region
--
-- Business question:
-- How did sales representatives rank by net sales
-- within their respective regions in 2025?
--
-- I first used a CTE to calculate total annual net
-- sales for each representative.
--
-- I then used DENSE_RANK with PARTITION BY Region
-- to rank representatives separately within each region.
--
-- This allows the ranking to start from 1 in each region,
-- rather than ranking all representatives across
-- the entire company.
--
-- DENSE_RANK also assigns the same rank to representatives
-- with identical sales values, without skipping the
-- next ranking number.
--
-- This analysis provides a simple comparison of sales
-- performance among representatives working in the
-- same region.
--
-- Note:
-- The ranking is based on net sales only. It does not
-- account for differences in territory potential,
-- sales targets, HCP coverage, or other factors that
-- may affect representative performance.

WITH RepSales AS
(
    SELECT
        r.Region,
        r.RepID,
        r.RepName,

        SUM(s.NetSalesTRY) AS NetSalesTRY

    FROM Sales_Data s

    INNER JOIN Sales_Reps r
        ON s.RepID = r.RepID

    WHERE s.Year = 2025

    GROUP BY
        r.Region,
        r.RepID,
        r.RepName
)

SELECT
    Region,
    RepID,
    RepName,

    ROUND(NetSalesTRY, 2) AS NetSalesTRY,

    DENSE_RANK() OVER
    (
        PARTITION BY Region
        ORDER BY NetSalesTRY DESC
    ) AS RegionRank

FROM RepSales

ORDER BY
    Region,
    RegionRank;
