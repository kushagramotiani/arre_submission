CREATE DATABASE whatsapp;
SHOW DATABASES;
USE whatsapp;\

/* This table contains list of all users where a user_id is the primary key to identify the user */
CREATE TABLE users (
    user_id int not null auto_increment,
    phone_number int not null,
    user_name varchar(255),
    created_at datetime,
    updated_at datetime,
    PRIMARY KEY (user_id)
);


/* This table contains list of all groups */
CREATE TABLE groups (
    group_id int not null auto_increment,
    group_name varchar(255),
    members_count int,
    group_dp varchar(512),
    created_at datetime,
    updated_at datetime,
    created_by varchar(255)
);

/* Table containing list of all messages connecting them to the group they have been sent on and to the user they have been sent to using groups and users table*/
CREATE TABLE messages (
    message_id int not null auto_increment,
    group_id int not null,
    user_id int not null,
    message_text varchar(1000),
    media_url varchar(512),
    created_at datetime,
    PRIMARY KEY (message_id),
    FOREIGN KEY (group_id)
    REFERENCES groups(group_id),
    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);

/* This table contains list of all group members in all groups and forms a many-to-many relation */
CREATE TABLE group_members (
	Id int not null auto_increment,
    group_id int not null auto_increment,
    user_id varchar(255),
    added_at datetime,
    removed_at datetime,
    PRIMARY KEY (Id),
    FOREIGN KEY (group_id)
    REFERENCES groups(group_id),
    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);

