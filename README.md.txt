# Pharma Commercial Analytics | NovaPharm

### Sales Performance & Sales Force Effectiveness Analysis

An end-to-end data analytics project using Excel, SQL Server, and Power BI to explore commercial performance and sales force effectiveness in the pharmaceutical industry.

## 1. Project Overview

I developed this project to apply my pharmacy background and data analytics skills to a practical pharmaceutical business scenario.

The project is based on NovaPharm, a fictional pharmaceutical company operating across four regions with four products and a field sales team of 12 representatives.

Using a synthetic dataset covering January 2024 to December 2025, I analyzed sales performance, target achievement, market share, product and regional growth, and sales force activities.

My main goal was to build a complete analytics workflow, starting with data validation in Excel, moving to SQL-based analysis, and finally developing interactive dashboards in Power BI.

Rather than focusing only on sales figures, I also wanted to explore how commercial performance can be evaluated alongside field activities, HCP reach, and target coverage.

**All data used in this project is synthetic and does not represent an actual pharmaceutical company, its employees, or healthcare professionals.**

---

## 2. Business Questions

The analysis focuses on several questions that are relevant to pharmaceutical commercial operations:

* How did overall sales perform against targets in 2025?
* How much did sales grow compared with the previous year?
* Was sales growth mainly driven by higher unit sales or changes in average selling price?
* How did NovaPharm's growth compare with overall market growth?
* Which products and regions had the largest gaps against their sales targets?
* How many healthcare professionals (HCPs) were reached by the field sales team?
* Were all targeted HCPs reached during the year?
* How did sales activity, HCP reach, and commercial performance vary across regions and sales representatives?

The goal was to bring these different aspects of commercial performance together in a way that could support further business investigation and decision-making.

---

## 3. Dataset

The project uses seven interconnected tables containing two years of synthetic commercial data.

| Table       | Records | Description                                                           |
| ----------- | ------: | --------------------------------------------------------------------- |
| Products    |       4 | Product information and therapeutic areas                             |
| Regions     |       4 | Geographic sales regions                                              |
| Sales_Reps  |      12 | Sales representatives and territory assignments                       |
| HCP_Master  |     150 | HCP information, segmentation, potential scores, and targeting status |
| Sales_Data  |   1,152 | Monthly sales, units, and targets by representative and product       |
| Market_Data |     384 | Monthly market sales by region and product                            |
| CRM_Calls   |   3,065 | Field activities, including HCP visits and call status                |

The dataset covers January 2024 through December 2025.

Sales data is recorded at the month, sales representative, and product level, while market data is recorded at the month, region, and product level.

CRM data contains individual call activities.

These differences in data granularity were considered when building the analytical model to avoid duplicate counting and incorrect aggregations.

---

## 4. Tools and Workflow

### Excel — Data Quality and Initial Analysis

I started by reviewing the dataset structure and checking data quality before performing any analysis.

The audit covered record counts, duplicate and missing keys, referential integrity, date coverage, sales calculations, and selected business rules.

I then used Excel formulas and PivotTables to calculate and validate the main commercial KPIs, including net sales, target achievement, year-over-year growth, average selling price, and market share.

This provided a baseline for checking the results obtained later in SQL and Power BI.

### SQL Server — Commercial Analysis

After importing the seven tables into SQL Server, I used SQL to answer specific commercial and sales force questions.

The analysis covered regional and product performance, year-over-year product growth, HCP reach by sales representative, unreached target HCPs, and regional sales representative rankings.

The queries use joins, aggregations, conditional calculations, common table expressions (CTEs), and a window function.

I kept the SQL analysis focused on the business questions rather than adding unnecessary complexity.

### Power BI — Data Modeling and Dashboards

I connected Power BI to the SQL Server database and built an analytical model using shared dimension tables for products, regions, representatives, HCPs, and dates.

I created DAX measures for sales, target achievement, growth, market share, field activity, HCP reach, and target coverage.

The final report contains two interactive dashboard pages:

**Commercial Performance Overview**

Focuses on sales growth, target achievement, market performance, product performance, and regional differences.

**Sales Force Effectiveness**

Focuses on completed calls, unique HCP reach, contact frequency, target HCP coverage, and sales representative activity.

It also includes an action list identifying target HCPs without completed calls during the selected period.

---

## 5. Key Findings

The following findings are based on the synthetic dataset for 2025.

### Sales Growth and Target Achievement

NovaPharm generated TRY 63.02 million in net sales, representing 7.25% growth compared with 2024.

However, overall target achievement was 96.66%, leaving a gap of approximately TRY 2.18 million.

### Sales Growth Drivers

Unit sales increased by 7.05%, while average selling price increased by only 0.18%.

This indicates that sales growth was mainly volume-driven, with relatively little change in average selling price.

### Market Performance

Although NovaPharm's sales grew in 2025, the overall market expanded faster.

| Metric                 |     2025 |
| ---------------------- | -------: |
| NovaPharm Sales Growth |    7.25% |
| Market Growth          |    9.14% |
| Growth Gap             | -1.89 pp |
| Market Share           |   10.10% |
| Market Share Change    | -0.18 pp |

Despite positive sales growth, the company experienced a slight decline in market share.

This illustrates why evaluating sales growth alone may not provide a complete picture of commercial performance.

### Product and Regional Performance

Cardiovan had the lowest target achievement among the four products, at approximately 92.30%.

At the regional level, Aegean had the lowest target achievement, at approximately 91.54%.

These results highlight areas that could benefit from more detailed commercial analysis.

### HCP Coverage

The sales force analysis identified four target HCPs who had no completed calls during 2025.

All four were located in Aegean, the region with the lowest sales target achievement.

This overlap suggests an area worth investigating further. However, the available data does not establish that the coverage gaps caused the region's lower sales performance.

---

## 6. Dashboard Preview

### Commercial Performance Overview

The first dashboard provides an overview of sales, targets, growth, market share, and product and regional performance.

![Commercial Performance Dashboard](screenshots/commercial_performance_dashboard.png)


### Sales Force Effectiveness

The second dashboard focuses on field sales activities, HCP reach, target coverage, and identifying unreached target HCPs.

![Sales Force Effectiveness Dashboard](screenshots/sales_force_effectiveness_dashboard.png)

---

## 7. Limitations

A few limitations are important when interpreting the results.

First, the dataset is entirely synthetic. The findings demonstrate an analytical approach rather than describe the performance of a real pharmaceutical company.

Second, HCP targeting status is treated as a fixed attribute throughout the analysis. In practice, target lists and territory assignments may change over time.

Third, sales data is not available at the individual HCP level. As a result, the project does not attempt to directly attribute sales performance to specific HCP visits or individual CRM activities.

Finally, relationships between field activity, coverage, and sales outcomes should be treated as observations that may warrant further investigation, rather than evidence of causation.

---

## 8. Project Files

| Folder / File    | Contents                                             |
| ---------------- | ---------------------------------------------------- |
| `data/`          | Synthetic dataset and Excel analysis                 |
| `sql/`           | SQL queries for commercial and SFE analysis          |
| `powerbi/`       | Power BI report                                      |
| `screenshots/`   | Dashboard previews                                   |
| `documentation/` | Supporting project documentation and KPI definitions |

---

## 9. What I Learned

This project gave me the opportunity to work through a complete analytics process using a dataset designed around pharmaceutical commercial operations.

One of the main challenges was working with tables that had different levels of granularity, particularly when combining sales, market, and CRM information in Power BI.

It also helped me develop a better understanding of how commercial KPIs relate to one another. For example, positive sales growth does not necessarily mean that a product is gaining market share, and a high number of field calls does not automatically indicate broad HCP coverage.

By completing the project across Excel, SQL Server, and Power BI, I gained practical experience in validating data, translating business questions into analytical queries, building DAX measures, and presenting findings through interactive dashboards.
