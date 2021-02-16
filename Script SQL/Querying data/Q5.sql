-- Question 5 :  Data insertion

------------------------------------------------------------
-- [1] What is the list of database users ?
------------------------------------------------------------
SELECT * FROM Users;

-----------------------------------------------------------------
-- [2] How many different countries are the origins of DB users ? 
-----------------------------------------------------------------
SELECT COUNT(DISTINCT country) 
FROM Users; 

------------------------------------------------------------
-- [3] Who are the users from Brazil, sorted by Name ?
------------------------------------------------------------
SELECT * 
FROM Users 
WHERE country = 'Brazil' 
ORDER BY name_users;

------------------------------------------------------------
-- [4] How many users are there in every French city ?
------------------------------------------------------------
SELECT city_of_residence, COUNT(city_of_residence) 
FROM Users 
WHERE Country = 'France' 
GROUP BY city_of_residence;

-------------------------------------------------------------
-- [5] How many accounts were created between 2010 and 2017 ?
-------------------------------------------------------------
SELECT COUNT(registration_date) 
FROM registration_historical 
WHERE registration_date > '2010-01-01' AND  registration_date < '2017-01-01';

------------------------------------------------------------------------------------------
-- [6] What publications of less than 100 characters have obtained more than 100 "likes" ?
------------------------------------------------------------------------------------------
SELECT * 
FROM Publications 
WHERE LENGTH(text_publi) < 100 AND like_number > 100;

------------------------------------------------------------------
-- [7] Who are friends with "Kevin75", ordred by decreasing date ?
------------------------------------------------------------------
SELECT nickname_users, start_date
FROM Friend 
WHERE nickname = 'Kevin75' 
ORDER BY start_date DESC;

----------------------------------------------------------------------------
-- [8] Which users living in London, ordred by increasing number of friends. 
----------------------------------------------------------------------------
SELECT Users.nickname
FROM Users
INNER JOIN Friend ON Users.nickname = Friend.nickname 
WHERE city_of_residence = 'London' 
GROUP BY Users.nickname
ORDER BY COUNT(Friend.nickname);

------------------------------------------------------------
-- [9] Which group has the most members ?
------------------------------------------------------------
SELECT  Member_of.group_ID, COUNT(Member_of.group_ID)
FROM Member_of
INNER JOIN Groupes ON Groupes.group_ID = Member_of.group_ID 
GROUP BY Member_of.group_ID
ORDER BY COUNT(Member_of.group_ID) DESC
LIMIT 1;

-------------------------------------------------------------------
-- [10] In group "Flat Earth Society" are there more men or women ? 
-------------------------------------------------------------------
SELECT gender, COUNT(gender)
FROM Users
INNER JOIN Member_of ON Users.Nickname = Member_of.Nickname 
INNER JOIN Groupes ON Member_of.group_ID = Groupes.Group_ID 
WHERE Groupes.group_name = 'Flat Earth Society'
GROUP BY gender 
LIMIT 1;

--------------------------------------------------------------------------------------------------------------------------
-- [11] See which pages on average receive more than 5 "likes" per publication, ranked by the average of number of "like". 
--------------------------------------------------------------------------------------------------------------------------
SELECT page_name,AVG(like_number)
FROM(SELECT pages.page_name,publications.like_number
FROM pages
INNER JOIN have ON pages.page_id=have.page_id
INNER JOIN publications ON have.publication_id=publications.publication_id )AS like_number
GROUP BY Page_name
HAVING AVG(like_number) > 5
ORDER BY AVG(like_number);

---------------------------------------------------------------------
-- [12] For each page, display the publication with the most "likes". 
---------------------------------------------------------------------
SELECT page_name, title, MAX
FROM publications
INNER JOIN (SELECT pages.page_name, MAX(publications.like_number)
			FROM pages
			INNER JOIN have ON pages.page_id=have.page_id
			INNER JOIN publications ON have.publication_id=publications.publication_id
			GROUP BY pages.page_name) AS test ON MAX=publications.like_number;

--------------------------------------------------------------------------------------------------------------------------------------
-- [13] Display the groups of which at least half the members have more than 5 "like" on average over the publications of their pages.
--------------------------------------------------------------------------------------------------------------------------------------
SELECT nickname,AVG(like_number)
FROM (SELECT page_name,pages.nickname,pages.page_id,have.publication_id,publications.like_number
	  FROM pages
	  INNER JOIN have ON have.page_id = pages.page_id
	  INNER JOIN publications ON publications.publication_id = have.publication_id
	  GROUP BY pages.nickname,page_name,pages.page_id,have.publication_id,publications.like_number) AS test

GROUP BY page_name,nickname,page_id
HAVING avg(like_number)>100

--------------------------------------------------------------------------
-- [14] See the average number of publications containing words " Trump ". 
--------------------------------------------------------------------------
SELECT AVG(Trump) / AVG(Publications)
FROM
(SELECT (SELECT COUNT(publication_ID) FROM Publications WHERE text_publi LIKE '%Trump%') AS Trump,
        (SELECT COUNT(publication_ID) FROM Publications) AS Publications)AS Counter;

----------------------------------------------------------------------
-- [15] Which users have published on the pages of all their friends ? 
----------------------------------------------------------------------
SELECT Friend.nickname_Users2
FROM Friend 
INNER JOIN Users ON Users.nickname = Friend.nickname_Users1
INNER JOIN Pages ON Users.nickname = Pages.nickname 
INNER JOIN Have ON Have.page_ID = Pages.page_ID 
INNER JOIN Publications ON Publications.Publication_ID = Have.Publication_ID
WHERE Publications.nickname = Friend.nickname_Users2
GROUP BY  Friend.nickname_Users2
HAVING COUNT(Have.Publication_ID) > ANY(SELECT Pages.Page_ID FROM Pages);

------------------------------------------------------------
-- [16] Which users have 80% of their groups in common ? 
------------------------------------------------------------
SELECT Link.nickname 
FROM Link INNER JOIN Users ON Users.nickname = Link.nickname;

-------------------------------------------------------------------------------------
-- [17] What is the list of "friends" of "Kevin69" that loved all its publications ?
-------------------------------------------------------------------------------------

SELECT nickname
FROM(SELECT Love_publication.nickname,COUNT(publications.publication_id)
	 FROM publications
	 INNER JOIN Love_publication ON Love_publication.publication_id=publications.publication_id
	 WHERE publications.nickname='Kevin69'
	 GROUP BY Love_publication.nickname) AS test
WHERE COUNT=(SELECT COUNT(publication_id)
			 FROM publications
			 WHERE nickname='Kevin69')

------------------------------------------------------------------------------------------
-- [18] For each publication, display the level and the title of the original publication.  
------------------------------------------------------------------------------------------