CREATE TABLE BOOK(
       ISBN CHAR(13),
	   title VARCHAR2(20),
	   author VARCHAR2(20),
	   price NUMBER,
	   pubyear NUMBER,
	   constraint BOOK_PK PRIMARY KEY (ISBN),
	   constraint BOOK_PRICE CHECK (price >= 0)
	   );
	   
	   INSERT INTO BOOK VALUES ('100-1-967-677', '400 Days', 'C. Bhaghat', 400.00,2022);
	   INSERT INTO BOOK VALUES ('200-1-546-258', 'harry potter', 'Rowlings', 600.00, 1969);
	   
CREATE TABLE AUTHOR(
       author_id NUMBER,
	   name VARCHAR2(20),
	   dob DATE,
	   nationality VARCHAR2(20),
	   CONSTRAINT AUTHOR_ID PRIMARY KEY (author_id)
);

INSERT INTO AUTHOR VALUES (1001,'C. Bhaghat','22-april-1974','Indian');
INSERT INTO AUTHOR VALUES (1002,'Rowlings','31-july-1965','Brithish');


-- adding a new atribute 'AUTHOR_ID' in a BOOK relation

ALTER TABLE BOOk ADD AUTHOR_ID NUMBER;

--droping an existing atribute 'AUTHOR' from bOOK relation
ALTER TABLE BOOK DROP COLUMN author;

--modifying an existing atribute 

ALTER TABLE BOOK MODIFY pubyear DATE;
--to modyfy this pubyear is needed to NULL... like,
UPDATE BOOK
SET pubyear= NULL
WHERE ISBN = '200-1-546-258';

--or to null the date
UPDATE BOOK
SET pubyear=NULL;

--renaming an existing attribute
ALTER TABLE BOOK RENAME COLUMN title TO book_title;

--update pubyear
UPDATE BOOK
SET pubyear='01-jan-2000'
WHERE ISBN='100-1-967-677';

UPDATE BOOK
SET pubyear='02-feb-2012'
WHERE ISBN='200-1-546-258';

UPDATE BOOK
SET author_id=565856
WHERE ISBN='100-1-967-677';

UPDATE BOOK
SET author_id=658429
WHERE ISBN='200-1-546-258';

--ading a ew constraints in an existing TABLE
ALTER TABLE BOOK ADD CONSTRAINT BOOK_FK FOREIGN KEY(ATHOUR_ID) REFERENCES AUTHOR;


CREATE TABLE BOOK(
       ISBN CHAR(13),
	   book_title VARCHAR2(20),
	   author_id NUMBER,
	   price NUMBER,
	   pubyear DATE,
	   constraint BOOK_PK PRIMARY KEY (ISBN),
	   constraint BOOK_PRICE CHECK (price >= 0)
	   constraint BOOK_FK FOREIGN KEY (author_id) REFERENCES AUTHOR
	   );
	   
	   --find book title and their price
	   SELECT book_title,price
	   FROM BOOK;
	   
	   --find book title ,author_id and price of those books which have price higher than 500
	   SELECT book_title,author_id,price
	   FROM BOOK
	   WHERE price>500;
	   
	   
	   --find book title ,author_id and price of those books which have price in between 500 and 1000
	   --both bounds are inclusive.
	   SELECT book_title,author_id,price
	   FROM bOOK
	   WHERE price>=500 AND price<= 1000; 
	   --or
	   WHERE price BETWEEN 500 AND 1000;
	   
	   --cartasian product without join condition
	   SELECT *
	   FROM BOOK, AUTHOR
	   
	   --cartasian product with join condition
	   SELECT*
	   FROM BOOK,AUTHOR
	   WHERE BOOK.author_id= AUTHOR.author_id;
	 
	   --multi-table queries
	   --find book_title,author  name and their price
	   
	   SELECT*
	   FROM BOOK B, AUTHOR A
	   WHERE B.author_id=A.author_id;
	   
	   
	   
	   