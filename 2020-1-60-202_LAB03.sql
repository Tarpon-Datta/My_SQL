-- Lab Assignment 03
-- Student ID: 2020-1-60-202
-- Student Name: Tarpon Datta


--LAB TASK 01
----------------
select BRANCH_NAME, BRANCH_CITY 
from Branch 
where ASSETS>1000000;

--LAB TASK 02
---------------
select ACCOUNT_NUMBER,BALANCE 
from account 
where BALANCE>600 AND BALANCE<750 OR BRANCH_NAME='Downtown';

--LAB TASK 03
---------------
select account_number 
from account a, branch b 
where a.branch_name = b.branch_name and branch_city = 'Rye';

--OR
select account_number 
from account natural join branch  
where branch_city = 'Rye';

--LAB TASK 04
---------------
select DISTINCT loan_number
from customer NATURAL JOIN loan 
where AMOUNT>=1000 AND CUSTOMER_CITY='Harrison';

--LAB TASK 05
---------------
select * 
from account ORDER BY balance DESC;

--LAB TASK 06
---------------
select * 
from customer ORDER BY CUSTOMER_CITY;

--LAB TASK 07
---------------
select CUSTOMER_NAME 
from borrower INTERSECT select CUSTOMER_NAME from depositor;

--LAB TASK 08
---------------
select * 
from borrower UNION select * from depositor;

--LAB TASK 09
----------------
select CUSTOMER_NAME,CUSTOMER_CITY 
from(CUSTOMER NATURAL JOIN BORROWER) MINUS select CUSTOMER_NAME,CUSTOMER_CITY 
from (customer NATURAL JOIN depositor);

--LAB TASK 10
---------------
select sum(ASSETS) 
from branch;

--LAB TASK 11
---------------
select ACCOUNT_NUMBER,avg(BALANCE) 
from account GROUP BY ACCOUNT_NUMBER;

--LAB TASK 12
---------------
select BRANCH_CITY ,avg(BALANCE) 
from account NATURAL JOIN branch GROUP BY BRANCH_CITY;

--LAB TASK 13
---------------
select BRANCH_NAME ,min(AMOUNT) 
from loan GROUP BY BRANCH_NAME;

--LAB TASK 14
---------------
select BRANCH_NAME ,sum(AMOUNT) 
from loan GROUP BY BRANCH_NAME;

--LAB TASK 15
---------------
select DISTINCT CUSTOMER_NAME,ACCOUNT_NUMBER,max(balance) 
from depositor NATURAL JOIN account GROUP BY ACCOUNT_NUMBER,CUSTOMER_NAME;