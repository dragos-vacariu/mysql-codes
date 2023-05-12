# This comment continues to the end of line
-- This comment continues to the end of line
/* this is an in-line comment */


-- create

CREATE TABLE employees (
    id int AUTO_INCREMENT primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    department_id int not null
);


INSERT INTO employees(first_name,last_name,department_id) 
VALUES('John','Doe',1),
		('Bush','Lily',2),
		('David','Dave',3),
		('Mary','Jane',4),
		('Jonatha','Josh',5),
		('Mateo','More',1);

SELECT database(); -- selecting database

Select "Table before add column: " as "";
select * from employees;
alter table employees add column city varchar(50) after last_name;

Select "Table after add column: " as "";
select * from employees;

-- Temporary tables



/*
A MySQL temporary table has the following specialized features:

A temporary table is created by using CREATE TEMPORARY TABLE statement. Notice that the keyword TEMPORARY is added between the CREATE and TABLE keywords.
MySQL removes the temporary table automatically when the session ends or the connection is terminated. Of course, you can use the  DROP TABLE statement to remove a temporary table explicitly when you are no longer use it.
A temporary table is only available and accessible to the client that creates it. Different clients can create temporary tables with the same name without causing errors because only the client that creates the temporary table can see it. However, in the same session, two temporary tables cannot share the same name.
A temporary table can have the same name as a normal table in a database. For example, if you create a temporary table named employees in the sample database, the existing employees table becomes inaccessible. Every query you issue against the employees table is now referring to the temporary table employees. When you drop the employees temporary table, the permanent employees table is available and accessible.
*/

CREATE temporary TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100)
);

INSERT INTO departments(dept_name)
VALUES('Sales'),('Markting'),('Finance'),('Accounting'),('Warehouses'),('Production');

Select "Table departments: " as "";
select* from departments;

DROP TEMPORARY TABLE departments; -- dropping temporary table
-- select* from departments; -- this will cause an error cause departments table no longer exists


-- Procedures

DELIMITER //
CREATE PROCEDURE check_table_exists(table_name VARCHAR(100)) 
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @err = 1;
    SET @err = 0;
    SET @table_name = table_name;
    SET @sql_query = CONCAT('SELECT 1 FROM ',@table_name);
    PREPARE stmt1 FROM @sql_query;
    IF (@err = 1) THEN
        SET @table_exists = 0;
    ELSE
        SET @table_exists = 1;
        DEALLOCATE PREPARE stmt1;
        
    END IF;
END //
DELIMITER ;

Select "Check if departments exists: " as "";
CALL check_table_exists('departments');
SELECT @table_exists;