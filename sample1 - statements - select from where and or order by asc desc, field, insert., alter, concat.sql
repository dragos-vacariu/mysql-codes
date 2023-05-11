# This comment continues to the end of line
-- This comment continues to the end of line
/* this is an in-line comment */


-- create
CREATE TABLE EMPLOYEE (
  empId INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  jobtitle TEXT NOT NULL
);

-- insert
INSERT INTO EMPLOYEE VALUES (0001, 'Clark', 'Sales');
INSERT INTO EMPLOYEE VALUES (0002, 'Dave', 'Accounting');
INSERT INTO EMPLOYEE VALUES (0003, 'Ava', 'Sales');

-- fetch 
Select * FROM EMPLOYEE WHERE jobtitle = 'Sales'; 

/* When executing the SELECT statement,
 MySQL evaluates the FROM clause before the SELECT clause:
 MySQL is case-insensitive (statements can be written both uppercase and lowercase:
 Select or select or select) */

\! echo 'some text' #print some text at the beginning.

select ""; -- print 2 newlines
Select name from EMPLOYEE where name = "Clark";

select "" as ''; -- print 1 newline
select name, jobtitle from EMPLOYEE;

SELECT "Current date and time." as '';
select NOW();

/*The NOW() function returns the current date & time of the server on which MySQL runs.
The NOW() function doesn’t have any parameters. To call it, you place the parentheses () 
after the function name.*/

SELECT CONCAT('John',' ','Doe');

/*
If a function has parameters, you need to pass arguments into it. For example, 
concatenate strings into one string, you can use the CONCAT() function.
*/


/*---------------------------------------------------------------------*/


/*By default, MySQL uses the expression specified in the SELECT clause as the column 
name of the result set. To change a column name of the result set, you can use a 
column alias:*/

SELECT "Selecting expression column_alias: " as '' ;
SELECT CONCAT('John',' ','Doe') AS name;

/*If the column alias contains spaces, you need to place it inside quotes like this:*/

Select "Selecting expression column_alias with spaces: " as '';
SELECT CONCAT('Jane',' ','Doe') AS 'Full name';



# MySQL ORDER BY
select "Order by name - asc" as '';
Select * from EMPLOYEE order by name asc; 

select "Order by name - default - asc added by the compiler." as '';
Select * from EMPLOYEE order by name; 

select "Order by name - desc" as ''; -- print newline
Select * from EMPLOYEE order by name desc;

/*
When executing the SELECT statement with an ORDER BY clause, MySQL always evaluates 
the ORDER BY clause after the FROM and SELECT clauses:
*/
select "Using field: " as '';
SELECT FIELD('A', 'B', 'A', 'C', 'A');

/*The FIELD() function returns the position of the first occurrence of the str 
in the str1, str2, … list. If the str is not in the list, the FIELD() function 
returns 0 */

select "Using Field to order the table. " as ''; -- print newline
Select * from EMPLOYEE order by Field(jobtitle, 'Sales','Accounting');

select "INSERT element into table. " as ''; -- print newline
INSERT into `EMPLOYEE`(empId, name, jobtitle) VALUES ('4', 'Bob', 'Analyst');
INSERT into `EMPLOYEE`(empId, name, jobtitle) VALUES ('-1', 'Antoine', 'Manager');

select "INSERT element into table with default empId " as ''; -- print newline
ALTER TABLE EMPLOYEE ALTER empId SET DEFAULT 0;
INSERT into `EMPLOYEE`(name,jobtitle) VALUES ('Lars','Manager');

Select * from EMPLOYEE;

/*When executing a SELECT statement with a WHERE clause, MySQL evaluates 
the WHERE clause after the FROM clause and before the SELECT and ORDER BY clauses:*/

select "Display table where jobtitle = Sales OR Manager AND name contains letter 'a' " as '';

SELECT 
    empId, 
    name, 
    jobtitle
FROM
    EMPLOYEE
WHERE
    jobtitle = 'Sales' OR jobtitle = "Manager" AND name like '%a%';
ORDER BY name asc;