-- Sorting exercises 

/*
Task: Print all the details about different products. Sort them by price
*/ 

-- Check the products table to better understand the structure
SELECT * FROM products LIMIT 10; 

/*
Notes on products table 
- price is stored in a colum called 'price'
*/

-- Check distinct price values to better understand the data
-- ORDER BY is used for better readability of the result 
SELECT	DISTINCT(price)
FROM products
ORDER BY price; 

-- Check for negative and null price values by filtering the rows with WHERE clause 
SELECT * 
FROM products 
WHERE price < 0 OR price IS NULL; 

-- No rows returned 

-- Return all the product columns
-- ORDER BY sorst the result by price 
-- The task does not specify a sort direction, so ascending order is used 
SELECT * 
FROM products 
ORDER BY price; 


-- Primary and secondary sorting 
/*
Task: Print all the details about different products. Sort them by price and weight

Notes on task: 
- does not specify data-quality validation rules
*/ 

-- Check a set of data from table of interest to better understand the structure 
SELECT * FROM products
LIMIT 10; 

/*
Notes from table of interest:
- price is stored in a column called "price"
- weight is stored in a column called "weight"
*/

-- Returns all the product columns. 
-- The results are sorted by price first. For rows with equal prices, weight determines the secondary order
-- The task does not specify a sort direction, so ascending order is used 
SELECT * FROM products 
ORDER BY price ASC, weight ASC;