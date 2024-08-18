/*  
    Dataset: RPA Customer Segmentation
    Source: SQL Codecademy Course, Analyze Data with SQL Skill Path
    Queried using: SQLite 3

    About the Dataset:
    The RPA Customer Segmentation dataset is a database that contains a table, users, 
    with columns: id, email, campaign, test, created_at, and birthday.
    
    Project Description:
    The marketing department of Reputable Product Agency (RPA) is looking to segment 
    the company users by a number of different criteria. (Segments are used to send 
    marketing campaigns to users who meet specific criteria or to measure the performance 
    of specific marketing campaigns.) Use SQL queries to generate user lists for the 
    marketing department. 
*/

-- Query the table, users.
SELECT * FROM users;

-- Find the email addresses and birthdays of users whose 
-- birthday is between 1980-01-01 and 1989-12-31.
SELECT email FROM users
WHERE birthday LIKE '198%';
  
-- Find the emails and creation date of users 
-- who signed up prior to May 2017.
SELECT email, created_at FROM users
WHERE created_at < '2017-05-01'
ORDER BY 2 ASC;

-- Find the emails of the users who received the ‘bears’ test.
SELECT email FROM users
WHERE test = 'bears';

-- Find all the emails of all users who 
-- received a campaign on website BBB.
SELECT email FROM users
WHERE campaign LIKE 'BBB%';

-- Find all the emails of all users who received ad copy 2 (AAA-2 or BBB-2) in their campaign.
SELECT email FROM users
WHERE campaign LIKE '%-2';

-- Find the emails for all users who received both a campaign and a test. 
-- These users will have non-empty entries in the campaign and test columns.
SELECT email FROM users
WHERE campaign IS NOT NULL
  AND test IS NOT NULL;

