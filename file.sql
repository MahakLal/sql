USE student;
SELECT * FROM student_data;
INSERT INTO student_data VALUES(6,'RST',70);
SELECT * FROM customer;
SELECT 2 IN (1,2,3,4);
SELECT 0 IN (1,2,0,5,6);
-- non numeric string value will be considered as 0
SELECT 0 IN (1,2,3,"ABC");
SELECT 0 IN (1,2,3,"1206");
SELECT 0 IN (1,2,3,"0");
SELECT 6 IN (1,2,3,"ABC");
SELECT 11 IN (11,22,33,44,55);
SELECT 0 NOT IN (1,2,0,5,6);
SELECT 0 IN (1,2,3,"ABC");
SELECT 6 NOT IN (1,2,3,"ABC");
SELECT 11 NOT IN (11,22,33,44,55);
SELECT * FROM employee WHERE department IN ('HR','IT');
SELECT emp_name,department FROM employee WHERE department NOT IN ('HR','IT');
SELECT * FROM employee WHERE emp_id IN (101,109,111);
SELECT emp_name,salary,department FROM employee WHERE emp_name NOT IN ('ABC','CDE','VWZ','LMN');
SELECT * FROM employee WHERE emp_name LIKE 'A%';
SELECT * FROM employee WHERE emp_name LIKE '%E';
SELECT * FROM employee WHERE emp_name LIKE '___';
SELECT emp_name,department FROM employee WHERE department LIKE '%an%';
SELECT * FROM employee WHERE emp_name NOT LIKE 'A%';
SELECT department FROM employee WHERE department NOT LIKE '%le%';
SELECT emp_name FROM employee WHERE emp_name LIKE '__C%';
SELECT * FROM employee WHERE emp_name NOT LIKE '_B%';
SELECT emp_name,salary,department FROM employee WHERE department='IT' AND salary>40000;
SELECT * FROM employee WHERE department='HR' OR salary<30000;
SELECT * FROM employee WHERE NOT department='Sales';
SELECT * FROM employee WHERE salary>60000 XOR department='HR';
CREATE TABLE product(product_id INT,product_name VARCHAR(100),category VARCHAR(50),price DECIMAL(10,2),stock INT);
INSERT INTO product(product_id,product_name,category,price,stock) 
VALUES(201,'Laptop','Electronics',55000.00,15),
(202,'Chair','Furniture',4500.00,30),
(203,'Bluetooth Earbuds','Electronics',2200.00,50),
(204,'Whiteboard','Stationary',1500.00,25),
(205,'Water Bottle','Accessories',299.00,100),
(206,'Pen','Stationary',10.00,50),
(207,'Laptop Bags','Accessories',1000.00,25),
(208,'Laptop Charger','Electronics',7200.00,10);
SELECT * FROM product;
SELECT product_name FROM product WHERE category='Electronics' AND price>5000;
SELECT * FROM product WHERE category='Furniture' OR stock>80;
SELECT * FROM product WHERE NOT category='Electronics';
SELECT * FROM product WHERE category='Electronics' XOR price<1000;
CREATE DATABASE student_details;
USE student_details;
CREATE TABLE employee(emp_id VARCHAR(10),emp_name VARCHAR(20) NOT NULL);
SELECT * FROM employee;
DESC employee;
INSERT INTO employee VALUES(101,'ABC');
DROP TABLE employee;
CREATE TABLE employee(emp_name VARCHAR(20) NOT NULL,email VARCHAR(30) UNIQUE);
SELECT * FROM employee;
DESC employee;
INSERT INTO employee VALUES('ABC','ABC@gmail.com');
CREATE TABLE student(student_id INT UNIQUE,student_name VARCHAR(20) NOT NULL,country VARCHAR(15) DEFAULT 'India');
DESC student;
DROP TABLE student;
INSERT INTO student VALUES(101,'ABC','USA');
INSERT INTO student(student_id,student_name) VALUES(102,'CDE');
INSERT INTO student VALUES(103,'LMN','UK');
INSERT INTO student(student_id,student_name) VALUES(104,'VWZ');
SELECT * FROM student;
CREATE TABLE employee_details(employee_id INT UNIQUE,employee_name VARCHAR(20) NOT NULL,salary INT CHECK(salary>=30000 AND salary<=60000));
SELECT * FROM employee_details;
INSERT INTO employee_details VALUES(101,'ABC',40000);
INSERT INTO employee_details VALUES(101,'ABC',70000);
CREATE TABLE insurance(insurance_number INT UNSIGNED,insurance_name VARCHAR(10));
DESC insurance;
INSERT INTO insurance VALUES(101,'ABC');
SELECT * FROM insurance;
CREATE TABLE passport(passport_number VARCHAR(20) PRIMARY KEY,candidate_name VARCHAR(30) NOT NULL);
DESC passport;
INSERT INTO passport VALUES('abc123','ABC');
SELECT * FROM passport;
CREATE TABLE item(item_number INT PRIMARY KEY AUTO_INCREMENT,item_name VARCHAR(20) DEFAULT 'Laptop');
DESC item;
INSERT INTO item VALUES(100,'Keyboard');
SELECT * FROM item;
INSERT INTO item VALUES();
INSERT INTO item(item_name) VALUES('Monitor');
INSERT INTO item VALUES(110,'Computer');
INSERT INTO item VALUES();
DROP TABLE item;
-- Foreign key constraint
-- parent table
CREATE TABLE department(department_id INT PRIMARY KEY,department_name VARCHAR(30) NOT NULL);
DESC department;
-- child table
CREATE TABLE employee_data(emp_id INT PRIMARY KEY,emp_name VARCHAR(20) NOT NULL,department_id INT,FOREIGN KEY(department_id) REFERENCES department(department_id));
DESC employee_data;
-- inserting value to parent table(department)
INSERT INTO department VALUES(101,'IT');
SELECT * FROM department;
SELECT * FROM employee_data;
-- inserting value to child table(employee_data)
INSERT INTO employee_data VALUES(1,'ABC',101);
-- violating the foreign key constraint
INSERT INTO employee_data VALUES(2,'CDE',102);
INSERT INTO department VALUES(102,'HR');
INSERT INTO employee_data VALUES(2,'CDE',102);
-- drop table
-- drop child table first and then parent table
DROP TABLE employee_data;
DROP TABLE department;