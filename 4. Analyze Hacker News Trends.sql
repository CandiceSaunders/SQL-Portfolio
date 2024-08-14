 /* 
    Dataset: Analyze Hacker News Trend
    Source: SQL Codecademy Course, Learn SQL Skill Path
    Queried using: SQLite 3

    About the Dataset:
    The Hacker News Trend dataset is a database that contains a table, hacker_news,
    with columns: title, user, score, timestamp, and url.
    
    Project Description:
    Hacker News is a popular website run by Y Combinator. It’s known as a
    community site for sharing news, showing off projects, asking questions, among other things. 
    In this project, I worked with a table named 'hacker_news' that contains stories from Hacker News. 
    This project demonstrates my ability to query data using aggregate functions applied to the 'hacker_news' table.
*/

 -- Query top 5 titles and scores from hacker_news table
 SELECT title, score FROM hacker_news
 ORDER BY score DESC
 LIMIT 5;

 -- Find the total score of all stories
 SELECT SUM(score) FROM hacker_news;

 -- Find the individual users who have gotten combined scores of more than 200 and their combined scores.
 SELECT user, SUM(score) from hacker_news
 GROUP BY user
 HAVING SUM(score) > 200;

 -- Calculate percentage of top user scores. (Determine if hacker news is dominated by users with top scores.)
 SELECT ((517+309+304+282)/6336.0)*100;

 -- Determine how many times a user has posted a specific link
 SELECT user, COUNT(*) from hacker_news
 WHERE url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
 GROUP BY user
 ORDER BY COUNT(*) DESC;

 -- Determine which website feeds Hacker News stories the most
 SELECT CASE
  WHEN url LIKE '%github%' THEN 'GitHub'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
  ELSE 'Other'
  END AS 'Source',
COUNT(*) FROM hacker_news
GROUP BY 1
ORDER BY 2 DESC;

-- Determine what time of the day is the best time to post a story to receive a high score
SELECT strftime('%H', timestamp) AS 'Hour', ROUND(AVG(score), 1) AS 'Average Score', 
COUNT(*) AS 'Total Stories' FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;
