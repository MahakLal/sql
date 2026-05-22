-- Disabling the autocommit option
-- disable=0 enable=1(default)
SET AUTOCOMMIT=0;
USE student;
SELECT * FROM student_data;
-- Insert transaction without commit/save
INSERT INTO student_data VALUES(7,'VDR',70);
-- Rollback/undo to check the record is not saved
ROLLBACK;
-- Insert transaction with commit/savepoint
INSERT INTO student_data VALUES(7,'VDR',70);
-- commiting/saving the transaction
COMMIT;
-- Rollback after commit
ROLLBACK;
INSERT INTO student_data VALUES(8,'HWZ',70);
INSERT INTO student_data VALUES(9,'KFT',70);
INSERT INTO student_data VALUES(10,'CDE',70);
ROLLBACK;
SELECT * FROM student_data;
-- Insert transaction using savepoint
-- transaction 1
INSERT INTO student_data VALUES(8,'HWZ',70);
SAVEPOINT step1;
-- transaction 2
INSERT INTO student_data VALUES(9,'KFT',70);
SAVEPOINT step2;
-- transaction 3
INSERT INTO student_data VALUES(10,'CDE',70);
SAVEPOINT step3;
-- Rollback till savepoint step2
ROLLBACK TO SAVEPOINT step2;