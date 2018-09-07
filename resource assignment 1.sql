
-- 1
CREATE TABLE `sales`.`resource`( 
   `Id` INT(11) NOT NULL AUTO_INCREMENT UNIQUE, 
   `Ename` VARCHAR(500) , 
   `Date_Of_Joining` DATE , 
   `Years_Of_Exp` INT(11), 
   `Yash_EmpID` VARCHAR(500)
 )

-- 2 
INSERT INTO sales.resource(Id, Ename, Date_Of_Joining, Years_Of_Exp, Yash_EmpID) VALUES (1, 'Amol Nilkanth Bagal', '2014-01-20', 1, '1002899');
INSERT INTO sales.resource(Ename, Date_Of_Joining, Years_Of_Exp, Yash_EmpID) VALUES ('Manohar Singh', '2012-09-10', 10, '1001553');
INSERT INTO sales.resource(Ename, Date_Of_Joining, Years_Of_Exp, Yash_EmpID) VALUES ('Nitish Aggarwal', '2008-03-28', 2, '1000193');
INSERT INTO sales.resource(Ename, Date_Of_Joining, Years_Of_Exp, Yash_EmpID) VALUES ('Sonali Uttam Mane', '2015-03-09', 3, '1003719');
INSERT INTO sales.resource(Ename, Date_Of_Joining, Years_Of_Exp, Yash_EmpID) VALUES ('Ruchi Soni', '2015-03-26', 4, '1003813');
INSERT INTO sales.resource(Ename, Date_Of_Joining, Years_Of_Exp, Yash_EmpID) VALUES ('Kartik Dharmendra Jalgaonkar', '2014-12-01', 8, '1003549');
INSERT INTO sales.resource(Ename, Date_Of_Joining, Years_Of_Exp, Yash_EmpID) VALUES ('Charu Dubey', '2014-03-13', 6, '1003054');
INSERT INTO sales.resource(Ename, Date_Of_Joining, Years_Of_Exp, Yash_EmpID) VALUES ('Nikhil Bhagwantrao Raut', '2014-05-19', 7, '1003177');
INSERT INTO sales.resource(Ename, Date_Of_Joining, Years_Of_Exp, Yash_EmpID) VALUES ('Vishal Khandu Kumkar', '2012-05-25', 5, '1001285');
INSERT INTO sales.resource(Ename, Date_Of_Joining, Years_Of_Exp, Yash_EmpID) VALUES ('Isha Tiwari', '2015-04-27', 2, '1003927');
INSERT INTO sales.resource(Ename, Date_Of_Joining, Years_Of_Exp, Yash_EmpID) VALUES ('Dharmendra Biswal', '2015-04-30', 5, '1003999');


-- 3- Update Years of exp Kartik  to 8 from 10
UPDATE sales.resource SET resource.Years_Of_Exp = 8 WHERE resource.Id = 6;

-- 4- Delete record of Vishal
DELETE FROM sales.resource WHERE resource.Id = 9;

-- 5- Alter  table to add location column 
ALTER TABLE sales.resource ADD COLUMN location_id VARCHAR(255) AFTER Yash_EmpID;

-- 6- Make id as primary key
ALTER TABLE sales.resource CHANGE Id Id INT(11) NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY(Id);

-- 7- Alter  table to drop column years_of_exp 
ALTER TABLE sales.resource DROP COLUMN resource.Years_Of_Exp;

-- 8- Alter table to change the datatype of primary key column to Bigint
ALTER TABLE sales.resource CHANGE Id Id BIGINT(20);

-- 9- Write a select statement to view all the from the table created
SELECT * FROM sales.resource;

-- 10- Write a select statement to view data in the increasing order of date_of_joining
SELECT * FROM sales.resource ORDER BY resource.Date_Of_Joining ASC;

-- 11- Write a select statement to view data in the decreasing order of date_of_joining
SELECT * FROM sales.resource ORDER BY resource.Date_Of_Joining DESC;
