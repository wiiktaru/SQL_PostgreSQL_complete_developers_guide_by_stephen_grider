-- JOIN exercises


/*
Task: For each comment show the contents of the comment and the username of the user who wrote the comment 
*/

-- Inspect the tables to better understand their structure and understand how comments are related to users  
SELECT * FROM comments;
SELECT * FROM users;

-- comments.user_id identifies the author
-- join to users.id so each comment can be displayed with its autohr's username
SELECT c.contents, u.username
FROM comments as c 
	JOIN users as u
	ON c.user_id = u.id;

/*
Notes on the query 
- Firstly the FROM statement selects all the rows from comments table 
- Secondly the JOIN satatement combines rows from the users table to comments table 
-> goes throw each row on comments table and tries to match it with a row on users table based on the matching statement 
*/


-- WHERE with JOIN 
/*
Task: who is commenting their own photos? 
Users can comment on photos that they posted. List the url and contents for every photo/comment where this occured
*/ 

-- Check the tables of interest to better understand the structure and the relationship between the tables
SELECT * FROM photos;
SELECT * FROM comments; 

/*
Notes on tables of interest
- url is stored in photos table in column called 'url'
- photos table references to users table with a column called 'user_id'

- contents is stored in comments table in a column called 'contents'
- comments table references to users table with a column called 'user_id'
- comments table references to photos table with a column called 'photo_id'

- the user_id column allows to compare the photo owner with the commenter, while photo_id connets each comment to its photo 
*/ 

-- JOIN connects each comment to the photo it belongs 
-- filters for comments where the commenter is also the photo owner 
-- SELECT clause returns requested URL and comment content 
SELECT p.url, c.contents
FROM photos AS p 
	JOIN comments AS c 
	ON p.id = c.photo_id 
	WHERE p.user_id = c.user_id; 


/*
Task: print the first name and last name of each user, then wheter or not they have paid for their order 
- a user might have more than on order, so they might show up twice. That is OK and with this taks we want to see their orders
*/ 

-- Check table of intersts to better understand the structure and the relationship between the tables 
SELECT * FROM users LIMIT 10; 
SELECT * FROM orders LIMIT 10; 

/*
Notes on tables 
- in users table user id (primary key) is stored in a column called 'id'
- in users table users first name is stored in a column called 'first_name'
- in users table users last name is stored in a column called 'last_name'

- orders table references to users table with a column called 'user_id'
- column called 'paid' stored the data about the orders payment status. Boolean data type. 'ture' = paid, 'false' = unpaid 
- each row in orders table represents an individual order
*/

-- Confirm that the orders payment status can only be paid/unpaid 
SELECT	DISTINCT(paid) 
FROM orders;

-- result: false and true 

-- Select the columns of interest from the tables and combine the users table to the orders table 
-- RIGHT JOIN connects each order to the user that placed the order and includes users with no orders
-- Tables are joined using matching values o.user_id and u.id 
SELECT	u.first_name AS first_name, 
		u.last_name AS last_name,
FROM orders AS o 
	RIGHT JOIN users AS u 
	ON o.user_id = u.id; 
		

