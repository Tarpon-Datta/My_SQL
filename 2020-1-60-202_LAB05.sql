-- Lab Assignment 05
-- Student Name: Tarpon Datta
-- Student ID: 2020-1-60-202





-- task. 1.0 (Not Using subqueries)
select customer_name,customer_street,customer_city 
        from customer natural join depositor natural join account natural join branch 
        where branch.branch_city= customer.customer_city ;

-- task 1.1 (Using subqueries)
select customer_name,customer_street,customer_city 
FROM (select customer_name,customer_street,customer_city 
        from customer natural join depositor natural join account natural join branch 
         where branch.branch_city= customer.customer_city
        );
		


-- task. 2.0 (Not Using subqueries)     
        
select customer_name,customer_street,customer_city 
        from customer natural join borrower natural join loan natural join branch 
        where branch.branch_city= customer.customer_city;		
		
-- task. 2.1 (Using subqueries)
select customer_name,customer_street,customer_city 
FROM (select customer_name,customer_street,customer_city 
        from customer natural join borrower natural join loan natural join branch 
        where branch.branch_city= customer.customer_city 
        );
        
		
 
-- task 3.0 ( not Using having word)
  SELECT b.branch_city,avg(a.balance)
FROM account a,branch b,(SELECT b.branch_city as branch_city2,avg(a.balance) as avg_bal 
		      FROM account a,branch b 
		      WHERE b.branch_name = a.branch_name group by b.branch_city) c
WHERE b.branch_name = a.branch_name and c.branch_city2=b.branch_city and c.avg_bal>1000
GROUP BY b.branch_city;

-- task. 3.1 (Using having word)
 SELECT branch_city,avg(balance)
FROM account natural join branch 
GROUP BY branch_city
HAVING avg(balance)>1000;

 
 
 --task. 4.0 (not Using having word)
SELECT b.branch_city,avg(l.amount)
FROM loan l,branch b,(SELECT b.branch_city as branch_city2,avg(l.amount) as avg_bal 
		      FROM loan l,branch b 
		      WHERE b.branch_name = l.branch_name group by b.branch_city) c
WHERE b.branch_name = l.branch_name and c.branch_city2=b.branch_city and c.avg_bal>1500
GROUP BY b.branch_city;

 -- task. 4.1 (Using having word) 
 SELECT branch_city,avg(amount)
FROM loan natural join branch 
GROUP BY branch_city
HAVING avg(amount)>1500;



 -- task. 5.0 (Not Using All keyword)  
select customer_name,customer_street,customer_city 
        from customer natural join depositor natural join account 
        where account.balance IN (select max(balance) from account );
        
-- task. 5.1 (Using All keyword) 
select customer_name,customer_street,customer_city 
        from customer natural join depositor natural join account 
        where account.balance >= ALL(select max(balance) from account);
     
	 
-- task. 6.0 (Not Using All keyword)  
 select customer_name,customer_street,customer_city 
        from customer natural join borrower natural join loan 
        where loan.amount IN (select min(amount) from loan );
        
 -- task. 6.1 (Using All keyword) 
 select customer_name,customer_street,customer_city 
        from customer natural join borrower natural join loan 
        where amount <= ALL(select amount from loan);
        
		
		
 -- task. 7.0(Using exists word)       
select DISTINCT branch_name, branch_city
    from (select * from branch natural join account) t1
    where EXISTS (select branch_name, branch_city
    from (select * from branch natural join loan) t2
    where t1.branch_name=t2.branch_name);
    
 -- task. 7.1(Using IN word) 
 select distinct branch_name,branch_city 
    from (select * from branch natural join account) t1 
    where (branch_name,branch_city) in (select branch_name,branch_city
    from (select * from branch natural join loan )t2 where t1.branch_name=t2.branch_name);
    
	
	
  -- task. 8.0(Using not exists word)
 
    select distinct customer_name,customer_city 
    from (select * from customer natural join depositor) t1 where not exists 
    (select customer_name,customer_city  from (select * from customer natural join borrower )t2
    where t1.customer_name=t2.customer_name) ;
  
  -- task. 8.1(Using not in word)  
select distinct customer_name,customer_city 
    from customer natural join depositor 
    where (customer_name,customer_city) not in 
    (select customer_name,customer_city from customer natural join borrower);


-- task 9.0(Without using with word)
select branch_name
from (select avg(balance) as tot_avg
		from account) temp, account
where balance > tot_avg;


-- task 9.1(Using with word)
WITH temp(tot_avg) as
	(select avg(balance) 
		from account)
select branch_name
from temp, account
where balance > tot_avg;


-- task 10.0(Without using with word) 
select branch_name
from (select avg(amount) as tot_avg
		from loan) temp, loan
where amount < tot_avg;

-- task 10.1(Using with word)
WITH temp(tot_avg) AS
	(select avg(amount)
		from loan)
select branch_name
from temp, loan
where amount < tot_avg;



    