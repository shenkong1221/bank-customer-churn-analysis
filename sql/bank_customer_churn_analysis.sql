USE bank_churn_analysis;

-- Data Validation:
SELECT *
FROM bank_customers
LIMIT 10; -- Check the info, in the first 10 rows

SELECT COUNT(*) -- Check the total number of rows
FROM bank_customers;

-- Check and drop the duplicates:
SELECT DISTINCT COUNT(*)
FROM bank_customers;

WITH ranked_customers AS (
	SELECT customer_id,
		   ROW_NUMBER() OVER (
			   PARTITION BY credit_score,
                            country,
                            gender,
                            age,
                            tenure,
                            balance,
                            products_number,
                            credit_card,
                            active_member,
                            estimated_salary,
                            churn
			   ORDER BY customer_id
		   ) AS rn
	FROM bank_customers
)

DELETE FROM bank_customers
WHERE customer_id IN (
	SELECT customer_id
    FROM ranked_customers
	WHERE rn > 1
);

-- NULL Check all the columns and create a table:
SELECT 'customer_id' AS column_name, COUNT(*)
FROM bank_customers
WHERE customer_id IS NULL

UNION ALL -- Using "UNION" would automatically distinct the items

SELECT 'credit_score', COUNT(*)
FROM bank_customers
WHERE credit_score IS NULL

UNION ALL

SELECT 'country', COUNT(*)
FROM bank_customers
WHERE country IS NULL

UNION ALL

SELECT 'gender', COUNT(*)
FROM bank_customers
WHERE gender IS NULL

UNION ALL

SELECT 'age', COUNT(*)
FROM bank_customers
WHERE age IS NULL

UNION ALL

SELECT 'tenure', COUNT(*)
FROM bank_customers
WHERE tenure IS NULL

UNION ALL

SELECT 'balance', COUNT(*)
FROM bank_customers
WHERE balance IS NULL

UNION ALL

SELECT 'products_number', COUNT(*)
FROM bank_customers
WHERE products_number IS NULL

UNION ALL

SELECT 'credit_card', COUNT(*)
FROM bank_customers
WHERE credit_card IS NULL

UNION ALL

SELECT 'active_member', COUNT(*)
FROM bank_customers
WHERE active_member IS NULL

UNION ALL

SELECT 'estimated_salary', COUNT(*)
FROM bank_customers
WHERE estimated_salary IS NULL

UNION ALL

SELECT 'churn', COUNT(*)
FROM bank_customers
WHERE churn IS NULL;

-------------------------------------------------------------------------------------
-- Business Analysis:
-- 1. Overall customer churn rate (The most important KPI)
SELECT  COUNT(*) AS total_customers,
		SUM(churn) AS churned_customers,
		CONCAT(ROUND(SUM(churn) * 100/COUNT(*), 2), '%') AS churn_rate_pct
FROM bank_customers;
-- Conclusion: Approximately 20% of customers have exited the bank, indicating a substantial customer retention challenge.

-- 2. Which country's customers are most likely to churn?
SELECT
	country,
    COUNT(*),
    CONCAT(
		ROUND(AVG(churn) * 100, 2), '%') AS churn_rate
        -- For each country (If GROUP BY country), AVG(churn) = SUM(churn) / COUNT(*)
FROM bank_customers
GROUP BY country
ORDER BY AVG(churn) DESC;

SELECT 
	country, 
	COUNT(*) AS churned_customers,
    SUM(churn)/COUNT(*) AS churn_rate
FROM bank_customers
GROUP BY country
ORDER BY churn_rate DESC;

-- Analyze churn rate by age:
SELECT 
	age, 
    COUNT(*) AS churned_customers,
	ROUND(AVG(churn) * 100, 2) AS churn_rate
FROM bank_customers
GROUP BY age
ORDER BY churn_rate DESC;

-- Create Age Groups:
SELECT 
	CASE 
		WHEN age < 30 THEN 'Under 30'
		WHEN age BETWEEN 30 AND 50 THEN '30-50'
		ELSE '50+'
	END AS age_group,
	COUNT(*) AS churned_customers,
	CONCAT(
		ROUND(AVG(churn) * 100, 2),
        '%') AS churn_rate
FROM bank_customers
GROUP BY age_group
ORDER BY AVG(churn) DESC;
-- Older customers showed substantially higher churn rates, indicating a potential retention issue among senior customer segments.

-- Analyze active_member vs churn_rate:
SELECT 
	active_member, 
    CONCAT(ROUND(AVG(churn) * 100, 2), '%') AS churn_rate
FROM bank_customers
GROUP BY active_member
ORDER BY AVG(churn) DESC;
-- Conclusion: Inactive customers exhibited substantially higher churn rates, suggesting that customer engagement is strongly associated with retention and long-term account stability.

-- Analyze products_number vs churn_rate:
SELECT 
	products_number,
    SUM(churn) AS churned_customers,
    CONCAT(
		ROUND(AVG(churn) * 100, 2), 
        '%') AS churn_rate
FROM bank_customers
GROUP BY products_number
ORDER BY AVG(churn) DESC;

-- Analyze credit_score vs churn_rate:
SELECT 
	CASE
		WHEN credit_score < 500 THEN 'Less than 500'
        WHEN credit_score BETWEEN 500 AND 700 THEN '500-700'
        WHEN credit_score > 700 THEN '700+'
	END AS credit_group,
    CONCAT(
		ROUND(AVG(churn) * 100, 2), 
        '%') AS churn_rate
FROM bank_customers
GROUP BY credit_group
ORDER BY AVG(churn) DESC;

















