-- Check the total number of records to ensure all 200k rows were imported correctly
SELECT COUNT(*) AS Total_Records FROM InsulinData;

-- Preview the first 10 rows to verify data alignment and column types
SELECT TOP 10 * FROM InsulinData;


-- Seeing the highest 5 countries on insulin resistance 
SELECT TOP 5 Country, ROUND(AVG(HOMA_IR), 2) AS Avg_HOMA
FROM InsulinData
GROUP BY Country
ORDER BY Avg_HOMA DESC;




-- Calculate the average HOMA-IR score per Age Group to identify high-risk demographics
SELECT Age_Group, 
       ROUND(AVG(HOMA_IR), 2) AS Average_Insulin_Resistance
FROM InsulinData
GROUP BY Age_Group
ORDER BY Average_Insulin_Resistance DESC;




-- Analyze the distribution of Heart Risk levels among Diabetic vs Non-Diabetic patients
SELECT Diabetic, 
       Heart_Risk, 
       COUNT(*) AS Patient_Count
FROM InsulinData
GROUP BY Diabetic, Heart_Risk
ORDER BY Diabetic, Patient_Count DESC;




-- Filter patients with high Cholesterol (LDL > 130) and high TG/HDL Ratio
-- Purpose: Identifying patients at severe metabolic risk
SELECT Country, Gender, Age, ROUND(LDL, 2) AS LDL, ROUND(TG_HDL_Ratio,2) AS TG_HDL_Ratio
FROM InsulinData
WHERE LDL > 130 AND TG_HDL_Ratio > 3.0
ORDER BY TG_HDL_Ratio DESC;




-- Categorizing patients into Risk Zones based on HOMA-IR and HbA1c levels
-- Purpose: Create a custom risk profile for targeted medical intervention
SELECT 
    ID, 
    Country, 
    ROUND(HOMA_IR, 2) HOMA_IR, 
    ROUND(HbA1c,2) HbA1c ,
    CASE 
        WHEN HOMA_IR > 2.9 AND HbA1c >= 6.5 THEN 'High Risk / Diabetic'
        WHEN HOMA_IR BETWEEN 1.9 AND 2.9 OR HbA1c BETWEEN 5.7 AND 6.4 THEN 'Pre-Diabetic / Warning'
        ELSE 'Normal / Healthy'
    END AS Patient_Risk_Profile
FROM InsulinData
ORDER BY HOMA_IR DESC;





-- Identifying outliers in Fasting Insulin levels using Statistical Standard Deviation
-- Purpose: Data quality check to find extreme values that might skew the average
SELECT 
    Country, 
    AVG(Fasting_Insulin) as Global_Avg, 
    STDEV(Fasting_Insulin) as Std_Dev
FROM InsulinData
GROUP BY Country
HAVING STDEV(Fasting_Insulin) > (SELECT STDEV(Fasting_Insulin) FROM InsulinData) * 1.5;
-- There is no outliers





-- Ranking Countries by their Average Triglyceride (TG) levels
-- Purpose: Benchmark countries against each other to see which has the highest metabolic risk
SELECT 
    Country, 
    AVG(TG) as Avg_TG,
    RANK() OVER (ORDER BY ROUND(AVG(TG),2) DESC) as Risk_Rank
FROM InsulinData
GROUP BY Country;




-- Analyzing the impact of Lipid Profile (LDL/HDL) on Insulin Resistance (HOMA_IR)
-- Purpose: Finding correlation between High Cholesterol and Insulin issues
SELECT 
    Gender,
    CASE WHEN LDL > 130 THEN 'High LDL' ELSE 'Normal LDL' END as Cholesterol_Status,
    COUNT(*) as Patient_Count,
    ROUND(AVG(HOMA_IR), 2) as Avg_Insulin_Resistance
FROM InsulinData
GROUP BY Gender, CASE WHEN LDL > 130 THEN 'High LDL' ELSE 'Normal LDL' END;





-- Finding the "Most Vulnerable Demographic" by combining multiple risk factors
-- Purpose: Data-driven insights for public health policy recommendations
SELECT TOP 10
    Country, 
    Age_Group, 
    Gender, 
    COUNT(*) as High_Risk_Count
FROM InsulinData
WHERE Insulin_Resistant = 1 AND Heart_Risk = 'High'
GROUP BY Country, Age_Group, Gender
ORDER BY High_Risk_Count DESC;








































