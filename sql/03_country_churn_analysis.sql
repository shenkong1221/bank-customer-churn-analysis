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