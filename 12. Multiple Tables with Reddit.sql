/*  
    Dataset: Multiple Tables with Reddit
    Source: SQL Codecademy Course, Analyze Data with SQL Skill Path
    Queried using: SQLite 3

    About the Dataset:
    The Multiple Tables with Reddit dataset is a database that contains four tables 
    (and their columns):
    users: id, username, email, join_date, score
    posts: id, title, user_id, subreddit_id, score, created_date
    posts2: id, title, user_id, subreddit_id, score, created_date
    subreddits: id, name, created_date, subscriber_count
    
    Project Description:
    On Reddit, users can create posts with content such as text, media, and links 
    to other websites. Users can also post content to different communities known as 
    subreddits, which focus on a particular topic. For this project, I examinined and
    analyzed some fictional data from Reddit.
*/

-- Query the first 10 rows of each table.
SELECT * FROM users
LIMIT 10;

SELECT * FROM posts
LIMIT 10;

SELECT * FROM subreddits
LIMIT 10;

-- Write a query to count how many different subreddits there are.
SELECT COUNT(*) AS 'Total Subreddits'
FROM subreddits; 

-- Determine what user has the highest score.
SELECT * FROM users
ORDER BY score DESC
LIMIT 1;

-- Determine what post has the highest score.
SELECT * FROM posts
ORDER BY score DESC
LIMIT 1;

-- Determine what are the top 5 subreddits with the highest subscriber_count.
SELECT * FROM subreddits
ORDER BY subscriber_count DESC
LIMIT 5;

-- Use a LEFT JOIN with the users and posts tables to find out how many posts 
-- each user has made. Order the data by the number of posts in descending order.
SELECT users.username, COUNT(*) AS 'Total Posts'
FROM users

LEFT JOIN posts
  ON users.id = posts.user_id
GROUP BY users.id
ORDER BY 2 DESC;

-- We only want to see existing posts where the users are still active, so use an 
-- INNER JOIN to write a query to get these posts. Have the posts table as the left table.
SELECT * FROM posts
JOIN users
  ON posts.user_id = users.id;

-- Stack the new posts2 table under the existing posts table to see them.
SELECT * FROM posts
UNION
SELECT * FROM posts2;

-- Now you need to find out which subreddits have the most popular posts. A post is popular 
-- if it has a score of at least 5000.
WITH popular_posts AS (
  SELECT * FROM posts
  WHERE score >= 5000
)

SELECT subreddits.name,
  popular_posts.title,
  popular_posts.score
FROM subreddits

JOIN popular_posts
  ON subreddits.id = popular_posts.subreddit_id
ORDER BY 3 DESC;

-- Find the highest scoring post for each subreddit.
SELECT subreddits.name AS 'Subreddits Name',
  posts.title,
  MAX(posts.score) AS 'Highest Score'
FROM posts

JOIN subreddits
  ON posts.subreddit_id = subreddits.id
GROUP BY subreddits.id
ORDER BY 3 DESC;

-- Write a query to calculate the average score of all the posts for each subreddit.
SELECT subreddits.name AS 'Subreddits Name',
  ROUND(AVG(posts.score), 0) AS 'Average Score'
FROM subreddits

JOIN posts
  ON subreddits.id = posts.subreddit_id
GROUP BY subreddits.name
ORDER BY 2 DESC;
