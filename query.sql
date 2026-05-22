USE world;
CREATE TABLE student(
student_id INT,
name VARCHAR(20) NOT NULL,
major VARCHAR(20) DEFAULT "undecided",
PRIMARY KEY(student_id));
INSERT INTO student(student_id,name) VALUES(1,'Jack');
INSERT INTO student VALUES(3,NULL,"Chemistry");
SELECT * FROM student;
DROP TABLE student;
INSERT INTO student VALUES(1,"Jack","Biology");
INSERT INTO student VALUES(2,"Kate","Sociology");
INSERT INTO student VALUES(3,"Claire","Chemistry");
INSERT INTO student VALUES(4,"Jack","Biology");
INSERT INTO student VALUES(5,"Mike","Computer Science");
UPDATE student
SET major="Bio"
WHERE major="Biology"; 
SET SQL_SAFE_UPDATES=OFF;
UPDATE student
SET major="Chemistry"
WHERE student_id=3;
UPDATE student
SET major="Biochemistry"
WHERE major="Bio" OR major="Chemistry";
UPDATE student
SET name="Tom",major="undecided"
WHERE student_id=1;
DELETE FROM student
WHERE student_id=5;
DELETE FROM student
WHERE name="Tom" AND major="undecided";
UPDATE student
SET major="undecided";
DROP TABLE student;
SELECT * FROM student 
ORDER BY student_id DESC;
SELECT * FROM student
ORDER BY major,student_id DESC;
SELECT * FROM student
ORDER BY student_id DESC
LIMIT 2;
SELECT * FROM student
WHERE major="Biology";
SELECT * FROM student
WHERE major IN("Biology","Chemistry") AND student_id>2;

 
