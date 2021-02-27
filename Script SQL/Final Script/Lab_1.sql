-- Question 3 :  Tables creation

------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------

------------------------------------------------------------
-- Table: Groupes
------------------------------------------------------------
CREATE TABLE public.Groupes(
	group_ID       INTEGER  NOT NULL,
	group_status   VARCHAR (15),
	group_name     VARCHAR (100) NOT NULL,
	CONSTRAINT Groupes_PK PRIMARY KEY (group_ID)
);

------------------------------------------------------------
-- Table: Private chat
------------------------------------------------------------
CREATE TABLE public.Private_chat(
	chat_ID     INTEGER  NOT NULL,
	chat_text   VARCHAR (255),
	chat_date   DATE,
	CONSTRAINT Private_chat_PK PRIMARY KEY (chat_ID)
);

------------------------------------------------------------
-- Table: Users
------------------------------------------------------------
CREATE TABLE public.Users(
	nickname            VARCHAR (50) NOT NULL,
	pwd            		VARCHAR (50),
	name_users          VARCHAR (50),
	email               VARCHAR (50) NOT NULL,
	phone               VARCHAR (15) NOT NULL,
	date_of_birth       DATE  NOT NULL,
	gender              VARCHAR (10) NOT NULL,
	status              VARCHAR (20) NOT NULL,
	country             VARCHAR (50) NOT NULL,
	city_of_residence   VARCHAR (50) NOT NULL,
	CONSTRAINT Users_PK PRIMARY KEY (nickname)
);

------------------------------------------------------------
-- Table: Pages
------------------------------------------------------------
CREATE TABLE public.Pages(
	page_ID       INTEGER  NOT NULL,
	page_status   VARCHAR (15),
	page_name     VARCHAR (50) NOT NULL,
	nickname      VARCHAR (50) NOT NULL,
	CONSTRAINT Pages_PK PRIMARY KEY (page_ID)
);

------------------------------------------------------------
-- Table: Publications
------------------------------------------------------------
CREATE TABLE public.Publications(
	publication_ID   INTEGER  NOT NULL,
	title            VARCHAR (150),
	date_publi       DATE,
	text_publi       VARCHAR (255) NOT NULL,
	like_number      INTEGER  NOT NULL,
	nickname         VARCHAR (50) NOT NULL,
	CONSTRAINT Publications_PK PRIMARY KEY (publication_ID)
);

------------------------------------------------------------
-- Table: Registration historical
------------------------------------------------------------
CREATE TABLE public.Registration_historical(
	registration_date   TIMESTAMP  NOT NULL,
	closing_date        TIMESTAMP,
	nickname            VARCHAR (50) NOT NULL,
	CONSTRAINT Registration_historical_PK PRIMARY KEY (registration_date)
);

------------------------------------------------------------
-- Table: Have
------------------------------------------------------------
CREATE TABLE public.Have(
	page_ID          INTEGER  NOT NULL,
	publication_ID   INTEGER  NOT NULL,
	CONSTRAINT Have_PK PRIMARY KEY (page_ID,publication_ID)
);

------------------------------------------------------------
-- Table: Love pages
------------------------------------------------------------
CREATE TABLE public.Love_pages(
	page_ID    INTEGER  NOT NULL,
	nickname   VARCHAR (50) NOT NULL,
	CONSTRAINT Love_pages_PK PRIMARY KEY (page_ID,nickname)
);

------------------------------------------------------------
-- Table: member of
------------------------------------------------------------
CREATE TABLE public.Member_of(
	nickname   VARCHAR (50) NOT NULL,
	group_ID   INTEGER  NOT NULL,
	CONSTRAINT Member_of_PK PRIMARY KEY (nickname,group_ID)
);

------------------------------------------------------------
-- Table: Friend
------------------------------------------------------------
CREATE TABLE public.Friend(
	nickname_Users1         VARCHAR (50) NOT NULL,
	nickname_Users2   VARCHAR (50) NOT NULL,
	start_date       DATE  NOT NULL,
	CONSTRAINT Friend_PK PRIMARY KEY (nickname_Users1,nickname_Users2)
);

------------------------------------------------------------
-- Table: discuss
------------------------------------------------------------
CREATE TABLE public.Discuss(
	nickname   VARCHAR (50) NOT NULL,
	chat_ID    INTEGER  NOT NULL,
	CONSTRAINT Discuss_PK PRIMARY KEY (nickname,chat_ID)
);

------------------------------------------------------------
-- Table: Love publication
------------------------------------------------------------
CREATE TABLE public.Love_publication(
	publication_ID   INTEGER  NOT NULL,
	nickname         VARCHAR (50) NOT NULL,
	CONSTRAINT Love_publication_PK PRIMARY KEY (publication_ID,nickname)
);

ALTER TABLE public.Pages
	ADD CONSTRAINT Pages_Users0_FK
	FOREIGN KEY (nickname)
	REFERENCES public.Users(nickname);


ALTER TABLE public.Publications
	ADD CONSTRAINT Publications_Users0_FK
	FOREIGN KEY (nickname)
	REFERENCES public.Users(nickname);

ALTER TABLE public.Registration_historical 
	ADD CONSTRAINT Publications_Users0_FK
	FOREIGN KEY (nickname)
	REFERENCES public.Users(nickname);
	
-- Question 4 :  Data insertion

------------------------------------------------------------
-- Insertion of 15 lines of data for each table
------------------------------------------------------------
SET CONSTRAINTS ALL DEFERRED;

ALTER TABLE public.Pages
	ALTER CONSTRAINT Pages_Users0_FK DEFERRABLE INITIALLY IMMEDIATE;
	
ALTER TABLE public.Publications
	ALTER CONSTRAINT Publications_Users0_FK DEFERRABLE INITIALLY IMMEDIATE;
	
ALTER TABLE public.Registration_historical 
	ALTER CONSTRAINT Publications_Users0_FK DEFERRABLE INITIALLY IMMEDIATE;
	
INSERT INTO discuss(nickname, chat_ID)
VALUES('Kevin75', 1),
	  ('Kevin69', 2),
	  ('Dridri91', 3),
	  ('Ousous42', 4),
	  ('Momo98', 5),
	  ('Lolo45', 6),
	  ('Coucou63', 7),
	  ('Domi74', 8),
	  ('Louis96', 9),
	  ('Palu79', 10),
	  ('Coco86', 11),
	  ('Sheguey26', 12),
	  ('Zupa29', 13),
	  ('Nico73', 14),
	  ('Roger09', 15);

INSERT INTO friend(nickname_users1, nickname_users2, start_date)
VALUES('Kevin75', 'Kevin69', '2020-08-13'),
	  ('Kevin69', 'Dridri91', '2019-08-30'),
	  ('Dridri91', 'Ousous42', '2020-08-11'),
	  ('Ousous42', 'Momo98', '2021-03-14'),
	  ('Momo98', 'Ousous42', '2020-01-01'),
	  ('Lolo45', 'Sheguey26', '2020-11-17'),
	  ('Coucou63', 'Palu79', '2018-12-02'),
	  ('Domi74', 'Coco86', '2019-09-09'),
	  ('Palu79', 'Coucou63', '2017-07-08'),
	  ('Coco86', 'Nico73', '2019-02-20'),
	  ('Sheguey26', 'Nico73', '2020-08-09'),
	  ('Zupa29', 'Domi74', '2021-01-01'),
	  ('Nico73', 'Coco86', '2017-09-09'),
	  ('Roger09', 'Kevin75', '2018-12-31'),
	  ('Louis96', 'Zupa29', '2019-12-06'),
	  ('Lolo45', 'Kevin69', '2021-01-17'),
	  ('Kevin69', 'Lolo45', '2021-01-17');

INSERT INTO groupes(group_ID, group_status, group_name)
VALUES(1, 'Private', 'Finance Quantitative'),
	  (2, 'Public', 'Big Data'),
	  (3, 'Private', 'Avionique'),
	  (4, 'Public', 'Energie'),
	  (5, 'Public', 'Software Engineering'),
	  (6, 'Private', 'Objets connectés'),
	  (7, 'Public', 'Traitement du signal'),
	  (8, 'Public', 'Mathématiques'),
	  (9, 'Public', 'Anglais'),
	  (10, 'Public', 'Flat Earth Society'),
	  (11, 'Private', 'Voyages'),
	  (12, 'Public', 'Basket-Ball'),
	  (13, 'Public', 'Crypto'),
	  (14, 'Public', 'Jardinerie'),
	  (15, 'Public', 'M&A');

INSERT INTO have(page_ID, publication_ID)
VALUES(1,1),
	  (2,2),
	  (3,3),
	  (4,4),
	  (5,5),
	  (6,6),
	  (7,7),
	  (8,8),
	  (9,9),
	  (10,10),
	  (11,11),
	  (12,12),
	  (13,13),
	  (14,14),
	  (15,15),
	  (5,16),
	  (6,17);
	  
INSERT INTO love_pages(page_ID, nickname)
VALUES(1,'Kevin75'),
	  (2,'Zupa29'),
	  (3,'Coco86'),
	  (4,'Coucou63'),
	  (5,'Dridri91'),
	  (6,'Domi74'),
	  (7,'Kevin69'),
	  (8,'Domi74'),
	  (9,'Ousous42'),
	  (10,'Lolo45'),
	  (11,'Dridri91'),
	  (12,'Louis96'),
	  (13,'Sheguey26'),
	  (14,'Dridri91'),
	  (15,'Roger09');

INSERT INTO love_publication(publication_ID, nickname)
VALUES(1,'Kevin75'),
	  (2,'Zupa29'),
	  (3,'Coco86'),
	  (4,'Coucou63'),
	  (5,'Dridri91'),
	  (6,'Domi74'),
	  (7,'Kevin69'),
	  (8,'Domi74'),
	  (9,'Ousous42'),
	  (10,'Lolo45'),
	  (11,'Louis96'),
	  (12,'Coco86'),
	  (13,'Sheguey26'),
	  (14,'Dridri91'),
	  (15,'Roger09'),
	  (18,'Dridri91'),
	  (14,'Lolo45');

INSERT INTO member_of(nickname, group_ID)
VALUES('Kevin75',1),
	  ('Zupa29', 2),
	  ('Coco86', 3),
	  ('Coucou63', 4),
	  ('Dridri91', 5),
	  ('Domi74', 6),
	  ('Kevin69', 7),
	  ('Domi74', 8),
	  ('Ousous42', 9),
	  ('Lolo45', 10),
	  ('Dridri91', 11),
	  ('Coco86', 12),
	  ('Sheguey26', 13),
	  ('Louis96', 5),
	  ('Roger09', 14),
	  ('Kevin75',2),
	  ('Zupa29', 1),
	  ('Dridri91', 14);
	  
INSERT INTO pages(page_ID, page_status, page_name, nickname)
VALUES(1, 'Private', 'Oasis Page', 'Kevin75'),
	  (2, 'Public', 'Barbapapa Page', 'Zupa29'),
	  (3, 'Private', 'NBA Page', 'Coco86'),
	  (4, 'Private', 'Burger Page', 'Coucou63'),
	  (5, 'Private', 'Samourai Page', 'Dridri91'),
	  (6, 'Private', 'Aquila Page', 'Louis96'),
	  (7, 'Public', 'WWE Page', 'Kevin69'),
	  (8, 'Private', 'Ronaldo Fan Page', 'Domi74'),
	  (9, 'Public', 'Momo Fan Page', 'Ousous42'),
	  (10, 'Public', 'Peugeot Page', 'Lolo45'),
	  (11, 'Public', 'Renault Page', 'Dridri91'),
	  (12, 'Public', 'Instagram Page', 'Coco86'),
	  (13, 'Public', 'Microsoft Page', 'Sheguey26'),
	  (14, 'Public', 'Twitter Page', 'Dridri91'),
	  (15, 'Private', 'TikTok Page', 'Roger09');

INSERT INTO private_chat(chat_ID, chat_text, chat_date)
VALUES(1, 'Hello !', '2006-09-25'),
	  (2, 'Bonjour, ça va ?', '2008-05-14'),
	  (3, 'Hey !', '2012-04-17'),
	  (4, 'Do you want a cookie?', '2016-03-08'),
	  (5, 'Hey ! ça va ?', '2020-09-07'),
	  (6, 'Bien vu', '2018-11-14'),
	  (7, 'non c pas moi', '2017-12-26'),
	  (8, 'How are you doing ?', '2013-10-09'),
	  (9, 'i love you all', '2012-02-05'),
	  (10, 'Ah bien joué', '2009-06-18'),
	  (11, 'Trop fort !', '2005-01-07'),
	  (12, 'Ca dit quoi ?', '2014-08-15'),
	  (13, 'Dispo lundi ?', '2015-03-30'),
	  (14, 'C Oussama qui a volé mes chaussettes !!!!!', '2002-07-23'),
	  (15, 'Have you done the database tutorial ?', '2019-05-21');

INSERT INTO publications(publication_ID, title, date_publi, text_publi, like_number, nickname)
VALUES(1, 'COVID-19 Conspiration','2005-09-25', 'Coronavirus is just a conspiracy to control us ! Dont fall for it , dont do the vaccine or you will become a horse.', 150, 'Dridri91'),
	  (2, 'Ronaldo best player ever ?', '2010-07-11', 'Ronaldo is the best player in the world. Messi is a little leprechaun.', 450, 'Domi74'),
	  (3, 'Messi the new God ?', '2013-06-19','Messi is the best player ever. I wont even dare notify this fraud of Madere and not even talk about this parisian clown. The only one who can compete with the legacy of Messi is el piebe del oro.', 860, 'Sheguey26'),
	  (4, 'Small smiles for Big laugh', '2011-04-09', 'This is not nice to laugh about people of small sizes. Your mom should have teach you that !', 15053, 'Roger09'),
	  (5, 'Make nonsense !', '2020-01-07', 'This is a publication taken from a page with nonsense. I just tape some word to do a sentence. I will not talk to much and let you appreciate the greatness of this publication.', 29, 'Zupa29'),
	  (6, 'Talk too much !', '2019-12-13', 'In my publication, I will only talk about my publication and nothing all ... Thats why I do the best publication in the world. Give me likes and God bless your publications.', 423, 'Kevin75'),
	  (7, 'French Football Team win', '2017-11-26', 'I have to tell everyone something: we are in France. # aller les bleus', 789, 'Ousous42'),
	  (8, 'Trump a future developer ?', '2013-10-29', 'Trump is the best java developer !! Oooooooooh my god !! #Oussama the best #Trump', 123, 'Domi74'),
	  (9, 'Tom Brady exhausted ?', '2020-02-05', 'Brady will fight Bucaneers for the 2021 Superbowl', 456, 'Louis96'),
	  (10, 'North Korea are ready ?', '2009-07-18', 'Dennis Rodman loves North-Korea !', 963, 'Lolo45'),
	  (11, 'Biden vs Trump : God bless America', '20050607', 'Trump leads the US election by 57% of vote intention', 8521, 'Zupa29'),
	  (12, 'COP21 a new project ?', '2014-03-15', 'Emmanuel Macron and Donald Trump disagreement', 1478, 'Coucou63'),
	  (13, 'Lebron James the new GOAT ?', '2015-08-30', 'Lebron James made another Triple-double last night against Raptors', 7896, 'Coco86'),
	  (14, 'Trump Eldorado', '2020-05-20', 'Trump left to South Florida after Biden Election', 7532, 'Kevin69'),
	  (15, 'Trump for 2024', '2019-07-21', 'Trump will be elected in 2024', 159, 'Sheguey26'),
	  (16, 'COVID-19 Conspiration','2005-09-25', 'Coronavirus is just a conspiracy to control us ! Dont fall for it , dont do the vaccine or you will become a horse.', 97, 'Dridri91'),
	  (17, 'COVID-19 Conspiration','2005-09-25', 'Coronavirus is just a conspiracy to control us ! Dont fall for it , dont do the vaccine or you will become a horse.', 63, 'Dridri91'),
	  (18, 'Trump Eldorado', '2020-05-20', 'Trump left to South Florida after Biden Election', 46, 'Kevin69');
	  
INSERT INTO registration_historical(registration_date, nickname)
VALUES('2019-08-08 04:05:06', 'Kevin69'),
	  ('2008-02-05 16:37:26', 'Sheguey26'),
	  ('2006-05-26 14:25:46', 'Coucou63'),
	  ('2017-09-05 08:29:50', 'Lolo45'),
	  ('2010-11-05 07:24:17', 'Zupa29'),
	  ('2009-12-05 12:05:38', 'Ousous42'),
	  ('2000-08-05 11:29:42', 'Kevin75'),
	  ('2005-07-05 21:26:35', 'Dridri91'),
	  ('2003-06-05 18:32:03', 'Roger09'),
	  ('2004-04-05 21:25:17', 'Coco86'),
	  ('1999-04-05 22:48:42', 'Palu79'),
	  ('2013-03-05 13:55:17', 'Momo98'),
	  ('2009-01-05 10:01:54', 'Nico73'),
	  ('2001-10-05 05:14:59', 'Domi74'),
	  ('1998-09-05 23:47:21', 'Louis96');
	  
INSERT INTO users(nickname, pwd, name_users, email, phone, date_of_birth, gender, status, country, city_of_residence)
VALUES('Kevin75', '12345', 'Kevin Barbier', 'barbierkev@outlook.com', '0618897687', '1991-08-09', 'Male', 'Friend', 'England', 'London'),
	  ('Dridri91', '12345', 'Drianna Barketti', 'barkdri@gmail.com', '0623898084', '1995-03-21', 'Female', 'Friend', 'France', 'Sochaux'),
	  ('Roger09', '12345', 'Roger Malreaux', 'malreaux.roger@sfr.fr', '0723802017', '1986-01-22', 'Male', 'Friend', 'France', 'Lyon'),
	  ('Coco86', '12345', 'Corrine Seaux', 'cocoricocs@gmail.com', '0633402057', '1989-03-14', 'Female', 'Friend', 'France', 'Valenciennes'),
	  ('Ousous42', '12345', 'Oussamia Ben Arji', 'benarji.ous@gmail.com', '0739852028', '1999-01-11', 'Female', 'Friend', 'Brazil', 'Rio de Janiero'),
	  ('Kevin69','12345','Kevin Daguerre', 'kevindag69@hotmail.fr', '0664785123', '2006-09-25', 'Male','Friend', 'France', 'Paris'),
	  ('Sheguey26', '12345','Solene Hoche','soso26@outlook.fr', '0798635987', '2002-11-07' ,'Female','Friend', 'France','Marseille'),
	  ('Coucou63','12345', 'Caroline Poulain', 'poulaincaro@gmail.com', '0674124566', '2000-11-06','Female','Friend', 'Spain','Madrid'),
	  ('Lolo45', '12345', 'Laurine Doguemont', 'doguemont_laurine@gmail.com', '0699853421', '2005-06-06', 'Female', 'Friend', 'France','Bordeaux'),
	  ('Zupa29', '12345', 'Zoe Puchala', 'puchala29@hotmail.fr', '0778431688', '2001-08-06', 'Female', 'Friend', 'France', 'Strasbourg'),
	  ('Palu79', '12345', 'Paulin Assileau', 'paulin.assileau@sfr.fr', '0626818687', '1990-07-03', 'Male', 'Friend', 'Brazil', 'Rio de Janeiro'),
	  ('Momo98', '12345', 'Mohamed Merkaoui', 'mohamed.merkaoui@gmail.com', '0618897777', '1998-09-24', 'Male', 'Friend', 'France', 'Paris'),
	  ('Nico73', '12345', 'Nicolas Paolini', 'nicolas.paolini@outlook.com', '0628492369', '1997-07-07', 'Male', 'Friend', 'Spain', 'Madrid'),
	  ('Domi74', '12345', 'Dominique Bérange', 'paulin.assileau@gmail.com', '0616891685', '1986-02-03', 'Female', 'Engaged', 'France', 'Nice'),
	  ('Louis96', '12345', 'Louis Patria', 'louis.patria@outlook.com', '0679591681', '1984-04-30', 'Male', 'Engaged', 'France', 'Lille');
	  
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