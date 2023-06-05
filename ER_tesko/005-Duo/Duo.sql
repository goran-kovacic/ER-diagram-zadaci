# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\005-Duo\Duo.sql

drop database if exists acoustic_duo;
create database acoustic_duo;
use acoustic_duo;

create table user(
    user_id int not null primary key auto_increment,
    user_name varchar(50),
    email varchar(50),
    password varchar(50)
);

create table user_input(
    id int not null primary key auto_increment,
    name varchar(50),
    comment text,
    user int,
    foreign key (user) references user(user_id)
);

create table news(
    id int not null primary key auto_increment,
    name varchar(50),
    date date,
    text text
);

create table event(
    id int not null primary key auto_increment,
    name varchar(50),
    date date,
    text text
);

create table concert(
    id int not null primary key auto_increment,
    name varchar(50),
    date date,
    text text
);

create table gallery(
    id int not null primary key auto_increment,
    name varchar(50),
    news int,
    event int,
    concert int,
    foreign key (news) references news(id),
    foreign key (event) references event(id),
    foreign key (concert) references concert(id)
);

create table photo(
    id int not null primary key auto_increment,
    name varchar(50),
    file_path varchar(100),
    gallery_id int,
    foreign key (gallery_id) references gallery(id)
);