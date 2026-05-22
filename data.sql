CREATE DATABASE Student;
USE Student;
CREATE TABLE student_details(student_id INT PRIMARY KEY,student_name VARCHAR(12),email VARCHAR(22));
CREATE TABLE Course(course_id INT PRIMARY KEY,course_name VARCHAR(15),duration INT);
CREATE TABLE student_course_details(student_id INT,course_id INT,marks INT);
SHOW TABLES;
DESCRIBE Course;
DESC student_details;
DESC student_course_details;
CREATE TABLE Customer(customer_id INT,first_name VARCHAR(10),last_name VARCHAR(10),last_login date,billAmount float);
DESC Customer;
DESC student_details;
INSERT INTO student_details VALUES(1,'ABC','ABC@gmail.com');
INSERT INTO student_details(student_name,student_id,email)
VALUES('IJK',2,'IJK@gmail.com');
SELECT * FROM student_details;
INSERT INTO student_details VALUES(3,'FGH','FGH@gmail.com'),(4,'MNP','MNP@gmail.com'),(5,'LMN','LMN@gmail.com');
ALTER TABLE student_details
ADD marks INT;
ALTER TABLE student_details
CHANGE student_name full_name VARCHAR(10);
ALTER TABLE student_details
MODIFY full_name VARCHAR(10);
ALTER TABLE student_details
MODIFY student_name VARCHAR(10);
ALTER TABLE student_details
CHANGE full_name student_name VARCHAR(100);
ALTER TABLE student_details
MODIFY student_id VARCHAR(10);
ALTER TABLE student_details
DROP COLUMN email;
DROP TABLE customer;
DROP DATABASE student;
TRUNCATE TABLE student_details;
RENAME TABLE student_details TO student_data;
SELECT * FROM student_data;
DELETE FROM student_data WHERE marks=80;
UPDATE student_data SET marks=70;
UPDATE student_data SET marks=marks+10;
INSERT INTO customer(customer_id,last_login) VALUES(1,'2009-07-09'),(2,'2010-06-04'),(3,'2012-12-09');
SELECT * FROM customer;
UPDATE student_data SET marks=marks+10 WHERE student_id=4;