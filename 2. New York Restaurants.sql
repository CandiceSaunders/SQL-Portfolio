/*  
    Dataset: New York Restaurants
    Source: SQL Codecademy Course, Learn SQL Skill Path
    Queried using: SQLite 3

    About the Dataset:
    The New York Restaurants data set is a database that contains a table with columns 
    name, neighborhood, restaurant, cuisine, review, price, and health.
    The table can be found here: https://docs.google.com/spreadsheets/d/1GKwkHDSLxe2d6TCDfoO_OTtsSNCUt50WI8c3QJ2AGas/edit?gid=0#gid=0
    
    Project Description:
    This project demonstrates my ability to query data using DISTINCT, ORDER BY, and CASE clauses, applied to the 'nomnom' table.
*/

-- Query complete table
SELECT * FROM nomnom;

-- Query list of distinct neighborhoods
SELECT DISTINCT neighborhood FROM nomnom;

-- Query list of distinct cuisines
SELECT DISTINCT cuisine FROM nomnom;

-- Query all Chinese restaurants
SELECT * FROM nomnom
WHERE cuisine = 'Chinese';

-- Query restaurants with a rating/review of 4 stars and above
SELECT * FROM nomnom
WHERE review >= 4;

-- Query Italian restaurants with price of '$$$'
SELECT * FROM nomnom
WHERE cuisine = 'Italian'
  AND price = '$$$';

-- Query restaurant(s) containing 'meatball' in the name
SELECT * FROM nomnom
WHERE name LIKE '%meatball%';

-- Query restaurants near Midtown, Downtown or Chinatown
SELECT * FROM nomnom
WHERE neighborhood = 'Midtown'
  OR neighborhood = 'Downtown'
  OR neighborhood = 'Chinatown';

-- Query restaurants where health rating results are pending (empty values)
SELECT * FROM nomnom
WHERE health IS NULL;

-- Create a list of Top 10 restaurants based on reviews
SELECT * FROM nomnom
ORDER BY review DESC
LIMIT 10;

-- Return a result that changes the rating system based on the reviews.
SELECT name,
 CASE
  WHEN review > 4.5 THEN 'Extraordinary'
  WHEN review > 4 THEN 'Excellent'
  WHEN review > 3 THEN 'Good'
  WHEN review > 2 THEN 'Fair'
  ELSE 'POOR'
 END AS 'Review'
FROM nomnom;


