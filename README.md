# SQL-retail-sales-analysis
INTRODUCTION: 
Analyze retail sales data to uncover customer behavior, sales trends, and business insights that can support data-driven decision-making.

DATASET DESCRIPTION:
The dataset contains transactional retail data with the following fields:

Transaction ID
Sale Date & Time
Customer ID
Gender & Age
Product Category
Quantity Sold
Price per Unit
Cost of Goods Sold (COGS)
Total Sales

Data Cleaning: Performed data quality checks and removed incomplete records to ensure accurate analysis:

1.Identified NULL values across all columns
2.Removed records with missing critical fields
3.Ensured consistency in transaction-level data

Data Exploration:

1.Total number of sales transactions
2.Unique customer count
3.Product category distribution

Business Problems & Analysis
🔹 Sales Insights
Calculated total sales by category
Identified high-value transactions (>1000 sales)

Business Value: Helps identify top-performing categories and premium purchases

🔹 Customer Analysis
Analyzed average age of customers (Beauty category)
Identified top 5 customers based on total spend
Calculated unique customers per category

 Business Value: Supports customer segmentation and targeted marketing

🔹 Transaction Behavior
Analyzed transactions by gender and category
Evaluated high-quantity purchases in Clothing category

Business Value: Helps understand purchasing patterns across demographics

🔹 Time-Based Analysis
Identified best-selling month in each year using window functions
Segmented sales into time shifts (Morning, Afternoon, Evening)

Business Value:

Detects seasonal trends
Helps optimize staffing and marketing timing

Key Insights:
Certain categories contribute significantly more to total revenue
A small group of customers drives a large portion of sales (high-value customers)
Sales patterns vary across time shifts, indicating peak shopping hours
Monthly trends reveal seasonality in sales performance

