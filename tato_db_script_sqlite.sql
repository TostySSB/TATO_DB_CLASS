drop table if EXISTS ORGANIZATION;
drop table if EXISTS USERS;
drop table if EXISTS PLAYER;
drop table if EXISTS OWNED_BY;
drop table if EXISTS HAS_MEMBER;
drop table if EXISTS HAS_MERCH;
drop table if EXISTS PLAYER;
drop table if EXISTS PLAYS_IN;
drop table if EXISTS TOURNAMENT;
drop table if EXISTS BRACKET;
drop table if EXISTS PLACINGS;
drop table if EXISTS TODO_ITEM;
drop table if EXISTS HAS_TASK;
drop table if EXISTS INVENTORY_ITEM;

CREATE TABLE ORGANIZATION(
    Org_id int NOT NULL,
    Org_name VARCHAR(255) NOT NULL,
    Org_description VARCHAR(255),
    PRIMARY KEY(Org_id)
);
CREATE TABLE USERS(
    Users_id int NOT NULL,
    Email VARCHAR(255),
    User_Location VARCHAR(255),
    Users_name VARCHAR(20) NOT NULL UNIQUE,
    Player_id int NOT NULL,
    FOREIGN KEY (Player_id) REFERENCES PLAYER(Player_id),
    PRIMARY KEY (Users_id)
);
CREATE TABLE PLAYER(
    Player_id int NOT NULL,
    Tag VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY (Player_id)
);
CREATE TABLE OWNED_BY(
    Owned_id int NOT NULL,
    Users_id int NOT NULL,
    Org_id int NOT NULL,
    FOREIGN KEY (Users_id) REFERENCES USERS(Users_id),
    FOREIGN KEY (Org_id) REFERENCES ORGANIZATION(Org_id),
    PRIMARY KEY (Owned_id)
);
CREATE TABLE HAS_MEMBER(
    Has_member_id int NOT NULL,
    Users_id int NOT NULL,
    Org_id int NOT NULL,
    FOREIGN KEY (Users_id) REFERENCES USERS(User_id),
    FOREIGN KEY (Org_id) REFERENCES ORGANIZATION(Org_id),
    PRIMARY KEY (Has_member_id)
);
CREATE TABLE TOURNAMENT(
    Tourn_id int NOT NULL,
    Tourn_Location VARCHAR(255),
    Num_attendees int DEFAULT 0,
    PRIMARY KEY (Tourn_id)
);
CREATE TABLE PLAYS_IN(
    Participant_id int NOT NULL,
    Tournament_id int NOT NULL,
    FOREIGN KEY (Tournament_id) REFERENCES TOURNAMENT(Tourn_id),
    FOREIGN KEY (Participant_id) REFERENCES PLAYER(Player_id),
    PRIMARY KEY (Participant_id)
);
CREATE TABLE BRACKET(
    Bracket_id int NOT NULL,
    Tournament_id int NOT NULL,
    Bracket_name VARCHAR(30),
    FOREIGN KEY (Tournament_id) REFERENCES TOURNAMENT(Tourn_id),
    PRIMARY KEY (Bracket_id)
);
CREATE TABLE PLACINGS(
    Bracket_id int NOT NULL,
    Placings VARCHAR(255),
    FOREIGN KEY (Bracket_id) REFERENCES BRACKET(Bracket_id),
    PRIMARY KEY (Bracket_id)
);
CREATE TABLE TODO_ITEM(
    Todo_id int NOT NULL,
    Title VARCHAR(50) NOT NULL,
    Todo_Description VARCHAR(255),
    Due_date DATE,
    Completed BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (Todo_id)
);
CREATE TABLE HAS_TASK(
    Org_id int NOT NULL,
    Task_id int NOT NULL,
    PRIMARY KEY (Task_id),
    FOREIGN KEY (Org_id) REFERENCES ORGANIZATION(Org_id)
);
CREATE TABLE INVENTORY_ITEM(
    Item_id int NOT NULL,
    Item_name VARCHAR(100) NOT NULL,
    Item_description VARCHAR(255),
    Item_purchase_link VARCHAR(255),
    Item_quantity int NOT NULL DEFAULT 0,
    PRIMARY KEY (Item_id)
);
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