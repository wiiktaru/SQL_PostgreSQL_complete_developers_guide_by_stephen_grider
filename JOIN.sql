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




