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

/*
select "MINUS between empId in table1 and table2 - removes all elements from table1 that are present in table2: " as ''; 
--grab all names in both tables - without duplicates
SELECT empId FROM EMPLOYEE_DB_ONE
MINUS
SELECT empId from EMPLOYEE_DB_TWO;
*/

select "Table1 after ignore insert: " as '';
/* if you use the INSERT IGNORE statement, the rows with invalid data that cause the error are ignored and the rows 
with valid data are inserted into the table.*/
INSERT IGNORE INTO EMPLOYEE_DB_ONE(empId, name) values (15, "Kelly");
INSERT IGNORE INTO EMPLOYEE_DB_ONE(empId, name) values (15, "Ella"); -- this should be ignored by the statement because it generates an error caused by reusing same value for empId
select * from EMPLOYEE_DB_ONE;

CREATE TABLE subscribers (
    id INT PRIMARY KEY AUTO_INCREMENT, -- auto increments the identifier of the row
    email VARCHAR(50) NOT NULL UNIQUE /*ensures that the entries in this column are unique else throws an error*/
);

INSERT INTO subscribers(email)
VALUES('john.doe@gmail.com');
--    ('john.doe@gmail.com'); -- this will throw and error cause the value is already somewhere in this column
      
select "Subscribers table: " as '';    
select * from subscribers;


update ignore subscribers
set email = "update_ignore_email@mail.com"
where id = 1;

select "Subscribers table after update ignore: " as '';    
select * from subscribers;


update LOW_PRIORITY subscribers
set email = "update_low_priority_email@mail.com"
where id = 1;

select "Subscribers table after update LOW_PRIORITY: " as '';    
select * from subscribers; 