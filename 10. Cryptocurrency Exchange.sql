/*  
    Dataset: Cryptocurrency Exchange
    Source: SQL Codecademy Course, Analyze Data with SQL Skill Path
    Queried using: SQLite 3

    About the Dataset:
    TThe Cryptocurrency Exchange dataset is a database that contains a table, transactions, 
    with columns: id, user_id, date, currency, money_in, and money_out.
    
    Project Description:
    Fiddy Cent is a digital currency exchange headquartered in Neo Tokyo. They broker 
    exchanges of Bitcoin, Bitcoin Cash, Ethereum, and Litecoin with fiat currencies in 
    around 50 countries. Help them analyze their January ledger data using SQL aggregate functions! 
*/

 -- Query the transactions table
 SELECT * FROM transactions;

 -- Determine the total of money_in.
 SELECT SUM(money_in) AS 'Sum Money In' FROM transactions;

  -- Determine the total of money_out.
 SELECT SUM(money_out) AS 'Sum Money Out' FROM transactions;

-- Determine how many money_in transactions are in this table.
SELECT COUNT(money_in) AS 'Total Money In Transactions' FROM transactions;

-- Determine how many money_in transactions are 
-- in this table where ‘BIT’ is the currency.
SELECT COUNT(money_in) 'Total Bitcoin Transactions' FROM transactions
WHERE currency = 'BIT';

-- Determine the largest transaction in this whole table. Was it money_in or money_out?
SELECT
CASE
  WHEN MAX(money_in) > MAX(money_out) 
    THEN 'The largest transaction is a money_in transaction.'
  WHEN MAX(money_out) > MAX(money_in) 
    THEN 'The largest transaction is a money_out transaction.'
  ELSE 'The largest transaction is an equal amount in both money_in and money_out.'
END AS 'Result'
FROM transactions;

-- Determine the average money_in in the table for the currency Ethereum (‘ETH’).
SELECT ROUND(AVG(money_in), 2) AS 'Average ETH Currency' FROM transactions
WHERE currency = 'ETH';


-- Build a ledger based on dates. Select date, average money_in, and average 
-- money_out from the table. Group everything by date.
SELECT date, ROUND(AVG(money_in), 2) AS 'Average Buy', 
    ROUND(AVG(money_out), 2) AS 'Average Sell' FROM transactions
GROUP BY date
ORDER BY date;


