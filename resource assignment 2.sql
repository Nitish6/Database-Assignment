
-- creating location table

CREATE TABLE `sales`.`location`( 
   `Location_Id` INT(11) NOT NULL AUTO_INCREMENT UNIQUE, 
   `Location_Name` VARCHAR(500)
 )
 
 INSERT INTO sales.location(Location_Id, Location_Name) VALUES (1, 'Indore');
 INSERT INTO sales.location(Location_Name) VALUES ('Pune');
 INSERT INTO sales.location(Location_Name) VALUES ('Bangalore');
 INSERT INTO sales.location(Location_Name) VALUES ('Mumbai');

SELECT * FROM location;

-- modifying resource table

 UPDATE sales.resource SET location_id = 1 WHERE id = 1;
 UPDATE sales.resource SET location_id = 1 WHERE id = 2;
 UPDATE sales.resource SET location_id = 2 WHERE id = 3;
 UPDATE sales.resource SET location_id = 3 WHERE id = 4;
 UPDATE sales.resource SET location_id = 1 WHERE id = 5;
 UPDATE sales.resource SET location_id = 2 WHERE id = 6;
 UPDATE sales.resource SET location_id = 1 WHERE id = 7;
 UPDATE sales.resource SET location_id = 2 WHERE id = 8;
 UPDATE sales.resource SET location_id = 3 WHERE id = 10;
 UPDATE sales.resource SET location_id = 2 WHERE id = 11;
 
 ALTER TABLE sales.resource ADD FOREIGN KEY (Location_id) REFERENCES sales.location(Location_id);
 
 SELECT * FROM sales.resource;
 

-- creating resource hours table

 CREATE TABLE `sales`.`resourcehours`( 
   `resourcehrs_ID` INT(11) NOT NULL AUTO_INCREMENT UNIQUE, 
   `resourceid` INT(11) , 
   `hours` INT(11) , 
   `week_endDate` DATE
 )

 INSERT INTO sales.resourcehours(resourcehrs_ID, resourceid, hours, week_endDate) VALUES (1, 1, 8, '2014-12-26');
 INSERT INTO sales.resourcehours(resourceid, hours, week_endDate) VALUES (2, 9, '2014-12-26');
 INSERT INTO sales.resourcehours(resourceid, hours, week_endDate) VALUES (3, 2, '2014-12-26');
 INSERT INTO sales.resourcehours(resourceid, hours, week_endDate) VALUES (4, 3, '2014-12-26');
 INSERT INTO sales.resourcehours(resourceid, hours, week_endDate) VALUES (5, 5, '2015-06-26');
 INSERT INTO sales.resourcehours(resourceid, hours, week_endDate) VALUES (2, 8, '2015-06-26');
 INSERT INTO sales.resourcehours(resourceid, hours, week_endDate) VALUES (1, 7, '2015-06-26');
 
 
 SELECT * FROM resourcehours
 
-- creating project table

 CREATE TABLE `sales`.`project`( 
   `Project_Id` INT(11) NOT NULL AUTO_INCREMENT UNIQUE, 
   `Project_Name` VARCHAR(500),
   `location_id` INT(11),
    FOREIGN KEY (location_id) REFERENCES location(location_id)
 )
 
  INSERT INTO sales.project(Project_Id, Project_Name, location_id) VALUES (1, 'project1', 1);
  INSERT INTO sales.project(Project_Name, location_id) VALUES ('project2', 1);
  INSERT INTO sales.project(Project_Name, location_id) VALUES ('project3', 3);
  INSERT INTO sales.project(Project_Name, location_id) VALUES ('project4', 4);
  
  ALTER TABLE sales.resourcehours ADD FOREIGN KEY (resourceid) REFERENCES sales.resource(id);
  
-- 1 List out resource name ,date_of_joining,location  od resource whose years_of_exp is more than 2 years

SELECT resource.Ename, resource.Date_Of_Joining, location.Location_Name FROM resource INNER JOIN location ON 
   resource.location_id = location.Location_Id WHERE resource.Years_Of_Exp > 2;
   
-- 2 Find the employee which maximum experience

SELECT resource.Ename, MAX(resource.Years_Of_Exp) FROM resource;

-- 3 Find the resource with Indore location 
SELECT resource.Ename, location.Location_Name FROM resource INNER JOIN location ON 
   resource.location_id = location.Location_Id WHERE location.Location_Name = 'Indore';
   
-- 4 Find the resource name,hours ,location ,week_end_date
SELECT resource.Ename, resourcehours.hours, resourcehours.week_endDate, location.Location_Name FROM resource INNER JOIN location ON
 resource.location_id = location.Location_Id INNER JOIN resourcehours ON resourcehours.resourceid = resource.Id; 

-- 5 Delete record from location table with location name as Mumbai

SET FOREIGN_KEY_CHECKS=0;

DELETE FROM location WHERE location.Location_Name = 'mumbai';

SET FOREIGN_KEY_CHECKS=1;

-- 6 Make listing of all the records from all the tables using inner join 

SELECT resource.Ename, resource.Yash_EmpID, resource.Years_Of_Exp, resourcehours.hours, resourcehours.resourcehrs_ID,
       resourcehours.week_endDate, location.Location_Id, location.Location_Name FROM resource INNER JOIN location ON
          resource.location_id = location.Location_Id INNER JOIN resourcehours ON resourcehours.resourceid = resource.Id; 

-- 7 Drop primary key  and foreign key constraint from project table (Drop constraint not the columns)

ALTER TABLE sales.project DROP FOREIGN KEY location_id;
ALTER TABLE sales.project DROP PRIMARY KEY;
