-- Subquery exercises 

/*
Task: print the name and price for each phone. In addition, print out the ratio of the phones price against max price of 
all phones. Rename this third column to price_ratio
*/

--Check the table of interest to better understand the structure
SELECT * 
FROM phones 
LIMIT 10;

/*
Notes on the phones table
- name is stored in a column called name 
- price is stored in a column called ”price” 
*/

--returns colums name and price from the phones table as required 
--The scalar subquery returns the maximum phone price, which is used as the denominator for each phone's price ratio 
--the calculated third column is named price_ratio as required 
SELECT name, price, price / (
	SELECT MAX(price)
	FROM phones
) AS price_ratio
FROM phones; 


-- Subquery in a FROM 

/*
Task: Find the average number of orders for all users using 'FROM' subquery 
--Task assumes that every user has at least one order, regardless of wheter the order is paid
*/

--Check the table of interest to better understand the structure 
SELECT * 
FROM orders
LIMIT 10;

/*
Notes about the orders table 
-- user is stored in a column called user_id 
-- column called id identifies an order 
--every row is one order 
--every order has a boolean value ”true” if paid and ”false” if not paid
*/

--Counts the number of orders made by a user
-- GROUP BY creates a group for each individual user and signs every order to its user
-- COUNT count the orders in each group 
SELECT user_id, COUNT(*) AS order_count
FROM orders
GROUP BY user_id;

-- An aggregate funciont AVG is applied to the single column of values that are provided by the Subquery from the FROM clause
SELECT AVG(order_count)
FROM (
	SELECT user_id, COUNT(*) AS order_count
	FROM orders
	GROUP BY user_id
) AS o; 


-- Another subquery in a FROM 

/*
Task: Calculate the average price of phones for each manufacturer. Then print the highest average price. Rename this value to max_average_price
*/

--Check the phones table to better understand the structure 
SELECT * 
FROM phones
LIMIT 5;

/*
Notes on phones table
--column called ”manufacturer” identifies manufacturer
--column called ”price” saves the price data 
*/

--GROUP BY creates a group for each individual manufacturer and signs every phone to its manufacturer 
--Aggregation function AVG calculates the required average price of phone for every subgroup
SELECT manufacturer, AVG(price) AS avg_price
FROM phones 
GROUP BY manufacturer;

--The inner query calculates one average per manufacturer. The outer query applies MAX() to those average values to return the highest manufacturer-level average
--Result is stored in an alias column max_average_price as required 
SELECT MAX(avg_price) AS max_average_price 
FROM (
	SELECT manufacturer, AVG(price) AS avg_price
	FROM phones
	GROUP BY manufacturer
) AS manufacturer_averages;