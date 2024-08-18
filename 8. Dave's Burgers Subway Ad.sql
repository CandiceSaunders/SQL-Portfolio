/*  
    Dataset: Dave's Burgers Subway Ad
    Source: SQL Codecademy Course, Analyze Data with SQL Skill Path
    Queried using: SQLite 3

    About the Dataset:
    The Dave's Burgers Subway Ad dataset is a database that contains a table, users, 
    with columns: id, user_id, order_date, restaurant_id, item_name, and special_instructions.
    
    Project Description:
    Davie’s Burgers restaurant business has been booming and it is 
    now looking to place a catchy advertisement in the local subway station. 
    Write SQL queries to help them dig into their orders table to see 
    if there is anything interesting in there for a funny tagline!
*/

-- Query the table
SELECT * FROM orders;

-- Determine how recent is this data
SELECT DISTINCT order_date FROM orders
ORDER BY 1 DESC;

-- Query only the special_instructions column.
-- Limit the result to 20 rows.
SELECT special_instructions FROM orders
LIMIT 20;

-- Edit the query to only return the special instructions that are not empty
SELECT special_instructions FROM orders
WHERE special_instructions IS NOT NULL;

-- Sort the instructions in alphabetical order (A-Z).
SELECT special_instructions FROM orders
WHERE special_instructions IS NOT NULL
ORDER BY 1;

-- Search for special instructions that have the word ‘sauce’.
SELECT special_instructions FROM orders
WHERE special_instructions LIKE '%sauce%';

-- Search for special instructions that have the word ‘door’.
SELECT special_instructions FROM orders
WHERE special_instructions LIKE '%door%';

-- Search for special instructions that have the word ‘box’.
SELECT special_instructions FROM orders
WHERE special_instructions LIKE '%box%';


-- Instead of just returning the special instructions, also return their order ids.
-- For more readability:
-- Rename id as ‘#’
-- Rename special_instructions as ‘Notes’
SELECT id AS '#', special_instructions AS 'Notes' FROM orders
WHERE special_instructions LIKE '%box%';

-- They have asked you to query the customer who made the 
-- phrase, "Draw a narwhal on the delivery box.". 
-- Return the item_name restaurant_id, and user_id for the person created the phrase.
SELECT item_name, restaurant_id, user_id FROM orders
WHERE special_instructions LIKE "%narwhal%";