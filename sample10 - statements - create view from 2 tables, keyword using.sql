# This comment continues to the end of line
-- This comment continues to the end of line
/* this is an in-line comment */


-- create

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE employees (
    id int AUTO_INCREMENT primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    department_id int not null,
    FOREIGN KEY (department_id)
        REFERENCES departments (department_id)
);

INSERT INTO departments(dept_name)
VALUES('Sales'),('Markting'),('Finance'),('Accounting'),('Warehouses'),('Production');

INSERT INTO employees(first_name,last_name,department_id) 
VALUES('John','Doe',1),
		('Bush','Lily',2),
		('David','Dave',3),
		('Mary','Jane',4),
		('Jonatha','Josh',5),
		('Mateo','More',1);

CREATE VIEW v_employee_info as
    SELECT 
        id, first_name, last_name, dept_name
    from
        employees
            inner join
        departments USING (department_id); -- Companies USING department_id will replace department_id with value taken from departments

Select "Select table view: "as "" ;

SELECT * FROM v_employee_info;

Select "Check table: "as "" ;
CHECK TABLE view_employee_info;
