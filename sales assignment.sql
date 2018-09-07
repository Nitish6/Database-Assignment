
-- creating customer table

CREATE TABLE `sales`.`customer`( 
   `cnum` INT(11) NOT NULL AUTO_INCREMENT UNIQUE, 
   `cname` VARCHAR(255) , 
   `city` VARCHAR(255) , 
   `snum` INT(11), 
   `rating` INT(11),
   FOREIGN KEY (snum) REFERENCES salepeople(snum)
 )
 
INSERT INTO sales.customer(cnum, cname, city, snum, rating) VALUES (2001, 'KELVIN', 'SANJOSE', 1007, 200);
INSERT INTO sales.customer(cname, city, snum, rating) VALUES ('GIOVANNI', 'ROME', 1003, 200);
INSERT INTO sales.customer(cname, city, snum, rating) VALUES ('LIU', 'SANJOSE', 1002, 200);
INSERT INTO sales.customer(cname, city, snum, rating) VALUES ('GRASS', 'BARLIN', 1002, 300);
INSERT INTO sales.customer(cname, city, snum, rating) VALUES ('CLEMENS', 'LONDON', 1001, 100);
INSERT INTO sales.customer(cname, city, snum, rating) VALUES ('PEREIRA', 'ROME', 1004, 100);
INSERT INTO sales.customer(cname, city, snum, rating) VALUES ('CISNEROS', 'SANJOSE', 1007, 300);

 SELECT * FROM sales.customer;
 
 
 -- creating salepeople table
 
 INSERT INTO sales.salepeople(snum, sname, city, comm) VALUES (1001, 'PEEL', 'LONDON', 12);
INSERT INTO sales.salepeople(sname, city, comm) VALUES ('SERRES', 'SANJOSE', 14);
INSERT INTO sales.salepeople(sname, city, comm) VALUES ('AXCELROD', 'NEW YORK', 10);
INSERT INTO sales.salepeople(sname, city, comm) VALUES ('MOTIKA', 'LONDON', 11);
INSERT INTO sales.salepeople(sname, city, comm) VALUES ('FRAN', 'LONDON', 26);
INSERT INTO sales.salepeople(sname, city, comm) VALUES ('RIKKLIN', 'BARCELONA', 21);

SELECT * FROM salepeople;


-- creating order table

CREATE TABLE `sales`.`orders`( 
   `onum` INT(11) , 
   `amount` DECIMAL(10,2) , 
   `snum` INT(11) , 
   `cnum` INT(11), 
   `odate` DATE,
    FOREIGN KEY (snum) REFERENCES salepeople(snum),
    FOREIGN KEY (cnum) REFERENCES customer(cnum)
 )
 
INSERT INTO sales.orders(onum, amount, snum, cnum, odate) VALUES (3001, 18.69, 1007, 2008, '1996-03-10');
INSERT INTO sales.orders(onum, amount, snum, cnum, odate) VALUES (3003, 890, 1001, 2001, '1996-03-10');
INSERT INTO sales.orders(onum, amount, snum, cnum, odate) VALUES (3002, 1900.1, 1004, 2007, '1996-03-10');
INSERT INTO sales.orders(onum, amount, snum, cnum, odate) VALUES (3005, 5160.45, 1002, 2003, '1996-03-10');
INSERT INTO sales.orders(onum, amount, snum, cnum, odate) VALUES (3006, 1098.16, 1007, 2008, '1996-03-10');
INSERT INTO sales.orders(onum, amount, snum, cnum, odate) VALUES (3009, 1713.23, 1003, 2002, '1996-04-10');
INSERT INTO sales.orders(onum, amount, snum, cnum, odate) VALUES (3007, 75.75, 1003, 2002, '1996-04-10');
INSERT INTO sales.orders(onum, amount, snum, cnum, odate) VALUES (3008, 4723, 1001, 2006, '1996-05-10');
INSERT INTO sales.orders(onum, amount, snum, cnum, odate) VALUES (3010, 1309.95, 1002, 2004, '1996-06-10');
INSERT INTO sales.orders(onum, amount, snum, cnum, odate) VALUES (3011, 9891.8, 1001, 2006, '1996-06-10');


-- 1 Count the number of Non NULL rating fields in the Customers table (including repeats)
SELECT COUNT(*) total_not_null_fields FROM sales.customer WHERE rating IS NOT NULL;

-- 2 Write a query that gives the names of both the salesperson and the customer for each order after the order number
SELECT salepeople.sname, customer.cname, orders.onum FROM ((orders INNER JOIN customer ON orders.cnum = customer.cnum)
INNER JOIN salepeople ON salepeople.snum = customer.snum);

-- 3 Count the number of Salespeople registering orders for each day. (If a salespersons has more than one order on given day, he or she should be counted only once).
SELECT orders.odate, COUNT(DISTINCT(orders.snum)) FROM orders GROUP BY orders.odate; 

-- 4  Find all orders attributed to salespeople in London.
SELECT salepeople.sname, salepeople.city, orders.onum FROM salepeople INNER JOIN orders ON salepeople.snum = orders.snum WHERE salepeople.city = 'LONDON';

-- 5 Find all salespeople who have customers with more than one current order
SELECT salepeople.sname FROM salepeople INNER JOIN orders ON salepeople.snum = orders.snum GROUP BY orders.snum HAVING COUNT(*) > 1;

-- 6  Write a query that selects all customers whose names begins with ‘C’.
SELECT customer.cname FROM sales.customer WHERE customer.cname LIKE 'C%';

-- 7  Write a query on the Customers table that will find the highest rating in each city. Put the output in this form: for the City (city) the highest rating is: (rating)
SELECT customer.city, MAX(customer.rating) FROM customer GROUP BY customer.city;

-- 8 Write a query that selects each customer’s smallest order.
SELECT customer.cname, MIN(orders.amount) FROM customer INNER JOIN orders ON customer.cnum = orders.cnum GROUP BY customer.cname;

-- 9 Write a query that selects the first customer in alphabetical order whose name begins with G
SELECT customer.cname FROM sales.customer WHERE customer.cname LIKE 'G%' ORDER BY customer.cname ASC LIMIT 1;

-- 10 Write a query that counts the number of different non NULL city values in the Customers table
SELECT city, COUNT(*) total_not_null_fields FROM sales.customer WHERE customer.city IS NOT NULL GROUP BY customer.city;

-- 11 Find the average amount from the Orders table.
SELECT AVG(orders.amount) FROM sales.orders;

-- 12  Find all customers who are not located in San Jose and whose rating is above 200
SELECT customer.cname FROM sales.customer WHERE customer.city = 'SANJOSE' AND customer.rating >= 200;

-- 14 Find all records in the Customer table with NULL values in the city column
SELECT customer.city FROM sales.customer WHERE customer.city IS NOT NULL;

-- 15 Arrange the Orders table by descending customer number.
SELECT * FROM sales.orders ORDER BY orders.cnum DESC;

-- 16 Find which salespeople currently have orders in the Orders table.
SELECT salepeople.sname FROM salepeople INNER JOIN orders ON salepeople.snum = orders.snum GROUP BY orders.snum;

-- 17 Find the names and numbers of all salespeople who had more the one customer.
SELECT salepeople.sname, salepeople.snum FROM salepeople INNER JOIN customer ON salepeople.snum = customer.snum GROUP BY customer.snum HAVING COUNT(*) > 1;

-- 18 Count the orders of each of the salespeople and output the results in descending order.
SELECT COUNT(orders.onum), orders.snum FROM orders GROUP BY orders.snum ORDER BY COUNT(orders.onum) DESC;

-- 19 List the Customer table if and only if one or more of the Customers in the Customer table are located in San Jose.
SELECT * FROM sales.customer WHERE customer.city = 'SANJOSE';

-- 20 Find the largest order taken by each salesperson.
SELECT salepeople.sname, MAX(orders.amount) FROM salepeople INNER JOIN orders ON salepeople.snum = orders.snum GROUP BY orders.snum;

-- 21 Find customers in San Jose who have a rating above 200.
SELECT sales.customer.cname FROM customer WHERE customer.city = 'SANJOSE' AND customer.rating > 200;

-- 22 List all the orders of salesperson Motika from the Orders table
SELECT orders.onum FROM salepeople INNER JOIN orders ON salepeople.snum = orders.snum WHERE salepeople.sname = 'Motika';

-- 23 Find salespeople who have multiple customers.
SELECT salepeople.sname FROM salepeople INNER JOIN customer ON salepeople.snum = customer.snum GROUP BY customer.snum HAVING COUNT(*) > 1; 

-- 24 Find salespeople with customers located in their city.
SELECT salepeople.sname FROM salepeople WHERE salepeople.snum IN (SELECT customer.snum FROM customer WHERE customer.city = salepeople.city);

-- 25 Find the largest orders for serres and Rifkin.
SELECT salepeople.sname, MAX(orders.amount) FROM salepeople INNER JOIN orders ON salepeople.snum = orders.snum WHERE salepeople.sname IN ('RIKKLIN', 'serres') GROUP BY salepeople.sname;

-- 26 Find all salespeople that are located in either Barcelona or London.
SELECT salepeople.sname FROM salepeople WHERE salepeople.city IN ('Barcelona' , 'london');

-- 27 Find all salespeople with only one customer
SELECT salepeople.sname FROM salepeople INNER JOIN customer ON salepeople.snum = customer.snum GROUP BY customer.snum HAVING COUNT(*) = 1; 

-- 28 Find salespeople whose sales is greater the avg sales
SELECT DISTINCT(salepeople.sname) FROM sales.salepeople INNER JOIN sales.orders ON salepeople.snum = orders.snum WHERE orders.amount > (SELECT AVG(orders.amount) FROM orders);
