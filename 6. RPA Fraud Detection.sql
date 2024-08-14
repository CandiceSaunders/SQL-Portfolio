/*  
    Dataset: RPA Fraud Detection
    Source: SQL Codecademy Course, Learn SQL Skill Path
    Queried using: SQLite 3

    About the Dataset:
    The RPA Fraud Detection dataset is a database that contains a table, transaction_data, 
    with columns: id, full_name, email, zip, ip_address.
    The table can be found here: https://docs.google.com/spreadsheets/d/1edrtEqTrZWojCL7diff-sBYj5K-gcf6sEqMF82T75BY/edit?usp=sharing
    
    Project Description:
    Reputable Product Agency (RPA) has started receiving complaints from their 
    credit card processor about fraudulent transactions. Help your finance department 
    identify potentially risky transactions before they finish processing.
*/

-- Query the first 10 rows of the table transaction_data
SELECT * FROM transaction_data
LIMIT 10;

-- Find the full_names and emails
-- of the transactions listing 20252 as the zip code.
SELECT full_name, email, zip FROM transaction_data
WHERE zip = 20252;

-- Use a query to find the names 
-- and emails associated with transaction with false psuedonyms.
SELECT full_name, email FROM transaction_data
WHERE full_name = 'Art Vandelay' 
  OR full_name LIKE '% der %';

-- Find the ip_addresses and emails listed with transactions
-- associated with irregular IP addresses (beginning with '10').
SELECT ip_address, email FROM transaction_data
WHERE ip_address LIKE '10.%';

-- Find the emails in transaction_data with
-- ‘temp_email.com’ as a domain.
SELECT email FROM transaction_data
WHERE email LIKE '%temp_email.com%'

-- The finance department is looking for a specific transaction. 
-- They know that the transaction occurred from an ip address starting 
-- with ‘120.’ and their full name starts with ‘John’.
-- Find the transaction.
SELECT * FROM transaction_data
WHERE ip_address LIKE '120.%'
  AND full_name LIKE 'John%';

-- Return only those customers residing in GA. Use the list of ZIP CODE prefixes
-- (https://en.wikipedia.org/wiki/List_of_ZIP_Code_prefixes)
-- to determine the best query for zip codes belonging to Georgia(GA).
SELECT * FROM transaction_data
WHERE zip BETWEEN 30000 AND 31999
  OR zip BETWEEN 39800 AND 39899;


