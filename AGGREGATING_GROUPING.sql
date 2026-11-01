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


-- HAVING 
/*
Task: Find the number of comments for each photo where the photo_id is less than 3 and the photo has more than 2 comments
*/ 


-- Check the table of interest for better understanding of the structure 
SELECT * FROM comments LIMIT 10;


/*
Notes on table of interest
- comment are stored in a column called 'contents'
- photo that the comment belongs to is stored in a column called 'photo_id'
*/ 

-- Filters all the rows with the criteria "photo_id is less than 3" using WHERE 
-- Uses GROUP BY to group the comments by photo_id 
-- Counts all the rows in the groups
-- Filters the groups with the criteria "photos has more than 2 comments" using HAVING 
SELECT	photo_id, 
		COUNT(*)
FROM comments 
WHERE photo_id < 3 
GROUP BY photo_id 
HAVING COUNT(*) > 2; 