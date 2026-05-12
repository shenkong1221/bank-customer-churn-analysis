# Bank Customer Churn Analysis

## Executive Summary
Built an end-to-end customer churn analysis framework using SQL and Tableau to identify high-risk banking customers and support retention strategy development.

Key outcome:
- Approximately 20% of customers churned from the bank
- German customers exhibited the highest churn risk
- Older and inactive customers showed significantly higher attrition rates
- Moderate product adoption improved retention, while excessive product ownership correlated with increased churn risk

## Business Problem
Customer churn is a major challenge in the banking industry.

When customers close their accounts, banks lose:
- Long-term revenue
- Customer acquisition investments
- Cross-selling opportunities

The goal of this project is to:
- Identify the customer segments most likely to churn
- Analyze the key drivers of customer attrition
- Visualize churn risk patterns using Tableau
- Provide data-driven retention recommendations

## Dataset
- Source: Kaggle – Bank Customer Churn Dataset￼
* Size: 10,000 customer records
* Target variable: Churn Rate (AVG(churn))

## Approach
### Data Validation & Cleaning
Performed initial SQL-based data validation:
- Checked total row counts
- Removed duplicate records
- Verified NULL values across all columns
- Validated customer-level consistency

### Exploratory SQL Analysis
Conducted business-focused churn analysis across multiple customer dimensions:
- Overall churn rate
- Geography vs churn
- Age group vs churn
- Active membership vs churn
- Product ownership vs churn
- Credit score vs churn
- Gender vs churn

Key findings:
- Germany had the highest churn rate among all countries
- Customers aged 50+ showed substantially higher churn risk
- Inactive customers were significantly more likely to churn
- Customers with 2 products demonstrated the strongest retention behavior

### Customer Segmentation
Created custom customer groups for business interpretation:
- Age groups:
    -- Under 30
    -- 30–50
    -- 50+
- Credit score groups:
    -- Less than 500
    -- 500–700
    -- 700+

### Tableau Dashboard Development
Built an interactive Tableau dashboard to visualize:
- Churn distribution by geography
- Customer age segmentation
- Product ownership trends
- Customer activity impact
- Customer structure and risk distribution

## Key Insights
- Approximately 1 in 5 customers churned from the bank
- German customers demonstrated the highest attrition risk
- Senior customers showed significantly higher churn probabilities
- Customer inactivity strongly correlated with churn behavior
- Moderate cross-selling improved retention outcomes
- Extremely high product ownership may indicate customer dissatisfaction or competitive targeting

## Business Recommendations
- Develop targeted retention campaigns for high-risk customers
- Increase engagement initiatives for inactive members
- Provide personalized services for senior customer groups
- Simplify complex product bundles and fee structures
- Implement proactive churn monitoring for high-value customers

## Visualization & Dashboard
Key dashboard components include:
- Churn rate by country
- Churn rate by age group
- Product ownership trend analysis
- Customer distribution analysis
- Customer demographic risk structure

## Tech Stack
- MySQL
- Tableau
- Excel

## Key Takeaway
Customer churn is strongly associated with demographic characteristics, engagement behavior, and product usage patterns.

The analysis demonstrates that customer retention strategies should prioritize:
- Senior customer engagement
- Activity-based retention programs
- Geographic risk segmentation
- Balanced cross-selling strategies

## Future Work
- Build predictive churn classification models using Machine Learning
- Develop churn probability scoring systems
- Perform customer lifetime value (CLV) analysis
- Add cohort retention analysis
- Create real-time churn monitoring dashboards
- Explore classification models such as Logistic Regression and Random Forest