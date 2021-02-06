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
SELECT Pages.Page_ID, Pages.Page_name
FROM Pages
INNER JOIN Publications ON Publications.Publication_ID = Pages.Page_ID
INNER JOIN love_publication ON Publications.Publication_ID = love_publication.Publication_ID
GROUP BY Pages.Page_ID
HAVING AVG(like_number) > 5
ORDER BY AVG(like_number);

---------------------------------------------------------------------
-- [12] For each page, display the publication with the most "likes". 
---------------------------------------------------------------------
SELECT Pages.*
FROM Pages
JOIN Have ON Have.Page_ID = Pages.Page_ID
JOIN Publications ON Have.Publication_ID = Publications.Publication_ID
WHERE like_number >= 
(SELECT MAX(like_number)
FROM Publications)
GROUP BY Pages.Page_ID;

--------------------------------------------------------------------------------------------------------------------------------------
-- [13] Display the groups of which at least half the members have more than 5 "like" on average over the publications of their pages.
--------------------------------------------------------------------------------------------------------------------------------------
SELECT * 
FROM Groupes 
INNER JOIN Publications ON Groupes.group_ID  = Publicaton.group_ID 
WHERE AVG(like_number) > 5 ORDER BY AVG(like_number);

--------------------------------------------------------------------------
-- [14] See the average number of publications containing words " Trump ". 
--------------------------------------------------------------------------
SELECT AVG(COUNT(*)) 
FROM Publications 
WHERE text_publi LIKE 'Trump';

----------------------------------------------------------------------
-- [15] Which users have published on the pages of all their friends ? 
----------------------------------------------------------------------
SELECT * 
FROM Users 
INNER JOIN Pages ON Users.nickname = Pages.nickname 
INNER JOIN Publications ON Publications.page_ID = Pages.page_ID 
WHERE MAX(DISTINCT Publications.Nickname) = COUNT(DISTINCT Publications.nickname);

------------------------------------------------------------
-- [16] Which users have 80% of their groups in common ? 
------------------------------------------------------------
SELECT Link.nickname 
FROM Link INNER JOIN Users ON Users.nickname = Link.nickname;

-------------------------------------------------------------------------------------
-- [17] What is the list of "friends" of "Kevin69" that loved all its publications ?
-------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
-- [18] For each publication, display the level and the title of the original publication.  
------------------------------------------------------------------------------------------
