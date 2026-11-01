-- UNION and INTERSECT exercises 

/*
Task: Find the 4 products with the highest price and the 4 products with the highest price/weight ratio

Notes on task: 
- requirement: sort the rows by price DESC and select top 4 
- requirement: sort by a price to weight ratio DESC and select top 4 
- requirement: combine the two requirements in one query 

- does not specify data-quality validation rules
- does not specify how to handle products appearing in both rankings 
*/

-- Query for the first requirement
-- Returns all the columns for the products in product table 
-- Sorts the rows by price with the most expensive item on the top and selects top 4 as this was a requirement 
SELECT *
FROM products
ORDER BY price DESC 
LIMIT 4;

-- Query for the second requirement
-- Returns all the columns for the products in product table 
-- Sorts the rows by price to weight ratio 
-- selected the price/weight ratio AS ratio to inspect the result
-- Selects top 4 products 
SELECT *, price/weight AS ratio
FROM products
ORDER BY price / weight DESC 
LIMIT 4;

-- Third requirement: combine requirements 1 and 2 into one query 
-- UNION appends the result from query 2 to the results from query 1
-- Duplicate result rows are removed 
(
	SELECT *
	FROM products
	ORDER BY price DESC 
	LIMIT 4
)
UNION
(
	SELECT *
	FROM products
	ORDER BY price / weight DESC 
	LIMIT 4
);