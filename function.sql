-- String function
-- upper()
SELECT UPPER('hello world');
SELECT *,UPPER(email) FROM employee;
-- lower()
SELECT LOWER('HELLO WORLD');
SELECT *,LOWER(student_name) FROM student;
-- concat()
SELECT CONCAT('Hello','World');
SELECT *,CONCAT(emp_name,' ',email) AS new_column FROM employee;
-- length()
SELECT LENGTH('Hello World');
SELECT *,LENGTH(CONCAT(emp_name,' ',email)) AS length_of_new_column FROM employee;
-- substr()
-- syntax
-- substr(string/column,start_position,number_of_characters)
SELECT substr('Hello World',7,5);
SELECT *,substr(email,5,5) FROM employee;
-- instr()
-- syntax
-- instr(string/column,substring/character)
SELECT INSTR('Hello World','e');
SELECT INSTR('Hello World','World');
SELECT INSTR('Hello World','l');
SELECT INSTR('Hello World','s');
SELECT email,instr(email,'a') FROM employee;
-- replace()
-- syntax
-- replace(string/column,substring_to_replace,replace_with)
SELECT REPLACE("XYZ FGH XYZ", "X", "M");
SELECT * FROM student;
SELECT *,REPLACE(country,'India','Germany') FROM student;
-- trim()
-- syntax
-- trim(string/column)
SELECT TRIM("    String    ");
INSERT INTO student VALUES(105,"    FGH    ","    India    ");
SELECT *,TRIM(student_name) FROM student;
SELECT *,TRIM(country) FROM student;
-- left()
-- syntax
-- left(string/column,length)
SELECT LEFT('Hello World',5);
SELECT *,LEFT(email,3) FROM employee;
-- right()
-- syntax
-- right(string/column,length)
SELECT RIGHT('Hello World',5);
SELECT *,RIGHT(email,9) FROM employee;
-- Math function
-- abs()
-- syntax
-- abs(number/column)
SELECT ABS(10);
SELECT ABS(-25);
-- ceil()
-- syntax
-- ceil(number/column)
SELECT CEIL(121.1);
SELECT CEIL(100.7);
SELECT CEIL(100.0);
-- floor()
-- syntax
-- floor(number/column)
SELECT FLOOR(125.9);
SELECT FLOOR(100.1);
-- round()
-- syntax
-- round(number/column,position_to_round)
-- check if the position is positive/negative
-- positive position will round the number after decimal
SELECT ROUND(1234.567);
-- the right side number if >=5 then left side number will be added +1
SELECT ROUND(1234.567,2);
SELECT ROUND(1000.2345,3);
SELECT ROUND(657.123,2);
-- negative position will round the number before decimal
-- if the negative position is given then the output will be a whole number
SELECT ROUND(1234.567,-2);
SELECT ROUND(1057.890,-2);
SELECT ROUND(67.879,-1);
-- truncate()
-- syntax
SELECT TRUNCATE(123.567,2);
SELECT TRUNCATE(5678.22443,3);
SELECT TRUNCATE(1274.567,-2);
SELECT TRUNCATE(34456,-3);
SELECT MONTH("2000-07-25");
SELECT MONTHNAME("2000-07-25");
SELECT YEAR("2000-07-25");
DESC product;
DROP TABLE product;
CREATE TABLE product(product_id INT,product_name VARCHAR(50),quantity INT,date_of_purchase DATE);
INSERT INTO product VALUES(1,'Laptop',10,'2024-12-15'),
(2,'Mouse',50,'2025-01-20'),
(3,'Keyboard',30,'2025-01-20'),
(4,'Monitor',15,'2025-04-10'),
(5,'USB Cable',100,'2025-05-25'),
(6,'Printer',5,'2025-06-30');
SELECT * FROM product;
SELECT *,YEAR(date_of_purchase) AS 'year' FROM product;
SELECT *,MONTHNAME(date_of_purchase) AS 'month_name' FROM product;
-- datediff()
SELECT DATEDIFF('2025-08-01','2025-07-25');
SELECT *,DATEDIFF('2025-12-01',date_of_purchase) AS 'difference' FROM product;
-- date_add()
-- syntax
-- date_add(date,interval value unit)
SELECT DATE_ADD('2025-07-25',INTERVAL 5 DAY);
SELECT DATE_ADD('2025-01-01',INTERVAL 1 YEAR);
SELECT DATE_ADD('2025-01-01',INTERVAL 1 HOUR);
SELECT DATE_ADD('2025-01-01',INTERVAL 1 MINUTE);
SELECT DATE_ADD('2025-01-01',INTERVAL 3 MONTH);
-- last_day()
SELECT LAST_DAY('2025-02-02');
SELECT LAST_DAY('2028-02-02');
-- timestampdiff()
SELECT TIMESTAMPDIFF(DAY,'2020-01-25','2020-02-05');
SELECT TIMESTAMPDIFF(MONTH,'2020-01-25','2021-02-05');
SELECT TIMESTAMPDIFF(YEAR,'2020-01-25','2021-02-05');
SELECT TIMESTAMPDIFF(HOUR,'2020-01-25','2021-02-26');
SELECT TIMESTAMPDIFF(SECOND,'2020-01-25','2021-02-26');
-- extract()
SELECT EXTRACT(MONTH FROM '2020-01-25');
SELECT DAY('2020-01-25');
-- curdate()
SELECT CURDATE();
-- now()
SELECT NOW();
SELECT * FROM student;
ALTER TABLE student
ADD marks INT;
UPDATE student
SET marks = CASE
    WHEN student_id = 101 THEN 90
    WHEN student_id = 102 THEN 80
    WHEN student_id = 103 THEN 50
    WHEN student_id = 104 THEN 65
    ELSE 70
END;
-- Control flow function
-- case
-- marks>=75 then 'distinction'
-- marks>=55 then 'first class'
-- marks>=45 then 'second class'
-- marks>=35 then 'pass'
-- else 'Fail'
SELECT *,CASE
WHEN marks>=75 THEN 'distinction'
WHEN marks>=55 THEN 'first class'
WHEN marks>=45 THEN 'second class'
WHEN marks>=35 THEN 'pass'
ELSE 'Fail'
END AS 'grade'
FROM student;
-- employee_id=102 then salary+10000
-- employee_id=104 then salary+8000
SELECT *,CASE 
WHEN employee_id=102 then salary+10000
WHEN employee_id=104 then salary+8000
ELSE salary+2000
END AS "new_salary"
FROM employee_details;
USE student_details;
SELECT * FROM employee_data;
-- if(condition,expression1,expression2)
-- true()=expression1
-- false()=expression2
SELECT IF(50<=100,"Yes","No");
SELECT IF(50>=100,"Yes","No");
SELECT * FROM department;
-- working days>25 then A else B
SELECT *,IF (working_days>25,'A','B') AS "grade" FROM employee;
-- ifnull()
SELECT IFNULL(100,'ABC');
SELECT IFNULL(NULL,'ABC');
UPDATE employee SET bonus=NULL WHERE emp_id=104;
SELECT *,IFNULL(bonus,'no bonus') FROM employee;
SELECT *,IFNULL(bonus,salary/5) FROM employee;
SELECT NULLIF(100,100);
SELECT NULLIF(100,200);
SELECT NULLIF('ABC','ABC');
SELECT ISNULL(NULL);
SELECT *,ISNULL(bonus) FROM employee;
-- coalesce()
SELECT COALESCE(NULL,NULL,'ABC',NULL,NULL);
SELECT COALESCE(NULL,'ABC','KLM',NULL,NULL);
SELECT COALESCE(NULL,NULL,NULL);
CREATE TABLE bank_details(account_number BIGINT PRIMARY KEY,customer_name VARCHAR(100) NOT NULL,email VARCHAR(100) UNIQUE,phone VARCHAR(15) UNIQUE);
INSERT INTO bank_details(account_number,customer_name,email,phone) VALUES
(1,'ABC','ABC@gmail.com',NULL),
(2,'CDF',NULL,'9876543210'),
(3,'KLM',NULL,NULL);
SELECT * FROM bank_details;
SELECT *,COALESCE(phone,email,'No contact details') FROM bank_details;
-- Multi row function
-- aggregate()
-- sum()
-- Find sum of salary from employee table
SELECT SUM(salary) AS 'total_salary' FROM employee;
-- Find average salary fro employee table
SELECT AVG(salary) AS 'average_salary' FROM employee;
-- max()
-- Find maximum salary
SELECT MAX(salary) AS 'Highest salary' FROM employee;
-- min()
SELECT MIN(salary) AS 'Highest salary' FROM employee;
-- count()
SELECT COUNT(emp_name) FROM employee;
-- Group_concat()
SELECT GROUP_CONCAT(department) FROM employee;
SELECT * FROM employee ORDER BY emp_name ASC;
SELECT emp_name,salary FROM employee ORDER BY salary ASC;
SELECT emp_name,salary FROM employee ORDER BY salary DESC;
CREATE TABLE sales(sales_id INT PRIMARY KEY,product_name VARCHAR(50),category VARCHAR(50),quantity INT,price DECIMAL(10,2),sales_date DATE);
INSERT INTO sales VALUES
(1,'Laptop','Electronics',2,50000,'2025-07-01'),
(2,'Smartphone','Electronics',5,20000,'2025-07-02'),
(3,'Laptop','Electronics',1,50000,'2025-07-02'),
(4,'Tablet','Electronics',3,15000,'2025-07-03'),
(5,'Smartphone','Electronics',2,20000,'2025-07-03'),
(6,'Chair','Furniture',4,3000,'2025-07-01'),
(7,'Table','Furniture',1,7000,'2025-07-02'),
(8,'Chair','Furniture',2,3000,'2025-07-03');
SELECT product_name,SUM(quantity) FROM sales GROUP BY product_name;
SELECT product_name,SUM(quantity) AS "total_quantity" FROM sales GROUP BY product_name ORDER BY SUM(quantity) DESC;
SELECT product_name,COUNT(*) FROM sales GROUP BY product_name;
SELECT product_name,MAX(quantity*price) FROM sales GROUP BY product_name;
SELECT product_name,MIN(sales_date) AS "earliest_date" FROM sales GROUP BY product_name;
SELECT department,MAX(salary) FROM employee GROUP BY department;
SELECT * FROM sales;
DESC sales;
DROP TABLE sales;
USE student;
SELECT product_name,SUM(quantity) AS "total_quantity" FROM sales GROUP BY product_name HAVING SUM(quantity)>4;
SELECT category,SUM(quantity*price) AS "total_sales" FROM sales GROUP BY category HAVING total_sales>100000;
SELECT product_name,AVG(price) AS "average_amount" FROM sales GROUP BY product_name HAVING average_amount<20000;
SELECT department,SUM(salary) AS "total_salary" FROM employee WHERE working_days>25 GROUP BY department HAVING total_salary>70000 ORDER BY total_salary DESC;
UPDATE employee SET salary=120000 WHERE emp_id=101;
SELECT * FROM employee;
SELECT * FROM employee ORDER BY salary DESC LIMIT 2;
SELECT * FROM employee ORDER BY salary DESC LIMIT 1,2;
SELECT emp_name,salary FROM employee ORDER BY salary ASC LIMIT 5;
SELECT DISTINCT product_name FROM sales;
SELECT DISTINCT product_name,category FROM sales;
-- rank()
SELECT emp_id,emp_name,department,salary,RANK() OVER(ORDER BY salary DESC) FROM employee;
UPDATE employee SET salary=55000 WHERE emp_id=101;
INSERT INTO employee VALUES(107,'SDF','Finance',55000,4000,29);
-- dense_rank()
SELECT emp_id,emp_name,department,salary,DENSE_RANK() OVER(ORDER BY salary DESC) FROM employee;
-- row_number()
SELECT *,ROW_NUMBER() OVER(ORDER BY working_days ASC) FROM employee;
-- Regular expression
SELECT emp_id,emp_name,salary FROM employee WHERE emp_name REGEXP '^S';
SELECT emp_id,emp_name,department FROM employee WHERE emp_name REGEXP 'u$';
SELECT * FROM employee WHERE department REGEXP '[in]';
SELECT department,emp_name FROM employee WHERE department REGEXP '^..l';
SELECT emp_name,salary FROM employee WHERE emp_name REGEXP 'j.$';
SELECT emp_id,emp_name,department FROM employee WHERE department REGEXP '^..$';
SELECT * FROM employee WHERE department REGEXP '^[bcdfgh]';
SELECT * FROM employee WHERE department NOT REGEXP '^[aeiou]';






