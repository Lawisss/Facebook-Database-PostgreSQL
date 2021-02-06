-- Question 5 :  Data insertion

------------------------------------------------------------
-- Table: Groupes
------------------------------------------------------------

------------------------------------------------------------
-- Table: Groupes
------------------------------------------------------------
SELECT * FROM Users;

------------------------------------------------------------
-- Table: Groupes
------------------------------------------------------------
SELECT COUNT(DISTINCT country) 
FROM Users; 

------------------------------------------------------------
-- Table: Groupes
------------------------------------------------------------
SELECT * 
FROM Users 
WHERE country = 'Brazil' 
ORDER BY name_users;

------------------------------------------------------------
-- Table: Groupes
------------------------------------------------------------
SELECT COUNT(*) 
FROM Users 
WHERE Country = 'France' 
GROUP BY city_of_residence;

------------------------------------------------------------
-- Table: Groupes
------------------------------------------------------------
SELECT COUNT(*) 
FROM Users 
WHERE start_date > '2010-01-01' AND  start_date < '2017-01-01';

------------------------------------------------------------
-- Table: Groupes
------------------------------------------------------------
SELECT * FROM Publications WHERE LENGTH(text_publi) < 100 AND like_number > 100;

------------------------------------------------------------
-- Table: Groupes
------------------------------------------------------------
SELECT nickname FROM Friend WHERE nickname = 'Kevin75' ORDER BY start_date DESC;

------------------------------------------------------------
-- Table: Groupes
------------------------------------------------------------
SELECT Users.nickname FROM Users INNER JOIN Friend ON Users.nickname = Friend.nickname WHERE city_of_residence = "London" ORDER BY COUNT(Friend.nickname);

------------------------------------------------------------
-- Table: Groupes
------------------------------------------------------------
SELECT MAX(COUNT(Gather.group_ID)), Groups.group_ID,  FROM Groups INNER JOIN Gather ON Groups.group_ID = Gather.group_ID ;

------------------------------------------------------------
-- Table: Groupes
------------------------------------------------------------
SELECT gender,MAX(COUNT(gender)) FROM Users INNER JOIN Gather ON User.Nickname = Gather.Nickname INNER JOIN ON Groups ON Gather.group_ID = Groups.Group_ID GROUP BY gender HAVING Groups.group_name = ‘Flat Earth Society’; 
SELECT * FROM Pages JOIN ON Pages.Page_ID = Publications.Publication_ID WHERE AVG(LikeNumber) > 5 ORDER BY AVG(LikeNumber); 
SELECT DISTINCT(Pages.page_ID),MAX(like_number) FROM Pages INNER JOIN Publication ON Pages.page_ID = Publications.Page_ID; 
SELECT * FROM Group INNER JOIN Publications ON Groups.group_ID  = Publicaton.group_ID WHERE AVG(LikeNumber) > 5 ORDER BY AVG(LikeNumber);
SELECT AVG(COUNT(*)) FROM Publication WHERE Text LIKE ‘Trump’; 
SELECT * FROM User INNER JOIN Pages ON User.nickname = Pages.NIckname INNER JOIN Publication ON Publication.page_ID = Pages.page_ID WHERE MAX(DISTINCT Publication.Nickname) = COUNT(DISTINCT Publication.Nickname);
-- // 
SELECT Link.Nickname FROM Link INNER JOIN User ON User.Nickname = Link.Nickname;
--//