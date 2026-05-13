SELECT 
	products_number,
    SUM(churn) AS churned_customers,
    CONCAT(
		ROUND(AVG(churn) * 100, 2), 
        '%') AS churn_rate
FROM bank_customers
GROUP BY products_number
ORDER BY AVG(churn) DESC;