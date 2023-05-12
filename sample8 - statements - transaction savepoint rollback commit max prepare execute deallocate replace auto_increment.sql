# This comment continues to the end of line
-- This comment continues to the end of line
/* this is an in-line comment */


-- create

DROP TABLE IF EXISTS cities;

CREATE TABLE cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    population INT NOT NULL
);

INSERT INTO cities(name,population)
VALUES('New York',8008278),
	  ('Los Angeles',3694825),
	  ('San Diego',1223405);
	  
SELECT * FROM cities;

SELECT "Table cities after replace: " as "";
REPLACE INTO cities(id,name,population)
VALUES(2,'Los Angeles',2696820);
SELECT * FROM cities;


SELECT "Using prepare statmeent: " as "";

PREPARE op FROM -- prepare a querry for execution
	'SELECT *	FROM cities
        WHERE name = ?'; -- condition not defined
        
SET @querry = 'San Diego'; -- this will act as condition

EXECUTE op USING @querry; -- execute the querry using the condition

DEALLOCATE PREPARE op; -- deallocate the prepared statement

-- EXECUTE op USING @querry; -- this will now throw an error cause the statement was deallocated

CREATE TABLE EMPLOYEE (
  empId INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  jobtitle TEXT NULL, -- this column can be NULL
  salary int unsigned,
  yearlyBonus int unsigned
);

-- insert
INSERT INTO EMPLOYEE VALUES (0001, 'Clark', 'Sales', 1200, 300);
INSERT INTO EMPLOYEE VALUES (0002, 'Dave', 'Accounting', 1000, 200);
INSERT INTO EMPLOYEE VALUES (0003, 'Ava', 'Sales', 1500, 250);
INSERT INTO EMPLOYEE VALUES (0004, 'Alan', 'Sales', 1400, 280);
INSERT INTO EMPLOYEE VALUES (0005, 'Bob', 'Sales', 1600, 300);
INSERT INTO EMPLOYEE VALUES (0007, 'Mercer', 'Supervisor', 1100, 230);
INSERT INTO EMPLOYEE VALUES (0008, 'Carl', 'Manager', 1500, 270);
INSERT INTO EMPLOYEE VALUES (0009, 'Ronnie', 'Intern', 1000, 210);
INSERT INTO EMPLOYEE VALUES (0010, 'Charlie', 'Deputy', 1100, 140);


Select "Using transaction and commit: " as "";

-- 1. Start a new transaction  
START TRANSACTION; 

/*A transaction in MySQL is a sequential group of statements, queries, or operations 
such as select, insert, update or delete to perform as a one single work unit that 
can be committed or rolled back.*/

-- 2. Get the highest income  
SELECT @salary:= MAX(salary) FROM EMPLOYEE;  

SAVEPOINT safePoint; -- savepoint is a point that can be used for rollbacks

-- 3. Insert a new record into the employee table  
INSERT INTO EMPLOYEE(empId, name, jobtitle, salary, yearlyBonus)   
VALUES (11, 'Alexander', 'Sales', 2200, 200);  

Select "Employee table AFTER INSERT: " as "";

Select * from EMPLOYEE;

-- rollbacks can only be used before commit
ROLLBACK to SAVEPOINT safePoint;  

Select "Employee table AFTER ROLLBACK: " as "";

COMMIT;  /* A COMMIT means that the changes made in the current transaction 
are made permanent and become visible to other sessions
*/

Select * from EMPLOYEE;