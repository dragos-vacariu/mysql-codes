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
INSERT INTO EMPLOYEE_DB_TWO VALUES (3, 'Mickey', 'Banker', 2400);
INSERT INTO EMPLOYEE_DB_TWO VALUES (4, 'Leo', 'Banker', 2500);
INSERT INTO EMPLOYEE_DB_TWO VALUES (5, 'Ricky', 'Banker', 2100);

select "Table1 after deletion of NULL jobtitle elements : " as ''; 

DELETE FROM EMPLOYEE_DB_ONE -- delete from TABLE
WHERE jobtitle is NULL;   -- elements matching criteria

select * from EMPLOYEE_DB_ONE;
select "Table2: " as ''; 
select * from EMPLOYEE_DB_TWO;

/*
Joins  – give you an overview of joins supported in MySQL including inner join, left join, and right join.
INNER JOIN – query rows from a table that has matching rows in another table.
LEFT JOIN – return all rows from the left table and matching rows from the right table or null if no matching rows found in the right table.
RIGHT JOIN – return all rows from the right table and matching rows from the left table or null if no matching rows found in the left table.
CROSS JOIN – make a Cartesian product of rows from multiple tables.
Self-join – join a table to itself using table alias and connect rows within the same table using inner join and left join.
*/


select "Tables after join deletion of elements where Table1.empId =1 : " as ''; 

DELETE EMPLOYEE_DB_ONE, EMPLOYEE_DB_TWO from
      EMPLOYEE_DB_ONE inner join EMPLOYEE_DB_TWO
      on EMPLOYEE_DB_ONE.empId = EMPLOYEE_DB_TWO.empId
where EMPLOYEE_DB_ONE.empId = 1;

select "Table1: " as ''; 
select * from EMPLOYEE_DB_ONE;
select "Table2: " as ''; 
select * from EMPLOYEE_DB_TWO;



select "Tables after left-join deletion of elements where Table1.empId =2 : " as ''; 

DELETE EMPLOYEE_DB_ONE, EMPLOYEE_DB_TWO from
      EMPLOYEE_DB_ONE left join EMPLOYEE_DB_TWO
      on EMPLOYEE_DB_ONE.empId = EMPLOYEE_DB_TWO.empId
where EMPLOYEE_DB_ONE.empId = 2;

select "Table1: " as ''; 
select * from EMPLOYEE_DB_ONE;
select "Table2: " as ''; 
select * from EMPLOYEE_DB_TWO;


select "Tables after right-join deletion of elements where Table1.empId =3 : " as ''; 

DELETE EMPLOYEE_DB_ONE, EMPLOYEE_DB_TWO from
      EMPLOYEE_DB_ONE right join EMPLOYEE_DB_TWO
      on EMPLOYEE_DB_ONE.empId = EMPLOYEE_DB_TWO.empId
where EMPLOYEE_DB_ONE.empId = 3;

select "Table1: " as ''; 
select * from EMPLOYEE_DB_ONE;
select "Table2: " as ''; 
select * from EMPLOYEE_DB_TWO;


select "Tables after cross-join deletion of elements where Table1.empId =4 : " as ''; 

DELETE EMPLOYEE_DB_ONE, EMPLOYEE_DB_TWO from
      EMPLOYEE_DB_ONE right join EMPLOYEE_DB_TWO
      on EMPLOYEE_DB_ONE.empId = EMPLOYEE_DB_TWO.empId
where EMPLOYEE_DB_ONE.empId = 4;

select "Table1: " as ''; 
select * from EMPLOYEE_DB_ONE;
select "Table2: " as ''; 
select * from EMPLOYEE_DB_TWO;