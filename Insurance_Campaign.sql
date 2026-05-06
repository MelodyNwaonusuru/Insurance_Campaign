-- Insurance Campaign
-- SQL Cleaning + Case Study Queries
-- ============================================================


-- ============================================================
-- SECTION 1: VIEW RAW TABLE
-- ============================================================

SELECT * FROM Marketing;


-- ============================================================
-- SECTION 2: REMOVE DUPLICATES
-- ============================================================

-- Check for duplicates first
WITH Duplicate_CTE AS (
    SELECT *, 
        ROW_NUMBER() OVER (
            PARTITION BY Customer, State, Customer_Lifetime_Value, Response, 
            Coverage, Education, Effective_To_Date, EmploymentStatus, Gender, Income, 
            Location_Code, Marital_Status, Monthly_Premium_Auto, Months_Since_Last_Claim, 
            Months_Since_Policy_Inception, Number_of_Open_Complaints, Number_of_Policies, 
            Policy_Type, Policy, Renew_Offer_Type, Sales_Channel, Total_Claim_Amount, 
            Vehicle_Class, Vehicle_Size 
            ORDER BY Customer
        ) AS row_num 
    FROM Marketing
)
SELECT * FROM Duplicate_CTE
WHERE row_num > 1;

-- Delete duplicates
WITH Duplicate_CTE AS (
    SELECT *, 
        ROW_NUMBER() OVER (
            PARTITION BY Customer, State, Customer_Lifetime_Value, Response, 
            Coverage, Education, Effective_To_Date, EmploymentStatus, Gender, Income, 
            Location_Code, Marital_Status, Monthly_Premium_Auto, Months_Since_Last_Claim, 
            Months_Since_Policy_Inception, Number_of_Open_Complaints, Number_of_Policies, 
            Policy_Type, Policy, Renew_Offer_Type, Sales_Channel, Total_Claim_Amount, 
            Vehicle_Class, Vehicle_Size 
            ORDER BY Customer
        ) AS row_num 
    FROM Marketing
)
DELETE FROM Duplicate_CTE
WHERE row_num > 1;


-- ============================================================
-- SECTION 3: STANDARDIZE COLUMNS
-- ============================================================

-- Fix trailing whitespace in State
SELECT 
    State,
    LEN(State)            AS len_without_spaces,
    DATALENGTH(State)     AS actual_byte_length
FROM Marketing
WHERE LEN(State) <> DATALENGTH(State) / 2;

UPDATE Marketing
SET State = RTRIM(State)
WHERE LEN(State) <> DATALENGTH(State) / 2;

-- Fix invalid Response values (1 → Yes, 2 → No)
SELECT DISTINCT Response, COUNT(*) AS count
FROM Marketing
GROUP BY Response;

UPDATE Marketing
SET Response = CASE 
                    WHEN Response = '1' THEN 'Yes'
                    WHEN Response = '2' THEN 'No'
                    ELSE Response
               END
WHERE Response IN ('1', '2');

-- Fix Gender abbreviations
SELECT DISTINCT Gender FROM Marketing;

UPDATE Marketing
SET Gender = 'Female'
WHERE Gender = 'F';

UPDATE Marketing
SET Gender = 'Male'
WHERE Gender = 'M';

-- Fix Marital Status inconsistencies
SELECT DISTINCT Marital_Status FROM Marketing;

UPDATE Marketing SET Marital_Status = 'Married' WHERE Marital_Status IN ('M', 'm');
UPDATE Marketing SET Marital_Status = 'Single'  WHERE Marital_Status IN ('S', 's');

-- Fix Vehicle Size typo (Medsize → Midsize)
SELECT DISTINCT Vehicle_Size FROM Marketing;

UPDATE Marketing
SET Vehicle_Size = 'Midsize'
WHERE Vehicle_Size = 'Medsize';

-- Fix Sales Channel nulls and blanks
UPDATE Marketing
SET Sales_Channel = 'Unknown'
WHERE Sales_Channel IS NULL OR TRIM(Sales_Channel) = '';


-- ============================================================
-- SECTION 4: SAVE CLEAN TABLE
-- ============================================================

SELECT *
INTO Marketing_Clean
FROM Marketing;


-- ============================================================
-- SECTION 5: EXPLORATORY DATA ANALYSIS (EDA)
-- ============================================================

-- Row count and unique customers
SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT Customer) AS unique_customers
FROM Marketing_Clean;

-- Null check across key columns
SELECT
    SUM(CASE WHEN Customer IS NULL OR Customer = ''                  THEN 1 ELSE 0 END) AS Customer_nulls,
    SUM(CASE WHEN State IS NULL OR State = ''                        THEN 1 ELSE 0 END) AS State_nulls,
    SUM(CASE WHEN Response IS NULL OR Response = ''                  THEN 1 ELSE 0 END) AS Response_nulls,
    SUM(CASE WHEN Sales_Channel IS NULL OR Sales_Channel = ''        THEN 1 ELSE 0 END) AS SalesChannel_nulls,
    SUM(CASE WHEN Marital_Status IS NULL OR Marital_Status = ''      THEN 1 ELSE 0 END) AS MaritalStatus_nulls,
    SUM(CASE WHEN Income IS NULL                                     THEN 1 ELSE 0 END) AS Income_nulls
FROM Marketing_Clean;

-- Distinct value checks
SELECT DISTINCT Response       FROM Marketing_Clean;
SELECT DISTINCT Marital_Status FROM Marketing_Clean;
SELECT DISTINCT Sales_Channel  FROM Marketing_Clean;
SELECT DISTINCT State          FROM Marketing_Clean;
SELECT DISTINCT Coverage       FROM Marketing_Clean;
SELECT DISTINCT Vehicle_Class  FROM Marketing_Clean;

-- Numeric column summary
SELECT
    MIN(Income)                     AS min_income,
    MAX(Income)                     AS max_income,
    AVG(Income)                     AS avg_income,
    MIN(Customer_Lifetime_Value)    AS min_clv,
    MAX(Customer_Lifetime_Value)    AS max_clv,
    AVG(Customer_Lifetime_Value)    AS avg_clv,
    MIN(Total_Claim_Amount)         AS min_claim,
    MAX(Total_Claim_Amount)         AS max_claim,
    AVG(Total_Claim_Amount)         AS avg_claim
FROM Marketing_Clean;

-- Response rate by State
SELECT State, 
       COUNT(*) AS total,
       SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) AS responded,
       ROUND(100.0 * SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS response_rate_pct
FROM Marketing_Clean
GROUP BY State
ORDER BY response_rate_pct DESC;

-- Response rate by Sales Channel (excluding Unknown — not a real channel)
SELECT Sales_Channel,
       COUNT(*) AS total,
       ROUND(100.0 * SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS response_rate_pct
FROM Marketing_Clean
WHERE Sales_Channel <> 'Unknown'
GROUP BY Sales_Channel
ORDER BY response_rate_pct DESC;


-- ============================================================
-- SECTION 6: CASE STUDY QUESTIONS
-- ============================================================

-- Q1. What is the overall campaign response rate?
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) AS responded,
    CAST(ROUND(100.0 * SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS response_rate_pct
FROM Marketing_Clean;

-- Q2. What is the average CLV for customers who responded Yes vs No?
SELECT
    Response,
    ROUND(AVG(Customer_Lifetime_Value), 2) AS Average_CLV,
    COUNT(*) AS total_customers
FROM Marketing_Clean
GROUP BY Response;

-- Q3. Which renew offer type has the highest response rate?
SELECT TOP 1
    Renew_Offer_Type, 
    SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) AS responded,
    COUNT(*) AS total_customers,
    CAST(ROUND(100.0 * SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS response_rate_pct
FROM Marketing_Clean
GROUP BY Renew_Offer_Type
ORDER BY response_rate_pct DESC;

-- Q4. How many customers responded Yes vs No per state?
SELECT 
    State, 
    SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) AS responded,
    COUNT(*) AS total_customers,
    CAST(ROUND(100.0 * SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS response_rate_pct
FROM Marketing_Clean
GROUP BY State
ORDER BY response_rate_pct DESC; 

-- Q5. Which sales channel has the most customers?
SELECT 
    Sales_Channel, 
    COUNT(*) AS total_customers
FROM Marketing_Clean
GROUP BY Sales_Channel
ORDER BY total_customers DESC;

-- Q6. Which sales channel has the highest response rate?
SELECT 
    Sales_Channel,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) AS responded,
    CAST(ROUND(100.0 * SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS response_rate_pct
FROM Marketing_Clean
WHERE Sales_Channel <> 'Unknown'
GROUP BY Sales_Channel
ORDER BY response_rate_pct DESC;

-- Q7. Which sales channel produces the highest average CLV?

SELECT 
    Sales_Channel, 
    ROUND(AVG(Customer_Lifetime_Value), 2) AS Average_CLV
FROM Marketing_Clean
WHERE Sales_Channel <> 'Unknown'
GROUP BY Sales_Channel
ORDER BY Average_CLV DESC;

-- Q8. What is the average monthly premium and average claim amount per sales channel?
-- Note: Unknown excluded — not a real channel
SELECT 
    Sales_Channel, 
    ROUND(AVG(CAST(Monthly_Premium_Auto AS FLOAT)), 2) AS avg_monthly_premium,
    ROUND(AVG(Total_Claim_Amount), 2)                  AS avg_claim_amount
FROM Marketing_Clean
WHERE Sales_Channel <> 'Unknown'
GROUP BY Sales_Channel
ORDER BY avg_monthly_premium DESC;

-- Q9. Which state has the highest average CLV?
SELECT 
    State, 
    ROUND(AVG(Customer_Lifetime_Value), 2) AS Average_CLV 
FROM Marketing_Clean
GROUP BY State
ORDER BY Average_CLV DESC;

-- Q10. Which state has the highest response rate?
SELECT 
    State, 
    CAST(ROUND(100.0 * SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS response_rate_pct
FROM Marketing_Clean
GROUP BY State
ORDER BY response_rate_pct DESC;

-- Q11. What is the total claim amount per state?
SELECT 
    State, 
    ROUND(SUM(Total_Claim_Amount), 2) AS Total_claim_amount
FROM Marketing_Clean
GROUP BY State
ORDER BY Total_claim_amount DESC;

-- Q12. Which coverage type is most popular in each state?
WITH Coverage_Count AS (
    SELECT 
        State,
        Coverage,
        COUNT(*) AS total_coverage,
        RANK() OVER (PARTITION BY State ORDER BY COUNT(*) DESC) AS rnk
    FROM Marketing_Clean
    GROUP BY State, Coverage
)
SELECT 
    State,
    Coverage,
    total_coverage
FROM Coverage_Count
WHERE rnk = 1
ORDER BY State;

-- Q13. What is the response rate by gender?
SELECT 
    Gender, 
    SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) AS responded,
    CAST(ROUND(100.0 * SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS response_rate_pct
FROM Marketing_Clean
GROUP BY Gender
ORDER BY response_rate_pct DESC; 

-- Q14. What is the response rate by marital status?
SELECT 
    Marital_Status, 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) AS responded,
    CAST(ROUND(100.0 * SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS response_rate_pct
FROM Marketing_Clean
GROUP BY Marital_Status
ORDER BY response_rate_pct DESC;

-- Q15. Which education level has the highest average CLV?
SELECT 
    Education, 
    ROUND(AVG(Customer_Lifetime_Value), 2) AS Average_CLV 
FROM Marketing_Clean
GROUP BY Education
ORDER BY Average_CLV DESC;

-- Q16. Which employment status has the highest average income?
SELECT 
    EmploymentStatus, 
    AVG(Income) AS Average_Income 
FROM Marketing_Clean
GROUP BY EmploymentStatus
ORDER BY Average_Income DESC;

-- Q17. Do customers with more open complaints file higher claim amounts?
SELECT 
    Number_of_Open_Complaints, 
    COUNT(*) AS Total_Customers, 
    ROUND(SUM(Total_Claim_Amount), 2) AS Total_Claim_Amount 
FROM Marketing_Clean
GROUP BY Number_of_Open_Complaints
ORDER BY Number_of_Open_Complaints ASC;

-- Q18. Which policy type has the highest average CLV?
SELECT 
    Policy_Type, 
    ROUND(AVG(Customer_Lifetime_Value), 2) AS Average_CLV 
FROM Marketing_Clean
GROUP BY Policy_Type
ORDER BY Average_CLV DESC;

-- Q19. Which vehicle class generates the highest average monthly premium?
SELECT 
    Vehicle_Class,     
    ROUND(AVG(Monthly_Premium_Auto), 2) AS Average_Monthly_Premium 
FROM Marketing_Clean
GROUP BY Vehicle_Class
ORDER BY Average_Monthly_Premium DESC;

-- Q20. Do longer-tenure customers have a higher CLV than newer ones?
SELECT
    CASE
        WHEN Months_Since_Policy_Inception < 12 THEN '0-1 Year'
        WHEN Months_Since_Policy_Inception < 36 THEN '1-3 Years'
        WHEN Months_Since_Policy_Inception < 60 THEN '3-5 Years'
        ELSE '5+ Years'
    END AS tenure_band,
    COUNT(*) AS total_customers,
    ROUND(AVG(Customer_Lifetime_Value), 2) AS avg_clv,
    ROUND(AVG(Monthly_Premium_Auto), 2) AS avg_premium
FROM Marketing_Clean
GROUP BY
    CASE
        WHEN Months_Since_Policy_Inception < 12 THEN '0-1 Year'
        WHEN Months_Since_Policy_Inception < 36 THEN '1-3 Years'
        WHEN Months_Since_Policy_Inception < 60 THEN '3-5 Years'
        ELSE '5+ Years'
    END
ORDER BY MIN(Months_Since_Policy_Inception) ASC;

-- Q21. What is the response rate by coverage type?
SELECT 
    Coverage,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) AS responded,
    CAST(ROUND(100.0 * SUM(CASE WHEN Response = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS DECIMAL(5,2)) AS response_rate_pct
FROM Marketing_Clean
GROUP BY Coverage
ORDER BY response_rate_pct DESC;

-- Q22. What is the average CLV by income band?
SELECT
    CASE
        WHEN Income = 0           THEN 'No Income'
        WHEN Income < 30000       THEN 'Low'
        WHEN Income < 60000       THEN 'Middle'
        WHEN Income < 90000       THEN 'Upper Middle'
        ELSE                           'High'
    END AS income_band,
    COUNT(*) AS total_customers,
    ROUND(AVG(Customer_Lifetime_Value), 2) AS avg_clv
FROM Marketing_Clean
GROUP BY
    CASE
        WHEN Income = 0           THEN 'No Income'
        WHEN Income < 30000       THEN 'Low'
        WHEN Income < 60000       THEN 'Middle'
        WHEN Income < 90000       THEN 'Upper Middle'
        ELSE                           'High'
    END
ORDER BY avg_clv DESC;
