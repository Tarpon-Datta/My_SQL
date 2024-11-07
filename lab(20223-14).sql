--Nested Subqueries
-- What is nested subquery?
--ans: A query within another query is known as a nested subquery.

--Example:

-- SELECT...
-- FROM.....
-- WHERE....  (SELECT.....
--             FROM.......
--             WHERE......);

-- The SELECT .... FROM.... WHERE.... Apears outside the brackets
-- is known as OUTER query.

-- The SELECT .... FROM.... WHERE.... Apears inside the brackets
-- is known as INNER query or nested subquery.

-- Nested subqueries can be broadly classfied into three types
-- 1. Nested subquery within WHERE clause 
-- 2.Nested subquery within FROM clause
-- 3.Nested subquery within SELECT caluse

--1. Nested subquery within WHERE clause
---- SELECT...
-- FROM.....
-- WHERE....  (SELECT.....
--             FROM.......
--             WHERE......);

--IN/NOT IN, ALL/SOME, EXISTS/NOT EXISTS

-- Usage of IN/NOT IN
-- They are used to identified the set membership.
-- In keyword returns True if the value in the outer relation is also
-- present in the set of values of the inner relation/ relation returned
-- by the subquery.

--  Alice IN {Bob, Charlie, David}--> FALSE
-- Bob IN {Bob, Charlie, David}-> TRUE

-- NOT IN is completely opposite of IN


--FInd course ids that were offered in both Fall 2009 and in Spring 2010.
SELECT course_id
FROM SECTION
WHERE semester= 'Fall' and year = 2009
INTERSECT
SELECT course_id
FROM SECTION
WHERE semester='Spring' and year='2010';


desc SECTION  


SELECT*
FROM SECTION;

--using IN
SELECT course_id
FROM SECTION
WHERE semester ='Fall' and year=2009
      and course_id IN (SELECT course_id
                        FROM SECTION
                        WHERE semester ='Spring' and year=2010);
						


Fall 2009
-----------
CS-101
CS-347
PHY-101	

Spring 2010
------------
CS-101
CS-315
CS-319
CS-319
FIN-201
HIS-351
MU-199					

--Find course ids that were offered in fall 2009 but not in spring 2010.
SELECT course_id
FROM SECTION
WHERE semester ='Fall' and year=2009
      and course_id NOT IN (SELECT course_id
                        FROM SECTION
                        WHERE semester ='Spring' and year=2010);
						

--Find instructor name who taught courses offered in fall 2009 but not in spring 2010.
SELECT name
FROM  instructor natural join teaches
WHERE semester='Fall' and year='2009'
	  AND id NOT IN (SELECT id
						FROM teaches
						WHERE semester ='Spring' and year='2010');
						



--Find instructor name who taught courses offered in fall 2009 and also in Spring 2010.
SELECT name
FROM  instructor natural join teaches
WHERE semester='Fall' and year='2009'
	  AND id IN (SELECT id
						FROM teaches
						WHERE semester ='Spring' and year='2010');
						
--To remove duplicate we use DISTINC 
SELECT DISTINCT name
FROM  instructor natural join teaches
WHERE semester='Fall' and year='2009'
	  AND id IN (SELECT id
						FROM teaches
						WHERE semester ='Spring' and year='2010');	


--Usage of ALL/SOME
--These keywords are used to comapre a value agaisnt a set of values.
-- 10>ALL (9,10,11) --> False 
-- 10>SOME (9,10,11)-->	TRUE

--Find instructor name and salary who gets more than the salary of all 
--instructor of history department

SELECT name,salary
FROM instructor
WHERE salary > ALL ( SELECT salary
                     FROM instructor
					 WHERE dept_name = 'History');
					
					
--Find instructor name and salary who gets more than the salary of some
--instructor of history department					
SELECT name,salary
FROM instructor
WHERE salary > SOME ( SELECT salary
                     FROM instructor
					 WHERE dept_name = 'History');
					 
--Find the instructor name who get the highest salary.
SELECT name,salary
FROM instructor
WHERE salary >= ALL(SELECT salary
					FROM instructor);

SELECT name ,salary
FROM instructor
WHERE salary= (SELECT max(salary) FROM instructor);


SELECT name, salary
FROM (SELECT max(salary) as MAX_sal FROM instructor) temp, instructor
WHERE instructor.salary= temp.MAX_sal;
					
--Find instructor name and salary who gets more than the average salary of all instructors.
SELECT name, salary
FROM (SELECT AVG(salary) as avg_sal FROM instructor) temp, instructor
WHERE instructor.salary > temp.avg_sal;	

--EXISTS / NOT EXITS

-- THese keywords are used for the set cardiality (number of tuples).
--EXISTS returns TRUE if the inner relation/relation the by the subquery is empty.

--NOT EXISTS returns TRUE  if the inner relation/relation returned by the subquery is empty.

--corelation condition: this is condition that relates a tuples from outer realtion with 
--the tuples of inner relation

--
--Find course ids that were offered in fall 2009 but not in spring 2010.
--INTERSECT, IN, EXISTS
select course_id
from section r
where semester = 'fall' and year = '2009'
     and exists (select course_id 
		     from section s
		     where semester ='spring' and year='2010'
                 and r.course_id =s.course_id);	

--MINUS, NOT IN, NOT EXISTS
--Subqueries wihtin FROM clause
--Find the department name and number of instrucotors with at least two instructors.
SELECT*
FROM(SELECT dept_name, counts(*) AS num_of_inst
     FROM instructor 
     GROUP BY dept_name) temp 
WHERE num_of_inst >= 2;	 

				
croc				 
					   