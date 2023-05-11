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

-- fetch 
Select * FROM EMPLOYEE_DB_ONE;
select "" as '';

select "All employees where jobtitle = Sales and names starts with 'a'." as '';
SELECT 
    empId, 
    name, 
    jobtitle
FROM
    EMPLOYEE_DB_ONE
WHERE
    jobtitle = 'Sales' AND name like 'a%'
ORDER BY empId asc;

select "Create a table definition with multiple elements : " as '';


CREATE TABLE IF NOT EXISTS projects (
    id INT AUTO_INCREMENT, -- auto increment the id column
    title VARCHAR(255), -- maximum length of title is 255 characters
    begin_date DATE NOT NULL,
    complete_date DATE NOT NULL,
    PRIMARY KEY(id) -- primary key is a column that accepts unique values for each row.
);

INSERT INTO projects(title,begin_date, complete_date)
VALUES('New CRM', CAST('2020-01-01' as DATE), CAST('2030-01-02' as DATE)),
      ('ERP Future',CAST('2020-01-01' as DATE) ,CAST('2030-01-03' as DATE)),
      ('VR', CAST('2020-01-01' as DATE), CAST('2030-01-01' as DATE));

select * from projects;

select "Using CONCAT_WS() : " as '';

SELECT 
    CONCAT_WS(', ', name, jobtitle)
FROM
    EMPLOYEE_DB_ONE;

select "Joining 2 identical columns from 2 different tables : " as '';    
    
SELECT *
FROM	EMPLOYEE_DB_ONE 
INNER JOIN EMPLOYEE_DB_TWO 
ON EMPLOYEE_DB_ONE.empId = EMPLOYEE_DB_TWO.empId; -- joining 2 columns with same name and content


select "Summing up salaries group and filter results : " as ''; 

SELECT
    empId ,
    name,
    jobtitle,
    SUM(salary*12 + yearlyBonus) yearlyIncome -- calculate yearly income
FROM	EMPLOYEE_DB_ONE
GROUP BY
	empId -- group results by empId 
HAVING
	yearlyIncome > 12000; -- show only results for which the calculated yearlyIncome > 12000

