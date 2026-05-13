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