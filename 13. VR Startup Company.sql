/*  
    Dataset: VR Startup Company
    Source: SQL Codecademy Course, Analyze Data with SQL Skill Path
    Queried using: SQLite 3

    About the Dataset:
    The VR Startup Company dataset is a database that contains two tables 
    (and their columns):
    employees: employee_id, first_name, last_name, location, position, 
               personality, and current_project
    projects: project_id, project_name, start_date, end_date
    
    Project Description:
    Codecademy Virtual Reality (CVR), Inc. is the latest startup on the VR scene. 
    As head of the Project Completion team, you have been given a list of upcoming projects 
    eeding to be delivered. Your main responsibility is to analyze our current talent pool to 
    ensure each project can be completed efficiently and effectively. (Each project needs a Project Manager, 
    Team Lead, Designer, Database Administrator (DBA), and at least two Developers.)
*/

-- Query the first 10 rows of each table
SELECT * FROM employees
LIMIT 10;

SELECT * FROM projects
LIMIT 10;

-- Determine the names of employees who have not chosen a project.
SELECT first_name, last_name FROM employees
WHERE current_project IS NULL;

-- Determine the names of projects that were not chosen by any employees.
SELECT project_name AS 'Unselected Projects'
FROM projects
WHERE project_id NOT IN (
  SELECT current_project FROM employees
  WHERE current_project IS NOT NULL);

-- Find the name of the project chosen by the most employees.
SELECT project_name AS 'Most Chosen Project'
FROM projects

JOIN employees
    ON projects.project_id = employees.current_project
    WHERE current_project IS NOT NULL
    GROUP BY project_name
    ORDER BY COUNT(current_project) DESC
    LIMIT 1;

-- Determine which projects were chosen by multiple employees.
SELECT project_name 'Project(s) Selected By Multiple Employees'
FROM projects

JOIN employees
    ON projects.project_id = employees.current_project
    WHERE current_project IS NOT NULL
    GROUP BY current_project
    HAVING COUNT(current_project) > 1;

-- Determine which personality is the most common across CVR employees.
SELECT personality, COUNT(*) FROM employees
WHERE personality IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- Determine the names of projects chosen by employees with the most common personality type.
SELECT project_name FROM projects

JOIN employees
    ON projects.project_id = employees.current_project
    WHERE personality = (
        SELECT personality FROM employees
        GROUP BY personality
        ORDER BY COUNT(personality) DESC
        LIMIT 1);

-- Find the personality type most represented by employees with a selected project.
SELECT employees.first_name,
  employees.last_name,
  employees.personality,
  projects.project_name
FROM employees

JOIN projects
    ON employees.current_project = projects.project_id
    WHERE personality = (
        SELECT personality FROM employees
        WHERE current_project IS NOT NULL
        GROUP BY personality
        ORDER BY COUNT(personality) DESC
        LIMIT 1);

-- For each employee with personality type 'ENFJ', provide their name, personality, 
-- the names of any projects they’ve chosen, and the number of incompatible co-workers.
SELECT employees.first_name,
  employees.last_name,
  employees.personality,
  projects.project_name,
CASE
  WHEN personality = 'ENFJ' 
  THEN (SELECT COUNT(*) FROM employees
    WHERE personality IN ('ESFP', 'ISTP',
    'ESTP', 'ISFJ', 'ESFJ', 'ISTJ', 'ESTJ'))
  ELSE 0
END AS 'Number of Incompats'
FROM employees

LEFT JOIN projects
    ON employees.current_project = projects.project_id;