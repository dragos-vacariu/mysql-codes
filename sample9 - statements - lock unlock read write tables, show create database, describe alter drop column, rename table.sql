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

/*
A READ lock has the following features:

A READ lock for a table can be acquired by multiple sessions at the same time. In addition, other sessions can read data from the table without acquiring the lock.
The session that holds the READ lock can only read data from the table, but cannot write. And other sessions cannot write data to the table until the READ lock is released. The write operations from another session will be put into the waiting states until the READ lock is released.
If the session is terminated, either normally or abnormally, MySQL will release all the locks implicitly. This feature is also relevant for the WRITE lock.
*/

LOCK TABLE cities READ;

-- INSERT INTO cities values(4,'Las Vegas',445500); -- this will generate an error as the table was locked to read-only.

UNLOCK TABLE; -- this will unlock the tables
INSERT INTO cities values(4,'Las Vegas',445500);

SELECT "Table cities after lock read - unlock: " as "";
SELECT * FROM cities;

SELECT "Table cities after lock write: " as "";
LOCK TABLES cities WRITE;
INSERT INTO cities values(5,'Chicago',475500);
SELECT * FROM cities;

/*
A WRITE lock has the following features:

The only session that holds the lock of a table can read and write data from the table.
Other sessions cannot read data from and write data to the table until the WRITE lock is released.
*/


-- CREATE DATABASE IF NOT EXISTS database_name; -- used to create a database
SELECT "Show databases: " as "";
show databases; -- show all databases


SELECT "Table cities after dropping column: " as "";
ALTER TABLE cities drop population;
SELECT * FROM cities;

SELECT "Describe table : " as "";
DESCRIBE cities; -- describes the table cities

rename table cities to my_table;
SELECT "Table cities after renaming: " as "";
SELECT * FROM my_table;