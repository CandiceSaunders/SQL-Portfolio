/*  Dataset: N/A
    Source: N/A
    Queried using: SQLite 3

    Project Description:
    This project demonstrates my ability to create a table (friends) and modify it.
*/

-- Create a table named friends
CREATE TABLE friends (
  id INTEGER,
  name TEXT,
  birthday DATE
);

-- Add record to table
INSERT INTO friends
VALUES (1, 'Ororo Munroe', 'May 30, 1940');

-- Add two more records into the table
INSERT INTO friends
VALUES 
(2, 'Cherry Blossom', 'January 13, 1922'),
(3, 'Davis McLane', 'November 10, 1975');

-- Update a name in table
UPDATE friends
SET name = 'Storm'
WHERE id = 1;

-- Add new column, email, to table
ALTER TABLE friends
ADD COLUMN email TEXT;

-- Update email address for all records
UPDATE friends
SET email = 'storm@codeacademy.com'
WHERE id = 1;

UPDATE friends
SET email = 'cherry.blossom@codeacademy.com'
WHERE id = 2;

UPDATE friends
SET email = 'davis.mclane@codeacademy.com'
WHERE id = 3;

-- Remove record from table
DELETE FROM friends
WHERE id = 1;

-- Check record has been added
SELECT * FROM friends
