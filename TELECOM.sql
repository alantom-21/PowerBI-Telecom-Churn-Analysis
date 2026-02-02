use smec;
show tables;

create database telecom;
drop database telecom;
show databases;
use telecom;
show tables;

# DATASET
select * from telecom_analysis;

# TOTAL COUNT OF ROWS
select count(*) from telecom_analysis;

# 1. AVERAGE CALLS MADE
select avg(calls_made) as avg_calls from telecom_analysis;

# 2. AVERAGE SALARY OF EMPLOYEES
select  round(avg(estimated_salary),2) as avg_salary from telecom_analysis;

# 3.AVERAGE DATA USED
select avg(calls_made) as avg_calls from telecom_analysis;

# 4. AVERAGE DATA USED BY EACH TELECOM PArTNER
select telecom_partner, round(avg(estimated_salary),2) as avg_salary 
from telecom_analysis group by telecom_partner;

# 5. TOTAL CHURN FROM EACH DEPARTMENTS
select telecom_partner,count(*) churn 
from telecom_analysis 
group by telecom_partner;

# 6. AGE CATEGORY 
select 
case
when age < 25 then "adult"
when age between 25 and 40 then " middle age"
when age between 41 and 60 then " old"
else "very old" 
end as age_category,
count(*) as customers
from telecom_analysis
group by age_category;


# 7. STATE WISE TELECOM PARTNERS COUNT
select
state, telecom_partner,
count(*) as count
from telecom_analysis
group by state, telecom_partner
order by state, count desc;


# 8. CUSTOMERS ADDED PER YEAR
select
year(date_of_registration) as joined_year,
count(*) as customers_added
from telecom_analysis
group by year(date_of_registration) 
order by joined_year;

# 9. CUSTOMER DITRIBUTION BY GENDER
select 
 gender,
 count(*) as count
 from telecom_analysis
 group by gender;

# 10. CUSTOMER DITRIBUTION BY STATE
select 
state,
count(*) as counts
from telecom_analysis
group by state
order by state;


# 11. OVERALL CHURN RATE
select
sum(churn) /count(*) *100 as churn_rate
from telecom_analysis;

# STATE WITH HIGHER CHURN RATE
select
state,
count(*) as total_customers,
sum(churn) as churned_customers,
sum(churn) / count(*) as churn_rate
from telecom_analysis
group by state
order by churn_rate desc;

# 12. PARTNER WISE DOMINANCE IN EACH STATE
select 
state, telecom_partner,
count(*) as total_customers
from telecom_analysis
group by state, telecom_partner
order by total_customers desc ;

# 13. SALARY DISTRIBUTION
select
case 
 WHEN estimated_salary < 20000 THEN '< 20K'
        WHEN estimated_salary BETWEEN 20000 AND 39999 THEN '20K - 39K'
        WHEN estimated_salary BETWEEN 40000 AND 59999 THEN '40K - 59K'
        WHEN estimated_salary BETWEEN 60000 AND 79999 THEN '60K - 79K'
        WHEN estimated_salary BETWEEN 80000 AND 99999 THEN '80K - 99K'
        ELSE '100K+' end as salary_range,
        count(*) as customers
        from telecom_analysis
        group by salary_range;
      
	
# 14. TELECOM PARTNER WITH HIGHER CHURN RATE
select 
telecom_partner,
count(*) as customers,
sum(CHURN) AS CHURNED_CUSTOMERS,
SUM(CHURN) / COUNT(*) *100  AS CHURN_RATE
FROM telecom_analysis
GROUP BY telecom_partner;

# 15. Usage difference between churned vs active customers
SELECT 
CHURN,
count(*) AS CUSTOMERS,
AVG(DATA_USED) AS USED_DATA,
AVG(SMS_SENT) AS SMS,
AVG(CALLS_MADE) AS CALLS
FROM telecom_analysis
GROUP BY CHURN;

# 16. Salary vs churn relationship
SELECT CHURN,
round(AVG(estimated_salary) ,2) AS SALARY
FROM telecom_analysis
group by CHURN;


# 17.CUSTOMER COUNT PER PARTNER
SELECT TELECOM_PARTNER,
COUNT(*) AS CUSTOMER_PER_PARTNER
FROM telecom_analysis 
GROUP BY telecom_partner;

# 18. COUNT OF CHURNED AND ACTIVE CUSTOMERS
SELECT 
CHURN,
COUNT(*) AS TOTAL_CUSTOMERS
FROM telecom_analysis
GROUP BY CHURN;

# 19. TOP TELECOM PARTNER IN KERALA
SELECT TELECOM_PARTNER,
COUNT(*) AS TOTAL_CUSTOMERS
FROM telecom_analysis
WHERE STATE="KERALA"
GROUP BY telecom_partner  
ORDER BY TOTAL_CUSTOMERS DESC;

# 20. INCOME CATEGORY WITH HIGHER CHURN RATE
SELECT 
CASE 
WHEN ESTIMATED_SALARY < 30000 THEN "Low income"
WHEN ESTIMATED_SALARY BETWEEN  30000 AND 100000 THEN "Average income"
else "High income"
end as salary_category,
count(* ) as total_customers,
sum(churn) as churned_customers,
round(sum(churn) / count(*) *100,2) as churn_rate
from telecom_analysis
group by salary_category
order by churn_rate desc;

# 21. USAGE PATTERN BY SALARY
select case

WHEN ESTIMATED_SALARY < 30000 THEN "Low income"
WHEN ESTIMATED_SALARY BETWEEN  30000 AND 100000 THEN "Average income"
else "High income"
end as salary_category,
count(*) as total_customers,
round(avg(calls_made),2) as avg_calls,
round(avg(sms_sent),2) as avg_sms,
round(avg(data_used),2) as avg_data
from telecom_analysis
group by salary_category;

# 22.Avg churn by number of dependents
select  num_dependents,
count(*) as total_customers,
round(avg(churn),2) as avgs
from telecom_analysis
group by num_dependents;









