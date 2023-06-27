
/* Checking on the type of missingness of the data */
SELECT 
    COUNT(age) AS "non null count",
    COUNT(*) AS "total rows",
    (COUNT(*) - COUNT(age)) AS "missing count",
    (CAST(COUNT(*) - COUNT(age) AS DECIMAL) / COUNT(*)) AS "proportion of missing age" 
FROM communications;


/* Using mean imputation to replace the missing values in the age column */ 

UPDATE communications
SET age = (
  SELECT AVG(age) 
  FROM communications
  WHERE age IS NOT NULL
)
WHERE age IS NULL;

/* add an age bracket to have a categorization in the age column */

-- Add a new column to the communications table
ALTER TABLE communications
ADD COLUMN age_bracket VARCHAR(20);

-- Update the values in the age_bracket column based on the CASE statement
ALTER TABLE communications
ADD age_bracket VARCHAR(20);

-- Update the values in the age_bracket column based on the CASE statement
UPDATE communications
SET age_bracket =
    CASE
        WHEN age BETWEEN 0 AND 17 THEN '0-17'
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 49 THEN '35-49'
        WHEN age BETWEEN 50 AND 74 THEN '50-74'
        WHEN age >= 75 THEN '75+'
        ELSE NULL
    END;

SELECT *
FROM communications


/* check to see if there are still null values */
SELECT a.*
FROM communications a
WHERE a.age is null


/* fill in the gaps for the missing values in the customer_country */

UPDATE communications
SET customer_country = 'unknown' 
WHERE customer_country IS NULL;

/* check if there are still null values */ 
SELECT *
FROM communications

