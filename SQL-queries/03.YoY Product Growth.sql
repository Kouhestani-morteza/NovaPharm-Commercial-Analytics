WITH ProductSales AS
(
    SELECT
        p.ProductName,

        SUM(
            CASE
                WHEN s.Year = 2024
                THEN s.NetSalesTRY
                ELSE 0
            END
        ) AS Sales2024,

        SUM(
            CASE
                WHEN s.Year = 2025
                THEN s.NetSalesTRY
                ELSE 0
            END
        ) AS Sales2025

    FROM Sales_Data s

    INNER JOIN Products p
        ON s.ProductID = p.ProductID

    WHERE s.Year IN (2024, 2025)

    GROUP BY p.ProductName
)

SELECT
    ProductName,

    ROUND(Sales2024, 2) AS Sales2024,

    ROUND(Sales2025, 2) AS Sales2025,

    ROUND(
        (Sales2025 - Sales2024) * 100.0
        / NULLIF(Sales2024, 0),
        2
    ) AS YoYGrowthPct

FROM ProductSales

ORDER BY YoYGrowthPct DESC;