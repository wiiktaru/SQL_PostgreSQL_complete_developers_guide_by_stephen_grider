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