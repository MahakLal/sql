USE student;
CREATE TABLE employee(emp_id INT,emp_name VARCHAR(100),department VARCHAR(50),salary DECIMAL(10,2),bonus DECIMAL(10,2),working_days INT);
INSERT INTO employee VALUES
(101,'ABC','HR',40000.00,5000.00,26),
(102,'MNP','Finance',55000.00,7000.00,22),
(103,'VWZ','Sales',30000.00,3000.00,28),
(104,'KSR','IT',75000.00,8000.00,30),
(105,'CDE','Marketing',32000.00,2500.00,20),
(106,'LMN','Sales',36000.00,4000.00,24);
SELECT * FROM new_table;
SELECT * FROM employee;
-- Calculate total compensation(salary+bonus)
SELECT *,salary+bonus FROM employee;
-- Aliasing the column name
SELECT *,salary+bonus AS total_compensation FROM employee;
SELECT *,salary-bonus AS deducted_compensation FROM employee;
SELECT emp_name,salary,salary-bonus AS deducted_salary FROM employee;
SELECT emp_name,department,salary,working_days,salary/working_days AS daily_salary FROM employee;
SELECT emp_id,emp_name,salary,salary+(salary*10)/100 AS hiked_salary FROM employee;
SELECT emp_id,emp_name,salary,salary*12 AS annual_salary FROM employee;
SELECT emp_id,emp_name,salary,salary*6 AS half_yearly_salary FROM employee;
SELECT emp_name,working_days,working_days%2 AS even_or_odd FROM employee;
SELECT 2=1 AS equal_operator;
SELECT '0.01'=0;
SELECT 0.01<>'0.01';
SELECT "sql"!="mysql";
SELECT 0.01<=2;
SELECT 2>=2;
SELECT '0.01'<=0;
SELECT * FROM employee WHERE department='HR';
SELECT emp_id,emp_name,department,salary FROM employee WHERE salary>50000;
SELECT emp_id,emp_name,department,salary FROM employee WHERE salary<30000;
SELECT * FROM employee WHERE department<>"Sales";
SELECT * FROM employee WHERE working_days<=26;
SELECT 2 BETWEEN 1 AND 3;
SELECT 6 BETWEEN 1 AND 5;
SELECT 'r' NOT BETWEEN 'q' AND 's';
SELECT 4 NOT BETWEEN 0 AND 3;
SELECT emp_id,emp_name,department,salary FROM employee WHERE salary BETWEEN 30000 AND 60000;
SELECT emp_id,emp_name,department,salary FROM employee WHERE salary NOT BETWEEN 30000 AND 60000;
SELECT 100 IS NULL;
SELECT 0 IS NULL;
SELECT NULL IS NULL;
SELECT emp_name,bonus FROM employee WHERE bonus IS NULL;
SELECT emp_name,bonus FROM employee WHERE bonus IS NOT NULL;
DELETE FROM employee;