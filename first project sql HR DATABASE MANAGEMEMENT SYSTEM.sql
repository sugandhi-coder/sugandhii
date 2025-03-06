-- A. To get data from all the rows and columns in the employees table:
Select * from dbo.employees
--B. select data from the employee id, first name, last name, and hire date of all rows in
--the employees table:

 select employee_id, first_name, last_name, hire_date from employees;
 --C. to get the first name, last name, salary, and new salary:
 select first_name, last_name, salary, salary * 1.1 as new_salary from employees;
 --D. Increase the salary two times and named as New_SALARY from employees table
 select first_name, last_name, salary, salary * 2 as new_salary from employees;
 --ORDER BY--
-- A. returns the data from the employee id, first name, last name, hire date, and salary column of
--the employees table:
select employee_id, first_name, last_name, hire_date 
,salary from employees;
--B. to sort employees by first names in alphabetical order:
select * from employees order by first_name asc
--C. to sort the employees by the first name in ascending order and the last name in descending order:
select * from employees order by first_name asc, last_name desc
--D.to sort employees by salary from high to low
select * from employees order by salary desc
--E. to sort the employees by values in the hire_date column from:
select * from employees order by hire_date asc
--F. sort the employees by the hire dates in descending order:
select * from employees order by hire_date desc
--## DISTINCT STATEMENT ##
--A. selects the salary data from the salary column of the employees table and sorts them from high to
low:
select salary from employees order by salary desc
--B. select unique values from the salary column of the employees table:
select distinct salary from employees
--C. selects the job id and salary from the employees table:
select job_id,salary from employees
--D. to remove the duplicate values in job id and salary:
select distinct job_id ,salary from employees
--E. returns the distinct phone numbers of employees:
select distinct phone_number from employees

-- TOP N STATEMENT--
--A. returns all rows in the employees table sorted by the first_name column
select * from employees order by first_name
--B. to return the first 5 rows in the result set returned by the SELECT clause:
select top 5* from employees 
--C. to return five rows starting from the 4th row
select * from
 (select top 5* from
 (Select top 8* from employees) as t order by employee_id desc) as T order by employee_id asc

-- D. gets the top five employees with the highest salaries.
select top 5* from employees order by salary desc

--E. to get employees who have the 2nd highest salary in the company
select top 1 * from (
select top 2 * from employees 
order by salary desc 
) as subquery
order by salary asc

--WHERE CLAUSE--


--A. query finds employees who have salaries greater than 14,000 and sorts the results sets based on
--the salary in descending order.
select * from employees where salary > 14000 order by salary desc
--B. query finds all employees who work in the department id 5.
select * from employees where department_id = 5
--C. query finds the employee whose last name is Chen 
select * from employees where last_name = 'chen';
--D. To get all employees who joined the company after January 1st, 1999
select * from employees where hire_date > '1999-01-01';
--E. to find the employees who joined the company in 1999
select * from employees where hire_date between '1999-01-01' and'1999-12-31'
--F. statement finds the employee whose last name is Himuro
select * from employees where last_name = 'Himuro'
--G. the query searches for the string Himuro in the  last_name column of the employees tab
select * from employees where last_name like '%Himuro%';
--H. to find all employees who do not have phone numbers
select * from employees where phone_number is null
 --I.returns all employees whose department id is not 8.
 select * from employees where department_id != 8;
--J. finds all employees whose department id is not eight and ten.
select * from employees where department_id not in (8,10);
--K. to find the employees whose salary is greater than 10,000,
select * from employees where salary > 10000;
--L. finds employees in department 8 and have the salary greater than 10,000:
select * from employees where department_id = 8 and salary > 10000
--M. the statement below returns all employees whose salaries are less than 10,000:
select * from employees where salary < 10000
--N. finds employees whose salaries are greater than or equal 9,000: 
select * from employees where salary >= 9000
--O. finds employees whose salaries are less than or equal to 9,000:
select * from employees where salary <= 9000


--COURSE ID COURSE NAME
select * from courses
--A. adds a new column named credit_hours to the courses table. 
alter table courses add credit_hours number(5)


CREATE  TABLE  projects ( 
project_id  INT  PRIMARY KEY, 
project_name  VARCHAR(255), 
start_date  DATE  NOT NULL, 
end_date  DATE  NOT NULL 
); 





----task 2

--A. finds all employees whose salaries are greater than 5,000 and less than 7,000:
select * from employees where salary > 5000 and salary < 7000
---B.finds employees whose salary is either 7,000 or 8,000:
select * from employees where salary =7000 or salary = 8000
--C. finds all employees who do not have a phone number:
select * from employees where phone_number is null
----D. finds all employees whose salaries are between 9,000 and 12,000
select * from employees where salary between 9000 and 12000
--E. finds all employees who work in the department id 8 or 9. 
select * from employees where department_id  = 8 or department_id= 9 
--F. finds all employees whose first name starts with the string jo 
select * from employees where first_name like 'jo%'

---G. finds all employees with the first names whose the second character is  h 
select * from employees where first_name like '_h%'


----PART 2--

--A. finds all employees whose salaries are greater than the average salary of every department:
--select * from employees
Select first_name, department_id from
(Select first_name, salary,employees.department_id,Avg_Salary from employees join
(select department_id,Round(Sum(salary)/count(employee_id),2) as Avg_Salary from employees 
group by department_id) as T 
On employees.department_id = T.department_id) as X
where X.salary>= X.Avg_Salary
----B. finds all employees who have dependents:
Select * from employees
Select first_name from employees join
(select distinct manager_id from employees ) as T
on employees.employee_id=T.manager_id
 ---to find all employees whose salaries are between 2,500 and 2,900: 
 select * from employees where salary between 2500 and 2900
-- to find all employees whose salaries are not in the range of 2,500 and 2,900: 
 select * from employees where salary  not between 2500 and 2900
 ---E. to find all employees who joined the company between January 1, 1999, and December 31, 2000:
 select * from employees where hire_date between ' 1999-01-01' and '2000-12-31' 
 --F. to find employees who have not joined the company from January 1, 1989 to December 31, 1999:
 select * from employees where hire_date not between ' 1989-01-01' and '1999-12-31' 
-- G. to find employees who joined the company between 1990 and 1993:
select * from employees where hire_date between '1990' and '1993'


---part 

--A. to find all employees whose first names start with Da 
select * from employees where first_name  like'Da%'
--B. to find all employees whose first names end with er
select * from employees where first_name like '%er'
--C. to find employees whose last names contain the word an:
select * from employees where last_name like '%an%'
-- retrieves employees whose first names start with Jo and are followed by at most 2 characters:
select * from employees where first_name like '%jo__' 
--to find employees whose first names start with any number of characters and are followed by at 
--most one character: 
select * from employees where first_name like '%_'
--to find all employees whose first names start with the letter S but not start with Sh: 
select * from employees where first_name like  's%' and first_name not like 'sh%'


-----Part 4:- 
--A. retrieves all employees who work in the department id 5
select * from employees where department_id = 5
--B. To get the employees who work in the department id 5 and with a salary not greater than 5000.
select * from employees where department_id = 5 and  salary !> 5000
--C. statement gets all the employees who are not working in the departments 1, 2, or 3.
select * from employees where department_id not in (1,2,3)
--D. retrieves all the employees whose first names do not start with the letter D
select * from employees where first_name not like 'D%'
--E. to get employees whose salaries are not between 5,000 and 1,000.
select * from employees where salary not between 5000 and 1000


  ---TASK 3 INNER JOIN--

  CREATE  TABLE  fruits ( 
fruit_id  INT PRIMARY KEY, 
fruit_name  VARCHAR (255) NOT NULL, 
basket_id  INTEGER 
); 
CREATE TABLE baskets ( 
basket_id  INT PRIMARY KEY, 
basket_name  VARCHAR (255) NOT NULL 
); 

INSERT  INTO  baskets  (basket_id, basket_name) 
VALUES 
(1, 'A'), 
(2, 'B'), 
(3, 'C');

INSERT  INTO  fruits ( 
fruit_id, 
fruit_name, 
basket_id 
) 
VALUES 
(1, 'Apple', 1), 
(2, 'Orange', 1), 
(3, 'Banana', 2), 
(4, 'Strawberry', NULL);

--A. Write a query to  returns each fruit that is in a basket and each basket that has a fruit, but also 
--returns each fruit that is not in any basket and each basket that does not have any fruit.
select f.fruit_name,b.basket_name from fruits f 
full outer join baskets b 
on f.basket_id = b.basket_id

---B. Write a query to find the empty basket, which does not store any fruit 
select b.* from baskets b left join fruits f on b. basket_id = f.basket_id where f. basket_id is null 
--C. Write a query  which fruit is not in any basket
select f. * from fruits f left join baskets b on f.basket_id = b. basket_id
where b. basket_id is null

CREATE  TABLE  sales_organization ( 
sales_org_id  INT PRIMARY KEY, 
sales_org  VARCHAR (255) 
);
INSERT INTO sales_organization (sales_org_id, sales_org) 
VALUES 
(1, 'Domestic'), 
(2, 'Export'); 

CREATE  TABLE  sales_channel ( 
channel_id  INT PRIMARY KEY, 
channel  VARCHAR (255) 
); 
INSERT INTO sales_channel (channel_id, channel) 
VALUES 
(1, 'Wholesale'), 
(2, 'Retail'), 
(3, 'eCommerce'), 
(4, 'TV Shopping');

---Write a Query To find the all possible sales channels that a sales organization
Select * from sales_organization
select distinct channel from sales_channel

 ----task 4----

-- A. to group the values in department_id column of the employees table:
select department_id from employees group by department_id
---B. to count the number of employees by department
select department_id, COUNT(first_name) as employee_count from employees
group by department_id
---C. returns the number of employees by department 
SELECT department_id, COUNT(employee_id) as employee_count
FROM employees
GROUP BY department_id;
--D. to sort the departments by headcount: 
SELECT department_name headcount
FROM departments
ORDER BY headcount DESC;
--E. to find departments with headcounts are greater than 5:
SELECT department_id
FROM Employees
GROUP BY department_id
HAVING COUNT(employee_id) > 5;
--F. returns the minimum, maximum and average salary of employees in each department.
SELECT 
    department_id,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary,
    AVG(salary) AS avg_salary
FROM 
    employees
GROUP BY 
    department_id;

---G. To get the total salary per department,
SELECT 
    department_id, 
    SUM(Salary) AS TotalSalary
FROM 
    Employees
GROUP BY 
    department_id;
----	H. groups rows with the same values both department_id and job_id columns in the same group then 
--return the rows for each of these groups 
--Select job_id,department_id from Employees
--group by job_id,department_id
SELECT department_id, job_id, COUNT(*) AS group_count
FROM Employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;
--A. To get the managers and their direct reports, and  to group employees by the managers 
--and to count the direct reports.
SELECT e.manager_id AS ManagerID, COUNT(*) AS DirectReports

FROM employees e

GROUP BY e.manager_id;
------B. To find the managers who have at least five direct reports
SELECT first_name
FROM employees
WHERE manager_id in (
  SELECT manager_id
  FROM employees
  GROUP BY manager_id
  HAVING COUNT(manager_id) >= 5
)
-----C. calculates the sum of salary that the company pays for each department and selects only
---the departments with the sum of salary between 20000 and 30000.
SELECT department_id, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY department_id
HAVING SUM(Salary) BETWEEN 20000 AND 30000;
----D. To find the department that has employees with the lowest salary greater than 10000
SELECT department_id, MIN(Salary) AS MinSalary
FROM Employees
GROUP BY department_id
HAVING MIN(Salary) > 10000;
---E. To find the departments that have the average salaries of employees between 5000 and
--7000
SELECT Department_ID, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY department_id
HAVING AVG(Salary) BETWEEN 5000 AND 7000;


---TASK- 5 SQL UNION OPERATOR



--A. finds all employees who have at least one dependent

Select first_name from employees join
(Select distinct(manager_id) as id from employees) as T
on employees.employee_id = T.id

--B . finds employees who do not have any dependents:
Select first_name from employees left join
(Select distinct(manager_id) as id from employees) as T
on employees.employee_id = T.id
where id is null


-----SQL CASE EXPRESSION--

----A. Suppose the current year is 2000. How to use the simple CASE expression to get the
--work anniversaries of employees by
SELECT 
    employee_id, 
    first_name, 
    hire_date,
    CASE 
        WHEN YEAR(hire_date) <= 2000 
            THEN 2000 - YEAR(hire_date) 
        ELSE 'Not Hired Yet'
    END AS WorkAnniversary
FROM Employees;
---B. Write a Query If the salary is less than 3000, the CASE expression returns “Low”. If the salary
---is between 3000 and 5000, it returns “average”. When the salary is greater than 5000, the CASE
---expression returns “High



SELECT 
    employee_id, 
    first_name, 
    Salary,
    CASE 
        WHEN Salary < 3000 THEN 'Low'
        WHEN Salary BETWEEN 3000 AND 5000 THEN 'Average'
        WHEN Salary > 5000 THEN 'High'
        ELSE 'Unknown'  
    END AS SalaryCategory
FROM Employees;

--A. Combine Above two queries using subquery inorder find all departments located at the
--location whose id is 1700 and find all employees that belong to the location 1700 by
--using the department id list of the previous query
SELECT 
    e.department_id,
    e.first_name,
    e.Salary,
    CASE 
        WHEN e.Salary < 3000 THEN 'Low'
        WHEN e.Salary BETWEEN 3000 AND 5000 THEN 'Average'
        WHEN e.Salary > 5000 THEN 'High'
        ELSE 'Unknown'
    END AS SalaryCategory,
    e.department_id,
    d.department_name,
    d.location_id
FROM Employees e
JOIN (
    SELECT department_id
    FROM Departments
    WHERE location_id = 1700
) d_subquery ON e.department_id = d_subquery.department_id
JOIN Departments d ON e.department_id = d.department_id;

---to find all employees who do not locate at the location 1700
SELECT e.employee_id, e.first_name, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.location_id != 1700;
---finds the employees who have the highest salary:
SELECT * FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);
--finds all employees who salaries are greater than the average salary of all employees:
select * from employees where salary < ( select avg(salary) from employees)
--finds all departments which have at least one employee with the salary is greater than
--10,000
SELECT DISTINCT d.department_id, d.department_name
FROM departments d
JOIN employees e ON d.department_id = e.department_id
WHERE e.salary > 10000;

---finds all departments that do not have any employee with the salary greater than 10,000:
SELECT department_id, department_name
FROM departments
WHERE department_id NOT IN (
    SELECT DISTINCT department_id
    FROM employees
    WHERE salary > 10000
);
---to find the lowest salary by department
SELECT department_id, MIN(salary) AS lowest_salary
FROM employees
GROUP BY department_id;
--H. finds all employees whose salaries are greater than the lowest salary of every department:
select * from employees where salary > ( select min( salary) from employees 
 where department_id = department_id
 )
 ----I. finds all employees whose salaries are greater than or equal to the highest salary of every
--department
select * from employees where salary >= (select max (salary) from employees where department_id = department_id )
--returns the average salary of every department
select department_id, avg (salary ) as average_salary
from employees
group by department_id
---to calculate the average of average salary of departments
select department_id,avg (salary) as average_salary_deparment from employees
group by department_id
--finds the salaries of all employees, their average salary, and the difference between the
--salary of each employee and the average salary
select employee_id, first_name, last_name, salary,
       avg(salary) over () as average_salary,
       salary - avg(salary) over () as salary_difference
from employees;































































































































































































   




















 







