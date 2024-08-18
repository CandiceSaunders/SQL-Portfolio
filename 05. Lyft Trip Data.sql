 /* 
    Dataset: Lyft Trip Data
    Source: SQL Codecademy Course, Learn SQL Skill Path
    Queried using: SQLite 3

    About the Dataset:
    The Lyft Trip Data dataset is a database that contains multiple tables with tables:
        - trips: trips information
        - riders: user data
        - cars: autonomous cars
        - riders2: new riders user data
    
    Project Description:
    This project demonstrates my ability to query data on multiple tables within a database
    using join clauses and aggregate functions.
*/

-- Query all tables
SELECT * FROM trips;
SELECT * FROM riders;
SELECT * FROM cars;

-- Cross join the riders and cars tables
SELECT * FROM riders
  CROSS JOIN cars;

-- Create a trip log with the trips and users using left join.
SELECT * FROM riders
  LEFT JOIN trips
    ON trips.rider_id = riders.id;

-- Create a link between the trips and cars used during trips using inner join.
SELECT * FROM trips
  JOIN cars
  ON trips.car_id = cars.id;

-- Add new riders (riders2 table) to the riders table.
SELECT * FROM riders
UNION
SELECT * FROM riders2;

-- Determine the average cost for a trip.
SELECT AVG(cost) AS 'Average Cost' FROM trips;

-- Determine riders who have used Lyft less than 500 times.
SELECT * FROM riders
WHERE total_trips < 500;

-- Calculate the number of cars that are active.
SELECT COUNT(status) AS 'ACTIVE' FROM cars
WHERE status = 'active';

-- Find the two cars that have the highest trips_completed.
SELECT * FROM cars
ORDER BY trips_completed DESC
LIMIT 2;
