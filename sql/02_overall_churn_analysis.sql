SELECT  COUNT(*) AS total_customers,
		SUM(churn) AS churned_customers,
		CONCAT(ROUND(SUM(churn) * 100/COUNT(*), 2), '%') AS churn_rate_pct
FROM bank_customers;