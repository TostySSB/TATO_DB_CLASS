CREATE SCHEMA ORGANIZATION;
GO
CREATE TABLE ORGANIZATION(
    Org_id int NOT NULL AUTO_INCREMENT,
    Org_name VARCHAR(255) NOT NULL,
    Org_description VARCHAR(255),
    PRIMARY KEY(Org_id)
)

CREATE SCHEMA USER;
GO
CREATE TABLE USER(
    User_id int NOT NULL AUTO_INCREMENT,
    Email VARCHAR(255),
    User_Location VARCHAR(255),
    User_name VARCHAR(20) NOT NULL UNIQUE,
    Player_id int NOT NULL,
    FOREIGN KEY (Player_id) REFERENCES PLAYER(Player_id)
    PRIMARY KEY (User_id)
);

CREATE SCHEMA PLAYER;
GO
CREATE TABLE PLAYER(
    Player_id int NOT NULL AUTO_INCREMENT,
    Tag VARCHAR(20) NOT NULL UNIQUE
    PRIMARY KEY (Player_id)
);

CREATE SCHEMA OWNED_BY;
GO

CREATE TABLE OWNED_BY(
    Owned_id int NOT NULL AUTO_INCREMENT,
    User_id int NOT NULL,
    Org_id int NOT NULL,
    FOREIGN KEY (User_id) REFERENCES USER(User_id),
    FOREIGN KEY (Org_id) REFERENCES ORGANIZATION(Org_id)
    PRIMARY KEY (Owned_id)
)

CREATE SCHEMA HAS_MEMBER;
GO
CREATE TABLE HAS_MEMBER(
    Has_member_id int NOT NULL AUTO_INCREMENT,
    User_id int NOT NULL,
    Org_id int NOT NULL,
    FOREIGN KEY (User_id) REFERENCES USER(User_id),
    FOREIGN KEY (Org_id) REFERENCES ORGANIZATION(Org_id),
    PRIMARY KEY (Has_member_id)
)

CREATE SCHEMA TOURNAMENT;
GO
CREATE TABLE TOURNAMENT(
    Tourn_id int NOT NULL AUTO_INCREMENT,
    Tourn_Location VARCHAR(255),
    Num_attendees int DEFAULT 0,
    PRIMARY KEY (Tourn_id)
);

CREATE SCHEMA PLAYS_IN;
GO
CREATE TABLE PLAYS_IN(
    Participant_id int NOT NULL,
    Tournament_id int NOT NULL,
    FOREIGN KEY (Tournament_id) REFERENCES TOURNAMENT(Tourn_id),
    FOREIGN KEY (Participant_id) REFERENCES PLAYER(Player_id),
    PRIMARY KEY (Participant_id)
);

CREATE SCHEMA BRACKET;
GO
CREATE TABLE BRACKET(
    Bracket_id int NOT NULL,
    Tournament_id int NOT NULL,
    FOREIGN KEY (Tournament_id) REFERENCES TOURNAMENT(Tourn_id),
    PRIMARY KEY (Bracket_id)
);

CREATE SCHEMA PLACINGS;
GO
CREATE TABLE PLACINGS(
    Bracket_id int NOT NULL,
    Placings VARCHAR(255),
    FOREIGN KEY (Bracket_id) REFERENCES BRACKET(Bracket_id)
    PRIMARY KEY (Bracket_id)
);

CREATE SCHEMA TODO_ITEM;
GO
CREATE TABLE TODO_ITEM(
    Todo_id int NOT NULL AUTO_INCREMENT,
    Title VARCHAR(50) NOT NULL,
    Todo_Description VARCHAR(255),
    Due_date DATE,
    Completed BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (Todo_id)
);

CREATE SCHEMA HAS_TASK;
GO
CREATE TABLE HAS_TASK(
    Org_id int NOT NULL,
    Task_id int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (Task_id)
    FOREIGN KEY (Org_id) REFERENCES ORGANIZATION(Org_id)
);

CREATE SCHEMA INVENTORY_ITEM;
GO
CREATE TABLE INVENTORY_ITEM(
    Item_id int NOT NULL AUTO_INCREMENT,
    Item_name VARCHAR(100) NOT NULL,
    Item_description VARCHAR(255),
    Item_purchase_link VARCHAR(255),
    Item_quantity int NOT NULL DEFAULT 0,
    PRIMARY KEY (Item_id)
);

CREATE SCHEMA HAS_MERCH;
GO
CREATE TABLE HAS_MERCH(
    Item_id int NOT NULL,
    Org_id int NOT NULL,
    PRIMARY KEY (Item_id),
    FOREIGN KEY (Item_id) REFERENCES INVENTORY_ITEM(Item_id),
    FOREIGN KEY (Org_id) REFERENCES ORGANIZATION(Org_id)
);

insert into ORGANIZATION values  (1,"A club at MSU","Smash Society");
insert into ORGANIZATION values  (2,"A club at UMN","Smash Central");
insert into ORGANIZATION values  (3,"A club at UND","UND Smash");
insert into ORGANIZATION values  (4,"A club at UCB","CO Smash");
insert into ORGANIZATION values  (5,"A club at MSUB","Billings Smash Society");

insert into USERS values (1,"toster1011@gmail.com", "Montana", "TostySSB",1);
insert into USERS values (2,"johndoe@gmail.com", "Montana", "JDSSB",2);
insert into USERS values (3,"DannyTrejo@gmail.com", "Montana", "DTSSB",3);
insert into USERS values (4,"JohnnyDepp@gmail.com", "Montana", "JPSSB",4);
insert into USERS values (5,"DannyD@gmail.com", "Montana", "DDSSB",5);

insert into PLAYER values (1,"Tosty");
insert into PLAYER values (2,"JD");
insert into PLAYER values (3,"DT");
insert into PLAYER values (4,"JP");
insert into PLAYER values (5,"DD");

insert into OWNED_BY values (1,1,1);
insert into OWNED_BY values (2,2,2);
insert into OWNED_BY values (3,3,3);
insert into OWNED_BY values (4,4,4);
insert into OWNED_BY values (5,5,5);

insert into HAS_MEMBER values (1,1,1);
insert into HAS_MEMBER values (2,2,2);
insert into HAS_MEMBER values (3,3,3);
insert into HAS_MEMBER values (4,4,4);
insert into HAS_MEMBER values (5,5,5);

insert into TOURNAMENT values (1,"Montana",10);
insert into TOURNAMENT values (2,"Montana",12);
insert into TOURNAMENT values (3,"Montana",15);
insert into TOURNAMENT values (4,"Montana",19);
insert into TOURNAMENT values (5,"Montana",20);

insert into PLAYS_IN values (1,1);
insert into PLAYS_IN values (2,1);
insert into PLAYS_IN values (3,1);
insert into PLAYS_IN values (4,1);
insert into PLAYS_IN values (5,1);

insert into BRACKET values (1,1,"Ultimate Singles");
insert into BRACKET values (2,1,"Melee Singles");
insert into BRACKET values (3,2,"Ultimate Singles");
insert into BRACKET values (4,3,"Ultimate Singles");
insert into BRACKET values (5,4,"Melee Singles");

insert into PLACINGS values (1,"1. Tosty 2. JD");
insert into PLACINGS values (2,"1. Tosty 2. JD");
insert into PLACINGS values (3,"1. Tosty 2. JD");
insert into PLACINGS values (4,"1. Tosty 2. JD");
insert into PLACINGS values (5,"1. Tosty 2. JD");

insert into TODO_ITEM values (1,"Shower", "Please.", "06/09/2016", FALSE);
insert into TODO_ITEM values (2,"Clean up event room", "After tournament, reorganize the venue and clean up after ourselves so we don't get fined.", "12/11/2017", FALSE);
insert into TODO_ITEM values (3,"book event hall for next tournament", "Book event hall at XXX in YYY city for the upcomming tourny.", "07/05/2018", FALSE);
insert into TODO_ITEM values (4,"Determine prize for next tournament", "Cold hard cash, or honor, sire?", "01/23/2018", FALSE);
insert into TODO_ITEM values (5,"Schedule next club meeting", "We gotta do it at some point guys.", "03/27/2019", FALSE);

insert into HAS_TASK values(1, 1);
insert into HAS_TASK values(2, 2);
insert into HAS_TASK values(3, 3);
insert into HAS_TASK values(4, 4);
insert into HAS_TASK values(5, 5);

insert into INVENTORY_ITEM values(1, "Fan Shirt", "A dark colored shirt with our logo.", "www./MJ-SMASH.co/shirt", 10);
insert into INVENTORY_ITEM values(2, "Custom Controller", "A constum controller design to show your support for X.", "www./MJ-SMASH.co/controller", 100);
insert into INVENTORY_ITEM values(3, "Wrist Band", "It's stretchy & Elastic, how very fantastic!", "www./MJ-SMASH.co/band", 20);
insert into INVENTORY_ITEM values(4, "Poster", "A pin up of Green Mario.", "www./MJ-SMASH.co/poster", 5);
insert into INVENTORY_ITEM values(5, "Mannequin of Michael Jackson", "hee-hee.", "www./MJ-SMASH.co/MJquin", 50);

insert into HAS_MERCH values(1, 1);
insert into HAS_MERCH values(2, 2);
insert into HAS_MERCH values(3, 3);
insert into HAS_MERCH values(4, 4);
insert into HAS_MERCH values(5, 5);