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