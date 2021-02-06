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
WHERE city_of_residence = "London" 
ORDER BY COUNT(Friend.nickname);

------------------------------------------------------------
-- [9] Which group has the most members ?
------------------------------------------------------------
SELECT MAX(COUNT(Member_of.group_ID)), Groupes.group_ID,  
FROM Groupes 
INNER JOIN Member_of ON Groupes.group_ID = Member_of.group_ID ;

-------------------------------------------------------------------
-- [10] In group "Flat Earth Society" are there more men or women ? 
-------------------------------------------------------------------
SELECT gender,MAX(COUNT(gender)) 
FROM Users 
INNER JOIN Member_of ON Users.Nickname = Member_of.Nickname 
INNER JOIN ON Groupes ON Gather.group_ID = Groupes.Group_ID 
GROUP BY gender 
HAVING Groupes.group_name = 'Flat Earth Society';

--------------------------------------------------------------------------------------------------------------------------
-- [11] See which pages on average receive more than 5 "likes" per publication, ranked by the average of number of "like". 
--------------------------------------------------------------------------------------------------------------------------
SELECT * 
FROM Pages 
JOIN ON Pages.Page_ID = Publications.Publication_ID 
WHERE AVG(like_number) > 5 
ORDER BY AVG(like_number);

---------------------------------------------------------------------
-- [12] For each page, display the publication with the most "likes". 
---------------------------------------------------------------------
SELECT DISTINCT(Pages.page_ID),MAX(like_number) 
FROM Pages 
INNER JOIN Publications ON Pages.page_ID = Publications.Page_ID;

--------------------------------------------------------------------------------------------------------------------------------------
-- [13] Display the groups of which at least half the members have more than 5 "like" on average over the publications of their pages.
--------------------------------------------------------------------------------------------------------------------------------------
SELECT * 
FROM Groupes 
INNER JOIN Publications ON Groupes.group_ID  = Publicaton.group_ID 
WHERE AVG(like_number) > 5 ORDER BY AVG(like_number);

----------------------------------------------------------------------
--  See the average number of publications containing words " Trump ". 
----------------------------------------------------------------------
SELECT AVG(COUNT(*)) 
FROM Publications 
WHERE text_publi LIKE 'Trump';

-----------------------------------------------------------------
-- Which users have published on the pages of all their friends ? 
-----------------------------------------------------------------
SELECT * 
FROM Users 
INNER JOIN Pages ON User.nickname = Pages.nickname 
INNER JOIN Publications ON Publications.page_ID = Pages.page_ID 
WHERE MAX(DISTINCT Publications.Nickname) = COUNT(DISTINCT Publications.nickname);

------------------------------------------------------------
-- How many accounts were created between 2010 and 2017 ?
------------------------------------------------------------
SELECT Link.nickname 
FROM Link INNER JOIN Users ON Users.nickname = Link.nickname;
