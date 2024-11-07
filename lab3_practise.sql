-- @ D:\SQL\banking.sql 

desc Branch

select*
from Branch;

desc Customer

select *
from Customer;

desc Account 

select*
from Account;

desc Depositor

select*
from Depositor;

desc loan

select*
from loan;

desc borrower

select*
from borrower;


--like operator 
--like operator is used for string matching
-- First .we need to understand the way of creating a string pattern
--For creating the pattern ,we have two special character(wildcards)
-- %(parcent): it can be match to any number of character from 0 to 1
--example: 'Z%' --> value starts with Z and any number of character can follow
--Zoo,Zebra

-- _(underscore): it can be match to exactly one character

--Example: 'Z__' --> value starts with Z and then followed by exactly two characters
--zoo 

-- Name starts with 'A'--> 'A%'
-- Name ends with 'Khan'--> '%khan'
-- Name has substring 'Islam'--> '%Islam%'

--value starts with 'A' and followed by exactly three character -->'A___'
--value starts with 'computer' and has exactly 12 characters in total -->'computer____'
--value has 5 character and end with 'o' --> '____o'

-- value '100%'
-- value that ends with '%'--> '%\%' ESCAPE '\'
--value that has a substring studennt_id --> '%studennt\_id%' ESCAPE '\'

--Student(id,name,dept_name,tot_cred)
--find the student id and same f those students having 'md' at the start
select id,name
from student
where name like  'Md.%';

--find customer information who have 'A' in their name as their first character
--customer(customer_name, customer_street, customer_nmae)
select *
from customer
where customer _name like 'A%';

--find customer infromation who have  'y' is their name as the last character 
select *
from customer
where customer_name like '%y';

--find the customer name with exactly five character 
select customer_name
from customer
where customer_name like '_____';

--OR
select customer_name
from customer
where LENGTH(customer_name)= 5;



   
