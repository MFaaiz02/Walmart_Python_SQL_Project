-- USING DATABASE
USE WALMART_DB;

-- --------------------- DATA EXPLORATION ---------------------
SELECT * FROM  WALMART;

-- CHECKING COMPLETE DATA ROWS IMPORTED
SELECT COUNT(*) FROM WALMART;
-- COUNTING PAYMENTS IN EACH PAYMENT_METHOD
SELECT 
    PAYMENT_METHOD, COUNT(*)
FROM
    walmart
GROUP BY PAYMENT_METHOD;
-- CHECKING ALL BRANCHES
SELECT 
    COUNT(DISTINCT (BRANCH))
FROM
    WALMART;
-- CHECKING MAXIMUM AND MINUMUM QUANTITY 
SELECT MAX(QUANTITY) FROM WALMART;
SELECT MIN(QUANTITY) FROM WALMART;

-- -------------- BUISNESS PROBLEMS AND SOLUTIONS --------------
-- Q1: Find different payment methods, number of transactions, and quantity sold by payment method
SELECT
PAYMENT_METHOD,
COUNT(*) AS TOTAL_TRANSACTIONS,
SUM(QUANTITY) AS TOTAL_QUANTITY_SOLD
FROM walmart
GROUP BY 1
ORDER BY 2,3 DESC;


-- Q2: Identify the highest-rated category in each branch
-- Display the branch, category, and avg rating.
SELECT
BRANCH,
CATEGORY,
AVERAGE_RATING
FROM
(SELECT
BRANCH,
CATEGORY,
ROUND(AVG(RATING),2) AS AVERAGE_RATING,
RANK() OVER(partition by BRANCH ORDER BY AVG(RATING) DESC) AS RANKK
FROM WALMART
GROUP BY 1,2) AS RANKED
WHERE RANKK = 1;

-- Q3: Identify the busiest day for each branch based on the number of transactions
SELECT
BRANCH,
DAY_NAME,
NO_TRANSACTIONS
FROM
(SELECT 
BRANCH,
DAYNAME(STR_TO_DATE(date, '%d/%m/%Y')) AS day_name,
COUNT(*) AS NO_TRANSACTIONS,
RANK() OVER(partition by BRANCH ORDER BY COUNT(*) DESC) AS RANKK
FROM WALMART
GROUP BY 1,2
) AS RANKED
WHERE RANKK = 1;


-- Q4: Calculate the total quantity of items sold per payment method
SELECT 
    PAYMENT_METHOD, SUM(QUANTITY) AS TOTAL_SALE
FROM
    walmart
GROUP BY PAYMENT_METHOD;


-- Q5: Determine the average, minimum, and maximum rating of categories for each city
SELECT 
    CITY,
    CATEGORY,
    MIN(RATING) AS MINUMUM,
    MAX(RATING) AS MAXIMUM,
    ROUND(AVG(RATING), 1) AS AVERAGE
FROM
    WALMART
GROUP BY CITY , CATEGORY;


-- Q6: Calculate the total profit for each category
SELECT 
    CATEGORY,
    ROUND(SUM((UNIT_PRICE) * (QUANTITY) * (PROFIT_MARGIN)),
            2) AS TOTAL_PROFIT
FROM
    WALMART
GROUP BY CATEGORY
ORDER BY TOTAL_PROFIT DESC;


-- Q7: Determine the most common payment method for each branch
WITH CTE AS
(SELECT
BRANCH,
PAYMENT_METHOD,
COUNT(*) AS TOTAL_TRANSACTION,
RANK() OVER(PARTITION BY BRANCH ORDER BY COUNT(*) DESC) AS RANKK
FROM WALMART
GROUP BY 1,2
)
SELECT BRANCH, PAYMENT_METHOD, TOTAL_TRANSACTION AS Preferred_Payment_Method
FROM CTE
 WHERE RANKK = 1;
 
 
 -- Q8: Categorize sales into Morning, Afternoon, and Evening shifts
SELECT 
    BRANCH,
    CASE
        WHEN HOUR(TIME(TIME)) < 12 THEN 'MORNING'
        WHEN HOUR(TIME(TIME)) BETWEEN 12 AND 17 THEN 'AFTERNOON'
        ELSE 'NIGHT'
    END AS SHIFT,
    COUNT(*) AS NUM_INVOICES
FROM
    WALMART
GROUP BY 1 , 2
ORDER BY 3 DESC;    

-- Q9: Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)
WITH revenue_2022 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2022
    GROUP BY branch
),
revenue_2023 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2023
    GROUP BY branch
)
SELECT 
    r2022.branch,
    r2022.revenue AS last_year_revenue,
    r2023.revenue AS current_year_revenue,
    ROUND(((r2022.revenue - r2023.revenue) / r2022.revenue) * 100, 2) AS revenue_decrease_ratio
FROM revenue_2022 AS r2022
JOIN revenue_2023 AS r2023 ON r2022.branch = r2023.branch
WHERE r2022.revenue > r2023.revenue
ORDER BY revenue_decrease_ratio DESC
LIMIT 5;