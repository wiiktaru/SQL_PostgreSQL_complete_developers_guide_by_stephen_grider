-- AGGREGATING and GROUPING exercises 

/*
Task: find the number of comments for each photo
*/ 

-- Check the tables of interest for better understanding the structure 
SELECT * FROM comments;
SELECT * FROM photos; 

/*
Notes on table of interest
- comments are stored in comments table in a column called 'contents'
- comments table is referencing to a photo with a column called 'photo_id'

- photo id (primary key) is stored in photos table in a column called 'id'
*/ 

-- Uses LEFT JOIN to include photos that have no comments 
-- GROUP BY groups photo rows by photo id so each photo has  one group 
-- COUNT(c.photo_id) counts each photo_id in each subgroup. Count(column) ignores NULL photo_id values
-- COUNT returns zero for photos without comments 
SELECT 	p.id AS photo_id, 
		COUNT(c.photo_id) AS count_of_comments
FROM photos AS p 
	LEFT JOIN comments AS c 
	ON c.photo_id = p.id
GROUP BY p.id; 