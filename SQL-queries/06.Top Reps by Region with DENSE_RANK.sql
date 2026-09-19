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