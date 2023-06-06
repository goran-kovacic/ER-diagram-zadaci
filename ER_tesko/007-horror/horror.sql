# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\007-horror\horror.sql

drop database if exists horror;
create database horror;
use horror;

create table user(
    id int not null primary key auto_increment,
    name varchar(50),
    email varchar(50),
    password varchar(50)
);

create table user_input(
    id int not null primary key auto_increment,
    comment text,
    user int,
    foreign key (user) references user(id)
);

create table news(
    id int not null primary key auto_increment,
    name varchar(50),
    date date,
    text text
);

create table gallery(
    id int not null primary key auto_increment,
    name varchar(50),
    news int,
    foreign key (news) references news(id)
);

create table photo(
    id int not null primary key auto_increment,
    name varchar(50),
    file_path varchar(50),
    gallery int,
    foreign key (gallery) references gallery(id)
);

