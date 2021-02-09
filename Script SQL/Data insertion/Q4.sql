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

INSERT INTO friend(nickname, nickname_users, start_date)
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
	  
INSERT INTO users(nickname, pwd, name_users, email, phone, date_of_birth, gender, status, country, city_of_residence, start_date, nickname_users)
VALUES('Kevin75', '12345', 'Kevin Barbier', 'barbierkev@outlook.com', '0618897687', '1991-08-09', 'Male', 'Friend', 'England', 'London', '2020-08-13', 'Kevin69'),
	  ('Dridri91', '12345', 'Drianna Barketti', 'barkdri@gmail.com', '0623898084', '1995-03-21', 'Female', 'Friend', 'France', 'Sochaux', '2020-08-11', 'Ousous42'),
	  ('Roger09', '12345', 'Roger Malreaux', 'malreaux.roger@sfr.fr', '0723802017', '1986-01-22', 'Male', 'Friend', 'France', 'Lyon', '2018-12-31', 'Kevin75'),
	  ('Coco86', '12345', 'Corrine Seaux', 'cocoricocs@gmail.com', '0633402057', '1989-03-14', 'Female', 'Friend', 'France', 'Valenciennes', '2019-02-20','Nico73'),
	  ('Ousous42', '12345', 'Oussamia Ben Arji', 'benarji.ous@gmail.com', '0739852028', '1999-01-11', 'Female', 'Friend', 'Brazil', 'Rio de Janiero','2021-03-14', 'Momo98'),
	  ('Kevin69','12345','Kevin Daguerre', 'kevindag69@hotmail.fr', '0664785123', '2006-09-25', 'Male','Friend', 'France', 'Paris', '2019-08-30', 'Dridri91'),
	  ('Sheguey26', '12345','Solene Hoche','soso26@outlook.fr', '0798635987', '2002-11-07' ,'Female','Friend', 'France','Marseille', '2020-08-09', 'Nico73'),
	  ('Coucou63','12345', 'Caroline Poulain', 'poulaincaro@gmail.com', '0674124566', '2000-11-06','Female','Friend', 'Spain','Madrid', '2018-12-02', 'Palu79'),
	  ('Lolo45', '12345', 'Laurine Doguemont', 'doguemont_laurine@gmail.com', '0699853421', '2005-06-06', 'Female', 'Friend', 'France','Lille', '2020-11-17', 'Sheguey26'),
	  ('Zupa29', '12345', 'Zoe Puchala', 'puchala29@hotmail.fr', '0778431688', '2001-08-06', 'Female', 'Friend', 'France', 'Strasbourg', '2021-01-01', 'Domi74'),
	  ('Palu79', '12345', 'Paulin Assileau', 'paulin.assileau@sfr.fr', '0626818687', '1990-07-03', 'Male', 'Friend', 'Brazil', 'Rio de Janeiro', '2017-07-08', 'Coucou63'),
	  ('Momo98', '12345', 'Mohamed Merkaoui', 'mohamed.merkaoui@gmail.com', '0618897777', '1998-09-24', 'Male', 'Friend', 'France', 'Paris', '2020-01-01', 'Ousous42'),
	  ('Nico73', '12345', 'Nicolas Paolini', 'nicolas.paolini@outlook.com', '0628492369', '1997-07-07', 'Male', 'Friend', 'Spain', 'Madrid', '2017-09-09', 'Coco86'),
	  ('Domi74', '12345', 'Dominique Bérange', 'paulin.assileau@gmail.com', '0616891685', '1986-02-03', 'Female', 'Engaged', 'France', 'Nice', '2019-09-09', 'Coco86'),
	  ('Louis96', '12345', 'Louis Patria', 'louis.patria@outlook.com', '0679591681', '1984-04-30', 'Male', 'Engaged', 'France', 'Lille', '2019-12-06', 'Zupa29');