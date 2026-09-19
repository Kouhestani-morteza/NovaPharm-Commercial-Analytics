-- | Year-over-Year Product Growth
--
-- Business question:
-- How much did each product grow from 2024 to 2025?
--
-- I used a CTE and conditional aggregation to calculate
-- annual net sales for each product.
--
-- The year-over-year growth rate was then calculated as:
--
-- (2025 Sales - 2024 Sales) / 2024 Sales * 100
--
-- Key finding:
-- All four products recorded positive sales growth in 2025.
-- GlucoRelief had the highest YoY growth, while RespiraX
-- had the lowest growth rate among the four products.
--
-- This analysis compares sales growth, not market share
-- growth or overall product profitability.

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
