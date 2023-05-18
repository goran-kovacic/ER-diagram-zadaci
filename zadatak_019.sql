# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_019.sql

drop database if exists zadatak_019;
create database zadatak_019;
use zadatak_019;


create table nakladnik(
    id int not null primary key auto_increment,
    naziv varchar(50),
    mjesto int
);

create table mjesto(
    id int not null primary key auto_increment,
    naziv varchar(50)
);

create table djelo(
    id int not null primary key auto_increment,
    naziv varchar(50),
    autor varchar(50)
);

create table nakladnik_djelo(
    nakladnik int,
    djelo int
);

alter table nakladnik add foreign key (mjesto) references mjesto(id);

alter table nakladnik_djelo add foreign key (nakladnik) references nakladnik(id);

alter table nakladnik_djelo add foreign key (djelo) references djelo(id);

