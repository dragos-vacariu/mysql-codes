# This comment continues to the end of line
-- This comment continues to the end of line
/* this is an in-line comment */


-- create
CREATE TABLE EMPLOYEE (
  empId INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  jobtitle TEXT NULL -- this column can be NULL
);

-- insert
INSERT INTO EMPLOYEE VALUES (0001, 'Clark', 'Sales');
INSERT INTO EMPLOYEE VALUES (0002, 'Dave', 'Accounting');
INSERT INTO EMPLOYEE VALUES (0003, 'Ava', 'Sales');
INSERT INTO EMPLOYEE VALUES (0004, 'Alan', 'Sales');
INSERT INTO EMPLOYEE VALUES (0005, 'Bob', 'Sales');
INSERT INTO EMPLOYEE VALUES (0007, 'Mercer', 'Supervisor');
INSERT INTO EMPLOYEE VALUES (0008, 'Carl', 'Manager');
INSERT INTO EMPLOYEE VALUES (0009, 'Ronnie', 'Intern');
INSERT INTO EMPLOYEE VALUES (0010, 'Charlie', 'Deputy');

-- fetch 
Select * FROM EMPLOYEE;
select "" as '';

select "All employees where jobtitle = Sales and names starts with 'a'." as '';
SELECT 
    empId, 
    name, 
    jobtitle
FROM
    EMPLOYEE
WHERE
    jobtitle = 'Sales' AND name like 'a%'
ORDER BY empId asc;

/*To check if a value is NULL or not, you use the IS NULL operator, not the equal 
operator (=). The IS NULL operator returns TRUE if a value is NULL.*/

INSERT INTO EMPLOYEE VALUES (011, 'Zlatan', NULL);
INSERT INTO EMPLOYEE VALUES (1012, 'Eric', NULL);

select "Employees where jobtitle IS NULL" as '' ;
Select * FROM EMPLOYEE where jobtitle IS NULL;

select "Employees where empId <= 8" as '' ;
Select * FROM EMPLOYEE where empId <= 8;

select "Select distinct values from jobtitle column within EMPLOYEE table:" as '' ;
SELECT DISTINCT jobtitle FROM EMPLOYEE;

select "Select distinct values from jobtitle column within EMPLOYEE table where value does not contain 'a':" as '' ;
SELECT DISTINCT jobtitle FROM EMPLOYEE where jobtitle not like "%a%";

select "Employees where empId between 4 and 8" as '' ;
Select * FROM EMPLOYEE where empId between 4 and 8;

select "Using CAST." as '' ;
select CAST('2003-01-01' AS DATE);
select CAST(20 AS UNSIGNED);
select CAST(-2 AS SIGNED);

select "Employees where name starts with 'A' and ends with 'a':" as '' ;
Select * FROM EMPLOYEE where name like "A_a";

select "Employees where name starts with 'A' and ends with 'a':" as '' ;
Select * FROM EMPLOYEE where name like "A%a";

select "Employees where name starts with 'A' and contains 'a':" as '' ;
Select * FROM EMPLOYEE where name like "A%a%";

select "Employees where name starts with 'A', contains 'a' and ends with 'a':" as '' ;
Select * FROM EMPLOYEE where name like "A%a%a";

/*If you don’t specify the escape character explicitly, the backslash character (\) 
is the default escape character.*/
INSERT INTO EMPLOYEE VALUES (012, 'A%_**a', NULL);
select "Employees where name contains '%_*' using ESCAPE character:" as '' ;
Select * FROM EMPLOYEE where name like "%\%_*%"; 
-- /% will treat % as a regular string character and not part of the regular expression

select "Employee table limited between offset(3) and count 4 rows." as '' ;
Select * FROM EMPLOYEE limit 3, 4; 
-- 3 is the offset, the row after which the counting starts
-- 4 is the number of counts withing the table
/*Counting starts after row 3 (meaning from row 4)*/

select "Employee table limited to row 5." as '' ;
Select * FROM EMPLOYEE limit 5; 
/*Counting starts with row 0 since no offset is specified.*/
