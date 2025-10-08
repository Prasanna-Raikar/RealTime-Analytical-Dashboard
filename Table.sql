-- ------>  DDL (Data Definition Language)  <------
-- Syntax:

-- CREATE TABLE <table_name> (
-- column1_name <data_type>,
-- column2_name <data_type>,
-- column3_name <data_type>,
-- .
-- .
-- );

  ------------------------------------------------------------------------------------------------------------

create table employee(
emp_id int primary key,
emp_name varchar (50),
age int,
department varchar (50),
salary int,
hire_date date
);

-- INSERT INTO employee (emp_id, emp_name, age, department, salary, hire_date)
-- VALUES (01, 'Prasanna', 26,'development', 25000, '2023-01-15');

select * from employee;


---------------------------------------------------------------------------------------------------------------

------> DML (Data Manipulation Langauge) <------

-- Syntax:

-- insert into <tabel_name> (col1_name,col2_name,....)
-- values (value_col1,value_col2,.....)


---------------------------------------------------------------------------------------------------------------

INSERT INTO employee (emp_id, emp_name, age, department, salary, hire_date)
VALUES (1, 'Alice', 30,'IT', 60000, '2023-05-10'),
       (2, 'Steve', 20, 'Finance', 10000, '2022-05-13'),
	   (3, 'Bob', 35, 'IT', 20000, '2022-05-11'),
	   (4, 'Charlie', 28, 'Marketing', 50000, '2022-06-01'),
	   (5, 'David', 40, 'HR', 70000, '2022-06-15'),
	   (6, 'Eva', 25, 'Finance', 12000, '2022-01-07'),
	   (7, 'Frank', 32, 'Marketing', 25000, '2022-07-10'),
	   (8, 'Grace', 22, 'Marketing', 45000, '2022-08-01'),
	   (9, 'Hank', 29, 'Sales', 30000, '2022-08-15'),
       (10, 'Ivy', 33, 'Sales', 35000, '2022-09-01'),
	   (11, 'Abhi', 35, 'Games', 55000, '2022-09-09');

select * from employee;


-------------------------------------------------------------------------------------------------------------

-- -----> DQL (Data Query Language) <------

-- Syntax:

-- select * from <table_name>;


select emp_id, emp_name from employee;

-------------------------------------------------

 ---->Using Aliases with AS

select emp_id as employee_id,
emp_name from employee;

-------------------------------------------------

 ----> Filtering the data by Using Where Clause:

 select * from employee
 where department = 'Sales';


 ----> Filtering the data by Using Where Clause for multiple values:
 
 select * from employee 
 where department in ('HR', 'Sales');

 select * from employee 
 where department in ('Marketing', 'Sales');


----> Using Between:

 select * from employee
 where salary between 10000 and 35000;


-- Q: Retrive emp id, age, monthly salary, yearly salary.

 select
 emp_id,
 age,
 salary as monthly_salary,
 (salary*12) as per_anum
 from employee;

-- --> Filtering the data using multiple conditions:
-- Q: Retrive the employees in 'IT' department and a salary is greater than 20000.

 select * from employee
 where
 department = 'IT' and salary > 20000;

<-------------------------------------------------------------------------------------->
-- Q: Retrive the employees in 'HR' departmemt or with a salary lesser than 50000.

 select * from employee
 where department = 'HR' or salary < 50000;

<-------------------------------------------------------------------------------------->
-- Q: Retrive the employees who do not work  in 'HR' department:

 select * from employee
 where NOT department ='HR';

 (or)

 select * from employee
 where department not in ('HR');
 
<--------------------------------------------------------------------------------------->
-- --> Using like:
-- Q: Retrive the empployees whose name start with 'A':

--'_%' after the letter - starting letter
--'%_%' start and end - anywhere in the word
--'%_' before - ending letter

select * from employee 
where emp_name like 'A%';

-- Q: Retrive the employees whose name ends with 'E':

select * from employee 
where emp_name like '%e';

-- Q: Retrive the employees whose name has 'B':

select * from employee 
where emp_name like '%B%';

------------------------------------------------------------------------------------------------------------
----> Sorting data by order:

select * from employee order by emp_id desc;

select * from employee order by emp_id asc;


----> Sorting by multiple values:

select * from employee 
order by department asc, salary desc;

------------------------------------------------------------------------------------------------------------

----> Retrive the emp name, salary and total salary after 20% tax deduction:

select 
emp_name,
salary, 
salary - (salary * 0.20) as deduction
from employee;

-------------------------------------------------------------------------------------------------------------
--------------------------------> New Table: <----------------------------------

create table department(
dept_id int primary key,
dept_name varchar(50)
);

insert into department (dept_id, dept_name)
VALUES (1, 'HR'),
       (2,'Finance'),
	   (3, 'IT'),
	   (4, 'Marketing'),
	   (5, 'Sales'),
	   (6, 'Operations'),
	   (7, 'Legal'),
	   (8, 'Support'),
	   (9, 'Engineering'),
	   (10, 'Research');

select * from department;

===========================================================================================================================

--------------------------------------->  Joins  <-------------------------------------------------

-----> 1. Inner Join: <-----

select * from employee e
inner join 	department d on d.dept_name = e.department;

-- Q: Retrive the names of employee along with their dept_ids and department names.
--    including only employees who belong to a department.

select 
e.emp_id,
e.emp_name,
d.dept_id,
e.department,
e.salary,
e.hire_date
from employee e
inner join department d on d.dept_name = e.department;

==============================================================================================

-----> 2. Left Join: <-----

select * from employee e
left join department d on d.dept_name = e.department;


==============================================================================================

-----> 3. Right Join: <-----

select * from employee e
right join department d on d.dept_name = e.department;

==============================================================================================

-----> 4. Full Outer Join: <-----

select * from employee e
full outer join department d on d.dept_name = e.department;

==============================================================================================


--Q/A:

--1). Retrive employees names and their monthly salary with a column alias.

select 
emp_name, salary as monthly_salary 
from employee;

---------------------------------------------------------------------------------------------------

--2). Retrive employee names and thier annual salary with an alias.

select
emp_name,
(salary*12) as annual_salary
from employee;

---------------------------------------------------------------------------------------------------

--3). Retrive employee names, salaries and 20% bonus.

select
emp_name,
salary,
(salary * 0.20) as bonus
from employee;

---------------------------------------------------------------------------------------------------

--4). Retrive employees in the 'HR' department or with a salary greater than 50000.

select * from employee
where department = 'HR' or salary > 50000;

---------------------------------------------------------------------------------------------------

--5). Retrive employees who do not work in the "HR" department.

select * from employee
where department not in ('HR');

---------------------------------------------------------------------------------------------------

--6). Retrive employees whoes names end with 'e'.

select * from employee
where emp_name like '%e';

---------------------------------------------------------------------------------------------------

--7). Retrive employees with a salary between 20000 and 50000.

select * from employee
where salary between 20000 and 50000;

---------------------------------------------------------------------------------------------------

--Q/A: Joins:

-- --1). Write a query to retrive the names of employees along with thier department names. 
--       Include only employees who belong to a department.

select
e.emp_name,
e.department,
d.dept_name
from employee e
inner join department d on d.dept_name = e.department;

---------------------------------------------------------------------------------------------------

-- --2). Write a query to retrive all employees and their department names. 
--       Include employees even if they do not belong to any department.

select * from employee e
left join department d on d.dept_name = e. department;

---------------------------------------------------------------------------------------------------

-- --3). Write a query to retrive all departments and the names of employees who work in those department.
--       Include departments even if they have no employees.

select
e.emp_name,
e.department,
d.dept_id,
d.dept_name
from department d
left join employee e on d.dept_name = e.department;

---------------------------------------------------------------------------------------------------

-- --4). Write a query to retrive all employees and all departments.
--       Including employees without departments and departments without employees.

select 
e.emp_id,
e.emp_name,
e.department,
e.salary,
e.hire_date,
d.dept_id,
d.dept_name
from employee e
full outer join department d on d.dept_name = e.department;


===================================================================================================

-- Aggregation and Grouping:

select count (*) from employee;

select sum (salary) from employee;

select max (salary) from employee;

select min (salary) from employee;

select avg (salary) from employee;


--> To remove duplicate values use Distinct keyword:

select distinct department from employee;   


-- Group by:

select
department,
count(*) as total_employees
from employee
group by department;

select 
department,
sum(salary) as total_salary
from employee
group by department

select
department,
hire_date,
sum(salary)
from employee
group by department,hire_date

select
department,
max(salary) as max_salary
from employee
group by department

select
department,
min(salary) as min_salary
from employee
group by department

select
department,
avg(age)
from employee
group by department


--> To round off the decimal values:
select
department,
round(avg(age),2)
from employee
group by department

--Q. Write a query to retrive the count of employees, total salary, average salary, max salary, min salary and average age.

select
  department,
  count(*) as total_employees,
  sum(salary) as total_salary,
  round(avg(salary),2) as avg_salary,
  max(salary) as max_salary,
  min(salary)  as min_salary,
  round(avg(age),2) as avg_age
from employee
group by department


===================================================================================================

------> Having Clause <------

--Q. Retrieve the departments where total salary is more than 40000.

select
department,
sum(salary) as total_salary
from employee
group by department
having sum(salary) > 40000;

--Q. Retrieve the departments where there are more than 1 emloyees.

select
department,
count(*) as total_employees
from employee
group by department
having count(*) > 1;

--Q. Find the departments where the avg salary is greater than 30000.

select
department,
avg(salary) as avg_salary
from employee
group by department
having avg(salary) > 30000;

--Q. Find the department where the total salary is greater than 50000.

select
department,
sum(salary) as total_salary
from employee
group by department
having sum(salary) > 50000;

--Q. Find the department where the minimum salary is greater than 20000.

select
department,
min(salary) as min_salary
from employee
group by department
having min(salary) > 20000;

--Q. Find the department where the maximum salary is greater than 50000.

select
department,
max(salary) as max_salary
from employee
group by department
having max(salary) > 50000;

--Q. Find the department where the avg salary is greater than 30000 and number of employees is greater than 1.

select
department,
avg(salary) as avg_salary,
count(*) as total_employee
from employee
group by department
having avg(salary) > 30000 and count(*) > 1;

--Q. Find the department and departments IDs where the total salary is greater than 50000.

select
e.department,
d.dept_id,
sum(e.salary) as total_salary
from employee e
inner join department d on d.dept_name = e.department
group by e.department, d.dept_id
having sum(salary) > 50000;

--Q. Find the department and departments IDs where the minimum salary is greater than 20000.

select
e.department,
d.dept_id,
min(e.salary) as min_salary
from employee e
inner join department d on d.dept_name = e.department
group by e.department, d.dept_id
having min(salary) > 20000;


----> Syntax <----

-- select
-- col1,col2,col3....
-- from <table_A>
-- join <table_B>
-- where <condition>
-- group by <columns...,>
-- having <condition>
-- order by <col...>


===================================================================================================

-------------------------------> Subqueries in SQL (Query inside the query) <----------------------

----> by using where clause <----

--Q1. Find employees whose salary is greater than the average salary.
select * from employee
where salary > (select avg (salary) from employee);

--Q2. Find the employees whose salary is greater than total salary of finance department.
select * from employee
where salary > (select sum(salary) from employee where department = 'Finance');

---------------------------------------------------------------------------------------------------
----> by using select clause <----

--Q. Retrieve employees name, salary and the difference between their salary and average salary. 
select 
emp_name,
salary,
(select avg(salary) from employee) as avg_salary,
salary - (select avg(salary) from employee) as diff_salary
from employee;

---------------------------------------------------------------------------------------------------

----> by using from clause <----
--1.
select * from(
select
department,
max(salary) as max_salary
from employee
group by department
having max(salary) > 50000
)
where max_salary >= 70000;

--2.
select * from(
select
department,
count(*) as total_employees
from employee
group by department
having count(*) > 1
)
where department = 'IT';

--3.
select * from (
select
emp_name,
salary,
(salary * 0.20) as bonus
from employee
)
where salary >= 30000;

--4.
select * from (
select
emp_name,
salary,
(salary * 0.20) as bonus
from employee
)
where emp_name like '%e'

===================================================================================================
--Q.1. Write a query to count the number of employees in each department.

select
department,
count(*) as total_employees
from employee
group by department
having count(*) >0;

--Q.2. Write a query to find maximum and minimum salary in the 'Sales' department.

select
department,
min(salary) as min_salary,
max(salary) as max_salary
from employee
group by department
having department = 'Sales';

--Q.3. Write a query to find the average salary spent per department for employees who are 25 years old or elder.

select
department,
round(avg(salary),2) as avg_salary
from employee
where age >= 25
group by department;

--Q.4. Write a query to retrieve departments where the total salary is greater than the average salary across all the department.

select
  department,
  sum(salary) as total_salary
  from employee
  group by department
  having sum(salary) > (
  select avg(total_salary) from
  (select department,
  sum(salary) as total_salary
  from employee
  group by department)
  )
 
--Q.5. Write a query to retrieve departments where the total salary is greater than the total salary of the 'Finance' department.

select
department,
sum(salary) as total_salary
from employee
group by department
having sum(salary) > (select sum(salary) from employee where department = 'Finance');

--Q.6. Write a query to find the department IDs where the total salary is between 40000 and 80000.

select
e.department,
d.dept_id,
sum(e.salary) as total_salary
from employee e
inner join department d on d.dept_name = e.department
group by d.dept_id, e.department
having sum(e.salary) between 40000 and 80000;

===================================================================================================

DDL (Data Definition Langauge)

--CREATE - Creates a database objects (table, schema)
--ALTER - Modifies the database objects (column names, data types - table structure)
--DROP - Deleting a table
--TRUNCATE - Removing the data inside a table

-------------------

--ALTER:

--Altering a column name

-- -Syntax:
-- --ALTER <table_name>
--   rename <column_name> to <new_column_name>

alter table employee
rename age to emp_age

select * from employee

-- --Altering a column data type:

-- -Syntax:
-- -Alter tabel <table_name>
--  Alter <column_name> TYPE <new_column_type>

alter table employee
alter department type char(50);

-- --Altering a table name:

-- -Syntax:
-- -Alter tabel <table_name>
--  rename to <new_table_name>

alter table department
rename to departments;

---------------------------------------------------------------------------------------------------

--DROP:
-Syntax:
-Drop table <table_name>

---------------------------------------------------------------------------------------------------

--TRUNCATE:
-Syntax:
-Truncate table <table_name>

---------------------------------------------------------------------------------------------------

--DML (Data Manipulation Langauge)

--Insert - Adds a new data into table.
--Update - Modifies the existing data.
--Delete - Deleting a particular value.

------> UPDATE <------
-- -Syntax:
-- -update <table_name>
--  set <column_name> = <updated_value>
--  where <condition>

update employee
set salary = 20000
where emp_id=2;

update employee
set department = 'Finance'
where emp_id = 8;


------> Delete <------
-- -Syntax:
-- -Delete from <table_name>
--  where <condition>

delete from employee
where department = 'Games'

---------------------------------------------------------------------------------------------------

--DQL (Data Query Langauge)

-- --Select: Retrieves the data.
-- --Syntax:
--   select * from <table_name>;

---------------------------------------------------------------------------------------------------

-- --TCL (Transaction Control Langauge)
--BEGIN:

--  Note:First we have to BEGIN the query, next update the query, 
--  	 after updating check the retrived data once for confirmation, after that if
-- 	 if you want previous value means rollback it, or else commit the data.

 BEGIN;                                       

 update employee
 set salary = 30000
 where emp_id = 2;

select * from employee;

 rollback;

 commit;

 --Savepoint:

Begin;

update employee
set salary = 20000
where emp_id = 2;

savepoint one;

update employee
set salary = 60000
where emp_id = 3;

savepoint two;

update employee
set salary = 80000
where emp_id = 4;

savepoint three;

update employee
set salary = 20000
where emp_id = 5;

savepoint four;

rollback to two;

commit;

--Release Savepoint;

Begin;

update employee
set salary = 20000
where emp_id = 2;

savepoint one;

update employee
set salary = 60000
where emp_id = 3;

savepoint two;

update employee
set salary = 80000
where emp_id = 4;

savepoint three;

update employee
set salary = 20000
where emp_id = 5;

savepoint four;

release savepoint two;

rollback to two;

commit;

===================================================================================================

-----> DCL (Data Control Langauge) <-----

--Command are used to control access [like permission] to data in database. 

--GRANT

--REVOKE

-------------------------------------------------
--GRANT:

--user can only view the data, not modify it.

grant select on employee to demo_user;

--Allow all permission to a particular user.

grant select, insert, update, delete on employee to demo_user;

-------------------------------------------------
--REVOKE:

--Remove access from demo_user.

revoke select on employee from demo_user;

--Remove certain set of commands.

revoke update, delete on employee from demo_user;

===================================================================================================


-----> Window Function:
--Performs a calculation across a set of table rows that are related to the current row. Unlike group by does not collapse the rows.

--Ranking Functions:
  --ROW_NUMBER 
  --RANK
  --DENSE_RANK
  --NTILE

--Agg


--ROW NUMBER:

select * , 
row_number() over (partition by department order by salary desc) as row_number 
from employee


--> RANK:
select
* , 
rank() over (partition by department order by salary desc) as row_number
from employee

--> DENSE RANK:
select
* , 
dense_rank() over (partition by department order by salary desc) as row_number
from employee

-->NTILE:
select
* , 
ntile(2) over (order by salary desc) as half_group
from employee


--Q. Find highest paid employees in each depaertnent.
select * from(
select * ,
row_number () over (partition by department order by salary desc) as row_number
from employee)
where row_number = 1;

---------------------------------------------------------------------------------------------------
__SUM:
--Q. Retrieve deparrment wise total salary.(By using window function)

select * , sum(salary) over (partition by department) as dept_total_salary
from employee;

__AVG:
--Q. Retrieve deparrment wise average salary.(By using window function)

select * , avg(salary) over (partition by department) as avg_salary
from employee;

--COUNT:
--Q. Retrieve department wise count.(By using window function)

select * , count(*) over (partition by department)  as emp_count
from employee;

--Running Total.(Cumulative Sum)

select * , sum(salary) over (order by emp_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_total
from employee;

--MAX:
--Q.Show each employees salary along with the highest salary in their department.

select
emp_name,
department,
salary,
max(salary) over (partition by department) as max_salary
from employee;

--Value Function:
--LAG:

select
emp_name,
hire_date,
lag(hire_date) over (order by hire_date) as prev_date
from employee;

--LEAD:

select
emp_name,
hire_date,
lead(hire_date) over (order by hire_date) as next_hire_date
from employee;

--Q. Use LAG to show how the salary changed from previous employee in the department.

select
emp_name,
department,
hire_date,
salary,
lag(salary) over (partition by department order by hire_date) as prev_emp_salary,
salary - lag(salary) over (partition by department order by hire_date) as salary_diff_prev
from employee;

--Q. Use LEAD to compare salary with the next employee (by hire date) in the department.

select
emp_name,
department,
hire_date,
salary,
lead(salary) over (partition by department order by hire_date) as prev_emp_salary,
salary - lead(salary) over (partition by department order by hire_date) as next_emp_salary
from employee


===================================================================================================

create table students(
student_id int primary key,
name varchar (50),
age int,
course_id int,
marks int
);

select * from students

INSERT INTO students (student_id, name, age, course_id, marks)
VALUES (1, 'Alice', 20, 1, 88),
	   (2, 'Bob', 22, 2, 76),
	   (3, 'Charlie', 21, 1,91),
	   (4, 'David', 23, 3, 65),
	   (5, 'Eva', 20, 2, 64),
	   (6, 'Frank', 22, 3, 79),
	   (7, 'Grace', 21, 1, 92),
	   (8, 'Hank', 23, 2, 68),
       (9, 'Ivy', 20, 3, 81),
	   (10, 'Jack', 22, 1, 87),
	   (11, 'Steve', 23, 4, 74),
	   (12, 'Bob', 20, 5, 69);

create table courses(
course_id int primary key,
course_name varchar (50),
instructor varchar (50)
);

select * from courses;

insert into courses (course_id, course_name, instructor)
values (1, 'Mathematics', 'Dr. Smith'),
       (2, 'Physics', 'Dr. Johnson'),
	   (3, 'Chemistry', 'Dr. Brown'),
	   (4, 'English', 'Dr. John');


-----> Module-1 <-----

-- -Q.1. Show each student's name and their marks increased by 5 (bonus marks).

select 
name,
marks,
(marks + 5) as bonus
from students;

-------------------------------------------------

-- -Q.2. Find all the students whose names starts with the letter 'B'.

select * from students
where name like 'B%';

-------------------------------------------------

-- -Q.3. Retrieve students whose names ends with the letter 'e'.

select * from students
where name like '%e';

-------------------------------------------------

-- -Q.4. List students who have scored more than 85 marks.

select * from students
where marks > 85;

-------------------------------------------------

-- -Q.5. Find students aged exactly 22.

select * from students
where age = 22;

-------------------------------------------------

-- -Q.6. Get students who are older than 21 and have scored less than 80.

select * from students
where age >21 and marks < 80;

-------------------------------------------------

-- -Q.7. Find students who are either named 'Bob' or have marks greater than 90.

select * from students
where name = 'Bob' or marks > 90;

-------------------------------------------------

-- -Q.8. Display all students sorted by age in ascending order and marks in descending order.

select * from students
order by age asc, marks desc;

-------------------------------------------------

-- -Q.9. Find students whose marks plus 10 would exceed 90.

select * from students
where (marks + 10) > 90;

-------------------------------------------------

-- -Q.10. Display students name, marks, and percentage (assuming marks are out of 120).

select
name,
marks,
(marks / 120.0) *100 as percentage from students;

or

select
name,
marks,
(marks * 100/120) as percentage from students;

===================================================================================================

-----> Module 2 <-----

-- -Q.1. Get students names along with their course names.

select
s.name as student_name,
c.course_name as course_name
from students s
inner join courses c on s.course_id = c.course_id;

-------------------------------------------------

-- -Q.2. List students and their instructors for those enrolled in existing courses only.

select
s.name as student_name,
c.instructor
from students s
inner join courses c on s.course_id = c.course_id;

-------------------------------------------------

-- -Q.3. Show students name, marks and course name for students who scored more than 80.

select
s.name as student_name,
s.marks,
c.course_name as course_name
from students s
inner join courses c on s.course_id = c.course_id
where marks > 80;

-------------------------------------------------

-- -Q.4. List all students and their course names, even if the course is missing in the courses table.

select 
s.name as student_name,
c.course_name
from students s
left join courses c on s.course_id = c.course_id;

-------------------------------------------------

-Q.5. List course names and students names, include courses with no students.

select 
s.name as student_name,
c.course_name
from courses c
left join students s on s.course_id = c.course_id;

===================================================================================================

-----> Module - 3 <-----

-- -Q.1. List each student age and the total number of students of that age.

select
age,
count(age) as total_students
from students
group by age
order by age;

-------------------------------------------------

-- -Q.2. Show the maximum and minimum marks scored in each course.

select
max(s.marks) as max_marks,
min(s.marks) as min_marks,
c.course_name as course_name
from students s
inner join courses c on c.course_id = s.course_id
group by course_name

-------------------------------------------------	

-- -Q.3. Count the number of students enrolled in each course.

select
count(*) as total_students,
c.course_name as course_name
from students s
inner join courses c on c.course_id = s.course_id
group by course_name
order by count(*)

-------------------------------------------------

-- -Q.4. Find the average marks of students in each course.

select
avg(s.marks) as avg_marks,
c.course_name as course_name
from students s
inner join courses c on c.course_id = s.course_id
group by c.course_name

-------------------------------------------------

-- -Q.5. Show course name and total marks scored by students in that course.

select
c.course_name as course_name,
sum(s.marks) as total_marks
from students s
inner join courses c on c.course_id = s.course_id
group by c.course_name

===================================================================================================

-----> Module 4 <-----

-- -Q.1. Show course IDs where the average marks of students is greater than 80.

select course_id,
avg(marks)
from students
group by course_id
having avg(marks)>80;

-------------------------------------------------

-- -Q.2. List student ages where more then 2 students share the same age.

select age,
count(*) as total_students
from students
group by age
having count(*) >2;

-------------------------------------------------

-- -Q.3. Show course names where total marks scored by students is less than 250.

select
c.course_name,
sum(s.marks) as total_marks
from students s
inner join courses c on c.course_id = s.course_id
group by c.course_name
having sum(s.marks) < 250;

-------------------------------------------------

-- -Q.4. Find course IDs with a maximum mark greater than 90.

select
course_id,
max(marks) as max_marks
from students
group by course_id
having max(marks) > 90

-------------------------------------------------

-- -Q.5. Show all ages where the average mark of students is below 75.

select
age,
avg(marks) as avg_marks
from students
group by age
having avg(marks) < 75;

===================================================================================================

-----> Module 5 <-----

-- -Q.1. Show students whose marks are above the average marks of all students.

select * from students where marks > (select avg(marks) from students)

-------------------------------------------------

-- -Q.2. Find course IDs where the average marks is higher than the average of all students.

select 
s.course_id
from students s
group by s.course_id
having avg(marks) > (select avg(marks) from students);

-------------------------------------------------

-- -Q.3. List all students who scored less than the average marks of all students.

select * from students where marks < (select avg(marks) from students);

-------------------------------------------------

-----> Module 6 <-----

-- -Q.1. Rank students based on their marks.

select
* , 
dense_rank() over (order by marks desc) as row_number
from students;

-------------------------------------------------

-- -Q.2. Assign row numbers to students within each course based on marks.

select * , 
row_number() over (partition by course_id order by marks desc) as row_number 
from students;

-------------------------------------------------

-- -Q.3. Find average marks per course along with each student's marks.

select 
student_id,
course_id,
marks,
avg(marks) over (partition by course_id) as average_score
from students;

-------------------------------------------------

-- -Q.4. Find the top scorer in each course.

select * from
(
select
name,
course_id,
marks,
rank() over (partition by course_id order by marks desc) as rank_stu
from students)
where rank_stu = 1;

-------------------------------------------------

-- -Q.5. Find the least scorer in each course.

select * from
(
select
name,
course_id,
marks,
rank() over (partition by course_id order by marks asc) as rank_stu
from students)
where rank_stu = 1;

===================================================================================================
-- > Practice:

select * from employee;

select emp_name as employee_name from employee

select * from employee where department in ('IT', 'HR', 'Sales';

select * from employee where salary between '50000' and '60000'

select * from employee where emp_name like 'D%'

select * from employee where emp_name like '%e'

select * from employee where emp_name like '_____'

select * from employee where department not in ('IT', 'Sales');

select
count(*),
max(salary),
min(salary),
round(avg(salary),2),
sum(salary)
from employee;

select count(*) from employee where department = 'Sales'

select * from public.students





