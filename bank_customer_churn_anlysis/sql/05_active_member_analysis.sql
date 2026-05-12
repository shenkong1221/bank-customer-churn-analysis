SELECT 
	active_member, 
    CONCAT(ROUND(AVG(churn) * 100, 2), '%') AS churn_rate
FROM bank_customers
GROUP BY active_member
ORDER BY AVG(churn) DESC;