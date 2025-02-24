-- 1️⃣ Create the sales table
CREATE DATABASE IF NOT EXISTS sales_db;
USE sales_db;
drop table sales;
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    salesperson VARCHAR(50),
    sale_date DATE,
    sales_amount DECIMAL(10, 2)
);

-- 2️⃣ Insert Sample Data
INSERT INTO sales (salesperson, sale_date, sales_amount) VALUES
('Alice', '2024-01-01', 500),
('Alice', '2024-01-05', 700),
('Alice', '2024-01-10', 700),  -- Tie for 700
('Alice', '2024-01-15', 400),
('Bob', '2024-01-02', 600),
('Bob', '2024-01-07', 800),
('Bob', '2024-01-12', 500);

select * from sales;
-- Agg vs Windows
-- Key Concept:
-- Aggregate functions (SUM, AVG, COUNT) collapse rows into one.
-- Window functions perform calculations over a set of rows without collapsing them.

select sum(sales_amount) from sales;
select salesperson, sum(sales_amount) over() from sales;

-- 3️⃣ Using ROW_NUMBER() to assign a unique row number within each salesperson group
SELECT salesperson, sale_date, sales_amount,
       ROW_NUMBER() OVER (PARTITION BY salesperson ORDER BY sale_date) AS row_num
FROM sales;

-- 4️⃣ Using RANK() and DENSE_RANK() to demonstrate ranking with ties
SELECT salesperson, sale_date, sales_amount,
       RANK() OVER (PARTITION BY salesperson ORDER BY sales_amount DESC) AS rank_num,
       DENSE_RANK() OVER (PARTITION BY salesperson ORDER BY sales_amount DESC) AS dense_rank_num
FROM sales;

-- 5️⃣ Using LAG() and LEAD() to compare current sale with previous and next sale
SELECT salesperson, sale_date, sales_amount,
       LAG(sales_amount) OVER (PARTITION BY salesperson ORDER BY sale_date) AS prev_sale,
       LEAD(sales_amount) OVER (PARTITION BY salesperson ORDER BY sale_date) AS next_sale
FROM sales;

-- 6️⃣ Using SUM() OVER() to calculate the running total for each salesperson
SELECT salesperson, sale_date, sales_amount,
       SUM(sales_amount) OVER (PARTITION BY salesperson ORDER BY sale_date) AS running_total
FROM sales;

-- 7️⃣ Using AVG() OVER() with ROWS BETWEEN to calculate the moving average of sales for each salesperson
-- ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
SELECT salesperson, sale_date, sales_amount,
       AVG(sales_amount) OVER (PARTITION BY salesperson ORDER BY sale_date ) AS moving_avg
FROM sales;

-- 8️⃣ Using CASE statement to classify sales as "High", "Medium", or "Low" based on sales amount
SELECT salesperson, sale_date, sales_amount,
       CASE
           WHEN sales_amount >= 700 THEN 'High'
           WHEN sales_amount >= 500 AND sales_amount < 700 THEN 'Medium'
           ELSE 'Low'
       END AS sales_category
FROM sales;

-- 9️⃣ Correlated Subquery to find sales made above the individual average sales for each salesperson
SELECT salesperson, sale_date, sales_amount
FROM sales s1
WHERE sales_amount > (
    SELECT AVG(sales_amount) 
    FROM sales s2 
    WHERE s1.salesperson = s2.salesperson
);

-- 🔟 Non-Correlated Subquery to find sales above the overall average sales amount
SELECT salesperson, sale_date, sales_amount 
FROM sales 
WHERE sales_amount > (SELECT AVG(sales_amount) FROM sales);

