/*  
    Dataset: Welp
    Source: SQL Codecademy Course, Analyze Data with SQL Skill Path
    Queried using: SQLite 3

    About the Dataset:
    The Welp dataset is a database that contains two tables (and their columns):
    places: id, name, address, type, average_rating, price_point, total_revies
    reviews: id, username, place_id, review_date, rating, note
    
    Project Description:
    Users love the exciting new app, Welp, because it allows them to leave reviews of 
    businesses in their city and see how other people reviewed the businesses. 
    For this project, I worked with joining multiple tables to further analyze the dataset.
*/

-- Query the tables places and reviews.
SELECT * FROM places;
SELECT * FROM reviews;

-- If each dollar sign ($) represents $10, determine how you could 
-- find all places that cost $20 or less.
SELECT * FROM places
WHERE price_point = '$'
  OR price_point = '$$';

-- Write a query to do an INNER JOIN on the two tables to show all reviews for restaurants 
-- that have at least one review.
SELECT * FROM places
JOIN reviews
  ON places.id = reviews.place_id
WHERE total_reviews >= 1;

-- Modify previous query to display the most important columns.
SELECT places.name,
  places.average_rating,
  reviews.username,
  reviews.rating,
  reviews.review_date,
  reviews.note
FROM places
JOIN reviews
  ON places.id = reviews.place_id
WHERE total_reviews >= 1;

-- Write a query to do a LEFT JOIN on the tables, selecting the same columns 
-- as the previous question.
SELECT places.name,
  places.average_rating,
  reviews.username,
  reviews.rating,
  reviews.review_date,
  reviews.note
FROM places
LEFT JOIN reviews
  ON places.id = reviews.place_id
WHERE total_reviews >= 1;

-- Write a query to find all the ids of places that currently do not have any 
-- reviews in our reviews table.
SELECT places.id, places.name
FROM places 
LEFT JOIN reviews 
   ON places.id = reviews.place_id
WHERE reviews.place_id IS NULL;

-- Write a query using the WITH clause to select all the reviews that happened in 2020. 
-- JOIN the places to your WITH query to see a log of all reviews from 2020.
WITH reviews_2020 AS (
  SELECT * FROM reviews
  WHERE strftime('%Y', review_date) = '2020'
)

SELECT * FROM places
JOIN reviews_2020
  ON places.id = reviews_2020.place_id;

-- Write a query that finds the reviewer with the most reviews that are BELOW 
-- the average rating for places.
SELECT reviews.username AS 'Username',
  COUNT(*) FROM reviews
JOIN places
  ON places.id = reviews.place_id
WHERE reviews.rating < places.average_rating
GROUP BY reviews.username
ORDER BY 2 DESC
LIMIT 1;