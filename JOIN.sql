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

