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