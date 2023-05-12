# This comment continues to the end of line
-- This comment continues to the end of line
/* this is an in-line comment */


-- create

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
)  ENGINE=INNODB;

DELIMITER $$
CREATE PROCEDURE load_book_data(IN num INT(4))
BEGIN
	DECLARE counter INT(4) DEFAULT 0;
	DECLARE book_title VARCHAR(255) DEFAULT '';

	WHILE counter < num DO -- looping
	  SET book_title = CONCAT('Book title #',counter); -- create a book title
	  SET counter = counter + 1; -- increase counter

	  INSERT INTO books(title) VALUES(book_title);  -- insert book into table
	END WHILE;
END$$

DELIMITER ;

CALL load_book_data(100); -- calling procedure that creates a table

select "Table BEFORE truncation: " as "";
SELECT * FROM books;

TRUNCATE TABLE books;

select "Table AFTER truncation: " as "";
SELECT * FROM books;