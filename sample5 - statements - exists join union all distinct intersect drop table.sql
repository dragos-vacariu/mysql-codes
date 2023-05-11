# This comment continues to the end of line
-- This comment continues to the end of line
/* this is an in-line comment */


-- create
CREATE TABLE EMPLOYEE_DB_ONE (
  empId INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  jobtitle TEXT NULL, -- this column can be NULL
  salary int unsigned,
  yearlyBonus int unsigned
);

-- insert
INSERT INTO EMPLOYEE_DB_ONE VALUES (0001, 'Clark', 'Sales', 1200, 300);
INSERT INTO EMPLOYEE_DB_ONE VALUES (0002, 'Dave', 'Accounting', 1000, 200);
INSERT INTO EMPLOYEE_DB_ONE VALUES (0003, 'Ava', 'Sales', 1500, 250);
INSERT INTO EMPLOYEE_DB_ONE VALUES (0004, 'Alan', 'Sales', 1400, 280);
INSERT INTO EMPLOYEE_DB_ONE VALUES (0005, 'Bob', 'Sales', 1600, 300);
INSERT INTO EMPLOYEE_DB_ONE VALUES (0007, 'Mercer', 'Supervisor', 1100, 230);
INSERT INTO EMPLOYEE_DB_ONE VALUES (0008, 'Carl', 'Manager', 1500, 270);
INSERT INTO EMPLOYEE_DB_ONE VALUES (0009, 'Ronnie', 'Intern', 1000, 210);
INSERT INTO EMPLOYEE_DB_ONE VALUES (0010, 'Charlie', 'Deputy', 1100, 140);
INSERT INTO EMPLOYEE_DB_ONE VALUES (012, 'A%_**a', NULL, 1000, 100);
INSERT INTO EMPLOYEE_DB_ONE VALUES (011, 'Zlatan', NULL, 1000, 100);
INSERT INTO EMPLOYEE_DB_ONE VALUES (1012, 'Eric', NULL, 1000, 100);

CREATE TABLE EMPLOYEE_DB_TWO (
  empId INTEGER PRIMARY KEY,
  full_name TEXT NOT NULL,
  jobPos TEXT NULL, -- this column can be NULL
  salary int unsigned
);

INSERT INTO EMPLOYEE_DB_TWO VALUES (1, 'Alex', 'Banker', 2000);
INSERT INTO EMPLOYEE_DB_TWO VALUES (2, 'Avril', 'Banker', 2200);
INSERT INTO EMPLOYEE_DB_TWO VALUES (3, 'Dave', 'Banker', 2400);
INSERT INTO EMPLOYEE_DB_TWO VALUES (4, 'Leo', 'Banker', 2500);
INSERT INTO EMPLOYEE_DB_TWO VALUES (5, 'Ricky', 'Banker', 2100);

select "Table1 after deletion of NULL jobtitle elements : " as ''; 

DELETE FROM EMPLOYEE_DB_ONE -- delete from TABLE
WHERE jobtitle is NULL;   -- elements matching criteria

select * from EMPLOYEE_DB_ONE;
select "Table2: " as ''; 
select * from EMPLOYEE_DB_TWO;


select "Tables after using exists on empId for table1 and table2 : " as ''; 

SELECT * -- select all elements
FROM
    EMPLOYEE_DB_ONE
WHERE
  EXISTS( -- if exists an element matching this criteria
	SELECT *
        FROM
            EMPLOYEE_DB_TWO
        WHERE
            EMPLOYEE_DB_TWO.empId = EMPLOYEE_DB_ONE.empId
	);

/*Removing a table: */
DROP TABLE IF EXISTS EMPLOYEE_DB_THREE; -- this will remove the table if it exists

select "UNION between names in table1 and table2 - without duplicates: " as ''; 

/*grab all names in both tables - without duplicates*/
SELECT name FROM EMPLOYEE_DB_ONE
UNION
SELECT full_name from EMPLOYEE_DB_TWO;

select "JOIN names between table1 and table2 : " as ''; 

/*grab names in both tables where name in table1 = name from table2*/
SELECT name FROM EMPLOYEE_DB_ONE
JOIN EMPLOYEE_DB_TWO on EMPLOYEE_DB_ONE.name = EMPLOYEE_DB_TWO.full_name;

select "UNION ALL between names in table1 and table2 - with duplicates: " as ''; 
/*grab all names in both tables - without duplicates*/
SELECT name FROM EMPLOYEE_DB_ONE
UNION ALL
SELECT full_name from EMPLOYEE_DB_TWO;

select "UNION DISTINCT between names in table1 and table2 - only DISTINCT / without duplicates: " as ''; 
/*grab all names in both tables - without duplicates*/
SELECT name FROM EMPLOYEE_DB_ONE
UNION DISTINCT
SELECT full_name from EMPLOYEE_DB_TWO;

/* -- intersect might not be supported
select "INTERSECT between names in table1 and table2" as ''; 

SELECT empId FROM EMPLOYEE_DB_ONE
INTERSECT
SELECT empId FROM EMPLOYEE_DB_TWO; */