-- Student ID: 2022-1-60-001
-- Lab No. : 01

-- Question 01 (A) 

create table instructor_2019360011 (
	id number,
	name varchar2(20),
	dept_name varchar2(10),
	salary number,
	primary key(id)
	);
	
-- Question 01 (B)

create table course_2019360011(
	course_id varchar2(10),
	title varchar2(20),
	dept_name varchar2(10),
	credits number
	);
	
	
-- Question 02 (A)

INSERT INTO instructor_2019360011 VALUES (10101, 'Srinivasan' , 'Comp.Sci.',65000);
INSERT INTO instructor_2019360011 VALUES (12121, 'Wu' , 'Finance',90000);
INSERT INTO instructor_2019360011 VALUES (15151, 'Mozart' , 'Music',40000);
INSERT INTO instructor_2019360011 VALUES (22222, 'Einstein' , 'Physics',95000);
INSERT INTO instructor_2019360011 VALUES (32343, 'El Said' , 'History',60000);
INSERT INTO instructor_2019360011 VALUES (33456, 'Gold' , 'Physics',87000);
INSERT INTO instructor_2019360011 VALUES (45565, 'Katz' , 'Comp.Sci.',75000);
INSERT INTO instructor_2019360011 VALUES (58583, 'Califieri' , 'History',62000);
INSERT INTO instructor_2019360011 VALUES (76543, 'Singh' , 'Finance',80000);
INSERT INTO instructor_2019360011 VALUES (76766, 'Crick' , 'Biology',72000);
INSERT INTO instructor_2019360011 VALUES (83821, 'Brandt' , 'Comp.Sci.',92000);
INSERT INTO instructor_2019360011 VALUES (98345, 'Kim' , 'Elec.Eng.',80000);


-- Question 02 (B)


INSERT INTO course_2019360011 VALUES ('BIO-101', 'Intro. to Biology' , 'Biology',4);
INSERT INTO course_2019360011 VALUES ('BIO-301', 'Genetics' , 'Biology',4);
INSERT INTO course_2019360011 VALUES ('BIO-399', 'Comp.Biology' , 'Biology',3);
INSERT INTO course_2019360011 VALUES ('CS-101', 'Intro Comp.Science' , 'Comp.Sci.',4);
INSERT INTO course_2019360011 VALUES ('CS-190', 'Game Design' , 'Comp.Sci.',4);
INSERT INTO course_2019360011 VALUES ('CS-315', 'Robotics' , 'Comp.Sci.',3);
INSERT INTO course_2019360011 VALUES ('CS-319', 'Image Processing' , 'Comp.Sci.',3);
INSERT INTO course_2019360011 VALUES ('CS-347', 'Database System' , 'Comp.Sci.',3);
INSERT INTO course_2019360011 VALUES ('EE-181', 'Digital Systems' , 'Elec.Eng.',3);
INSERT INTO course_2019360011 VALUES ('FIN-201', 'Investment Banking' , 'Finance',3);
INSERT INTO course_2019360011 VALUES ('HIS-351', 'World History' , 'History',3);
INSERT INTO course_2019360011 VALUES ('MU-199', 'Music Video Prod.' , 'Music',3);
INSERT INTO course_2019360011 VALUES ('PHY-101', 'Physical Principles' , 'Physics',4);



--Lab task 3-1
select name from instructor_2019360011;

--Lab task 3-2
select course_id, title from course_2019360011;

--Lab task 3-3
select name,dept_name from instructor_2019360011 where id=22222;

--Lab task 3-4
select title,credits from course_2019360011 where dept_name='Comp.Sci.';

--Lab task 3-5
select name,dept_name from instructor_2019360011 where salary>70000;

--Lab task 3-6
select title from course_2019360011 where credits>=4;

--Lab task 3-7
select name,dept_name from instructor_2019360011 where salary>=80000 AND salary<=100000;

--Lab task 3-8
select title,credits from course_2019360011 where dept_name!='Comp.Sci.';

--Lab task 3-9
select * from instructor_2019360011;

--Lab task 3-10
select * from course_2019360011 where dept_name='Biology' AND credits!=4;