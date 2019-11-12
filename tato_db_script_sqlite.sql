
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
)
