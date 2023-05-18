# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_020.sql

drop database if exists zadatak_020;
create database zadatak_020;
use zadatak_020;


create table clan(
    id int not null primary key auto_increment,
    osoba int
);

create table osoba(
    id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50)  
);

create table nastup(
    id int not null primary key auto_increment,
    naziv varchar(100),
    mjesto int
);

create table clan_nastup(
    clan int,
    nastup int
);

create table mjesto(
    id int not null primary key auto_increment,
    naziv varchar(50)
);

alter table clan add foreign key (osoba) references osoba(id);

alter table clan_nastup add foreign key (clan) references clan(id);

alter table clan_nastup add foreign key (nastup) references nastup(id);

alter table nastup add foreign key (mjesto) references mjesto(id);

