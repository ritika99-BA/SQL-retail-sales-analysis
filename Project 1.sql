-- SQL RETAIL SALES ANALYSIS
CREATE DATABASE sql_project_p1;
-- CREATE TABLE 

USE sql_project_p1;

CREATE table retail_sales_tb 
			 ( 
				transactions_id	INT PRIMARY KEY, 
				sale_date DATE,
				sale_time TIME,
				customer_id	INT,
				gender	VARCHAR (15),
 				age	INT,
				category VARCHAR (11),
				quantity INT,
				price_per_unit	FLOAT,
				cogs FLOAT,
				total_sale FLOAT
             ) 
             
             
 SELECT * 
 FROM retail_sales_tb
 WHERE transactions_id IS NULL;

 SELECT * 
 FROM retail_sales_tb
 WHERE sale_time IS NULL;
    
-- DATA CLEANING 
 SELECT * 
 FROM retail_sales_tb
 WHERE 
		transactions_id IS NULL
		OR
		sale_date IS NULL
        OR
		sale_time IS NULL
        OR
		customer_id IS NULL
        OR
		gender IS NULL
        OR
		age IS NULL
        OR
		category IS NULL
		OR
		quantity IS NULL
        OR
		price_per_unit IS NULL
        OR
		cogs IS NULL
        OR
		total_sale IS NULL;
        
            
		SET SQL_SAFE_UPDATES = 0;

        -- DELETE FROM retail_sales_tb
        WHERE 
             transactions_id IS NULL
			OR
			sale_date IS NULL
			OR
			sale_time IS NULL
			OR
			customer_id IS NULL
			OR
			gender IS NULL
			OR
			age IS NULL
			OR
			category IS NULL
			OR
			quantity IS NULL
			OR
			price_per_unit IS NULL
			OR
			cogs IS NULL
			OR
			total_sale IS NULL; 
            
	-- DATA EXPLORATION 
    -- How many sales we have? 
    
    SELECT COUNT(*) AS Total_Sales 
    FROM retail_sales_tb;
            
-- How many unique customers we have? (remove Distinct function for total customers)
   SELECT COUNT(DISTINCT customer_id) AS how_many_customers
   FROM retail_sales_tb;

-- How many categories we have? 
   SELECT DISTINCT(category) 
   FROM retail_sales_tb;
   
-- Data analysis
-- Q1. Retrieve all columns for sales made on '2022-11-05'
   SELECT * 
   FROM retail_sales_tb
   WHERE sale_date = '2022-11-05';
   
-- Q2. Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT *
FROM retail_sales_tb
WHERE 
      category = 'Clothing' 
      AND
      quantity >= 4
      AND 
      sale_date >= '2022-11-01' AND sale_date< '2022-11-30';
      
-- Q3. Calculate total sales (total_sale) for each category
SELECT 
     Category,
     SUM(total_sale) AS totalsales
FROM 
     retail_sales_tb
group by 
      category;
-- Q4. Find the average age of customers who purchased items from the 'Beauty' category
SELECT 
     avg(age) as "AVERAGE AGE BEAUTY CATEGORY"
FROM 
     retail_sales_tb
WHERE 
      category = 'Beauty';
     
-- Q5. Find all the transactions where total_sales is greater than 1000
SELECT *
FROM retail_sales_tb
WHERE total_sale > 1000;

-- Q6. Find total no. of the transactions (transaction_id) made by each gender in each category
SELECT
    gender,
    category,
     count(*) AS 'No. of transactions'
    FROM retail_sales_tb
GROUP BY 
	gender,
    category;
-- Q7. Calculate the average sale for each month. Find the best selling month in each year
SELECT 
     YEAR,
     MONTH,
     avg_sale
FROM
(
SELECT
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_sale,
    RANK() OVER (PARTITION BY YEAR(sale_date) ORDER BY avg(total_sale) DESC) AS rnk
FROM retail_sales_tb
GROUP BY YEAR(sale_date), MONTH(sale_date) 
) AS T1
WHERE rnk = 1;

-- Q8. Find the top 5 customers based on the highest total sales
SELECT 
      customer_id,
      SUM(total_sale) AS total_sales 
FROM  retail_sales_tb
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
-- Q9. Find the number of unique customers who purchased items from each category

SELECT 
      category,
      count(DISTINCT(customer_id))
FROM 
    retail_sales_tb
GROUP BY category

-- Q10. Write a query to create each shift and no. of orders (E.g. Morning<=12, Afternoon between 12 & 17, Evening > 17)
   