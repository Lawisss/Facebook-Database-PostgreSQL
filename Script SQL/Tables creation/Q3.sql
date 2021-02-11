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