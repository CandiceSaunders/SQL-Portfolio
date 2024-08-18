/*  
    Dataset: The Metropolitan Museum of Art
    Source: SQL Codecademy Course, Analyze Data with SQL Skill Path
    Queried using: SQLite 3

    About the Dataset:
    TThe Metropolitan Museum of Art dataset is a database that contains a table, met, 
    with columns: id, department, category, title, artist, date, medium, and country.
    
    Project Description:
    The Metropolitan Museum of Art of New York is one of the world’s largest and 
    finest art museums. In this project, I worked with a table named met that contains data 
    about the museum’s collection of American Decorative Arts. I used SQL queries to determine
    analyze data provided.
*/

 -- Query the table
 SELECT * FROM met;

 -- Determine how many pieces are in the American 
 -- Decorative Art collection.
 SELECT COUNT(department) FROM met
 WHERE department = 'American Decorative Arts';

 -- Count the number of pieces where the
 -- category includes 'celery'.
 SELECT COUNT(category) FROM met
 WHERE category LIKE '%celery%';

 -- Find oldest date in dataset.
 SELECT MIN(date) FROM met;

 -- Find the title and medium of the oldest piece(s) in the collection.
 SELECT title, medium FROM met
 WHERE date LIKE '%1600%';

 -- Find the top 10 countries with the most pieces in the collection.
 SELECT country, COUNT(country) AS 'Total Pieces' FROM met
 WHERE country IS NOT NULL
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 10;

 -- Find the categories HAVING more than 100 pieces.
 SELECT category FROM met
 GROUP BY category
 HAVING COUNT(*) > 100;

 -- Count the number of pieces where the medium contains ‘gold’ 
 -- or ‘silver’ in descending order.
 SELECT medium, COUNT(*) AS 'Total Gold or Silver' FROM met
 WHERE medium LIKE '%gold%' 
  OR medium LIKE '%silver%'
GROUP BY 1
ORDER BY 2 DESC;