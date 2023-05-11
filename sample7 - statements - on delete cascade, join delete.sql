# This comment continues to the end of line
-- This comment continues to the end of line
/* this is an in-line comment */


-- create
CREATE TABLE buildings (
    building_no INT PRIMARY KEY AUTO_INCREMENT,
    building_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE rooms (
    room_no INT PRIMARY KEY AUTO_INCREMENT,
    room_name VARCHAR(255) NOT NULL,
    building_no INT NOT NULL,
    FOREIGN KEY (building_no)
        -- this will ensure that once a building is deleted the rooms associated to it will also be deleted
        REFERENCES buildings (building_no)
        ON DELETE CASCADE 
);

INSERT INTO buildings(building_name,address)
VALUES('ACME Headquaters','3950 North 1st Street CA 95134'),
      ('ACME Sales','5000 North 1st Street CA 95134');

select "Buildings table: " as "" ;
SELECT * FROM buildings;

INSERT INTO rooms(room_name,building_no)
VALUES('Amazon',1),
      ('War Room',1),
      ('Office of CEO',1),
      ('Marketing',2),
      ('Showroom',2);

select "Rooms table: " as "" ;   
SELECT * FROM rooms;

DELETE FROM buildings -- deleting a building will result in also deleting all rooms associated to it
WHERE building_no = 2;

select "Buildings table: " as "" ;
SELECT * FROM buildings;

select "Rooms table: " as "" ;   
SELECT * FROM rooms;




DROP TABLE IF EXISTS t1, t2;

CREATE TABLE t1 (
    id VARCHAR(20) PRIMARY KEY
);

CREATE TABLE t2 (
    id VARCHAR(20) PRIMARY KEY,
    ref INT NOT NULL
);

INSERT INTO t1 VALUES ('A'),('B'),('C');

INSERT INTO t2(id,ref) VALUES('A',1),('B',2),('C',3);

select "t1 table: " as "" ;   
SELECT * FROM t1;

select "t2 table: " as "" ;   
SELECT * FROM t2;

DELETE t1, t2
FROM t1
INNER JOIN t2 ON t1.id = t2.id
WHERE t1.id='A';

select "t1 table after join delete: " as "" ;   
SELECT * FROM t1;

select "t2 table after join delete: " as "" ;   
SELECT * FROM t2;