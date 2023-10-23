--What is the age distribution of the customers?
SELECT
    CASE
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 24 THEN '18-24'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        WHEN Age BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65 and Over'
    END AS AgeGroup,
    COUNT(*) AS CustomerAgeCount
FROM
    cleantestdata1177
GROUP BY
    AgeGroup
ORDER BY
    MIN(Age);
    
    --How many customers are married or single?
    SELECT Married, COUNT(*) AS CustomerCount
    FROM cleantestdata1177
    GROUP BY married;

-- How may customers are college graduates?
SELECT graduated, COUNT(*) AS GraduateCount
FROM cleantestdata1177
GROUP BY graduated;

--What are the most common professions amongst our customers?
SELECT profession, COUNT(*) AS ProfessionCount
FROM cleantestdata1177
GROUP BY profession
ORDER BY ProfessionCount DESC;

 --What is the average and Max work experience of our customers?
 SELECT ROUND(AVG(workexperience)) AS AvgWorkExperience, MAX(workexperience)
 FROM cleantestdata1177;
 
 --What is the distribution of spending scores among customers?
 SELECT spendingscore, COUNT(*) AS CustomerCount
FROM cleantestdata1177
GROUP BY spendingscore
ORDER BY spendingscore DESC;

--Are there any spending patterns based on family size and marital status?
SELECT
    FamilySize,
    SpendingScore,
    COUNT(*) AS CustomerCount
FROM cleantestdata1177
GROUP BY FamilySize,spendingscore
ORDER BY familysize;
--By marital status
SELECT
    married,
    SpendingScore,
    COUNT(*) AS CustomerCount
FROM cleantestdata1177
GROUP BY married,spendingscore
ORDER BY married;

--How many customers fall into each category?
SELECT category, COUNT(*) AS CustomerCount
FROM cleantestdata1177
GROUP BY category;

--How does spending score differ between gender?
SELECT gender, spendingscore, COUNT(*) AS CustomerCount
FROM cleantestdata1177
GROUP BY gender, spendingscore;

--What is the distribution of professions between male and female customers?
SELECT gender, profession, COUNT(*) AS CustomerCount
FROM cleantestdata1177
GROUP BY gender, profession;

--What age group has the highest spending score?
SELECT
    CASE
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 24 THEN '18-24'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        WHEN Age BETWEEN 55 AND 64 THEN '55-64'
        ELSE '65 and Over'
    END AS AgeGroup,
    SpendingScore,
    COUNT(*) AS CustomerCount
FROM cleantestdata1177
GROUP BY AgeGroup, SpendingScore;

--Do graduates tend to spend more than non-graduates?
SELECT graduated, spendingscore, COUNT(*) AS CustomerCount
FROM cleantestdata1177
Where spendingscore = 'High'
GROUP BY graduated, spendingscore;

--Is there any relationship between customer profession and spending score?
SELECT profession, spendingscore, COUNT(*) AS CustomerCount
FROM cleantestdata1177
WHERE spendingscore = 'High'
GROUP BY profession, spendingscore;

--Is there any relationship between customer's family size and spending habit?
SELECT familysize, spendingscore, COUNT(*) AS CustomerCount
FROM cleantestdata1177
GROUP BY familysize, spendingscore;
