/*  
    Dataset: Trends in Startups
    Source: SQL Codecademy Course, Learn SQL Skill Path
    Queried using: SQLite 3

    About the Dataset:
    The Trends in Startups dataset is a database that contains a table with columns 
    name, location, category, employees, raised, valuation, founded, stage, ceo, and info.
    The table can be found here: https://docs.google.com/spreadsheets/d/1HMlkeeHf_qnWtAPGVqsLIOOyMKh7lFO8djkLZnAUFps/edit?usp=sharing
    
    Project Description:
    This project demonstrates my ability to query data using aggregate functions applied to the 'startups' table.
*/

-- Query the entire table
SELECT * FROM startups;

-- Determine the total number of startups
SELECT COUNT(*) FROM startups;

-- Calculate the total value of all startups
SELECT SUM(valuation) FROM startups;

-- Determine the highest amount raised by a startup
SELECT MAX(raised) FROM startups;

-- Determine the highest amount raised by a startup during the 'Seed' stage
SELECT MAX(raised) FROM startups
WHERE stage = 'Seed';

-- Determine the oldest startup founded
SELECT MIN(founded) FROM startups;

-- Calculate the average valuation
SELECT AVG(valuation) from startups;

-- Determine the average vaulation in each category, 
-- round average to 2 decimal places, and order list in descending order
SELECT category, ROUND(AVG(valuation), 2) FROM startups
GROUP BY 1
ORDER BY 2 DESC;

-- Determine the number of companies in each category and filter 
-- for categories that have more than 3 companies
SELECT category, COUNT(*) FROM startups
GROUP BY 1
HAVING COUNT(*) > 3;

-- Determine the average size of a startup in each location with averages above 500
SELECT location, AVG(employees) from startups
GROUP BY location
HAVING AVG(employees) > 500;