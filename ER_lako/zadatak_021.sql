# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_021.sql

drop database if exists zadatak_021;
create database zadatak_021;
use zadatak_021;


create table dijete(
    id int not null primary key auto_increment,
    osoba int
);

create table skupina(
    id int not null primary key auto_increment,
    naziv varchar(50),
    teta int
);

create table dijete_skupina(
    dijete int,
    skupina int
);

create table teta(
    id int not null primary key auto_increment,
    iban varchar(50),
    osoba int
);

create table osoba(
    id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar (50)
);

alter table dijete add foreign key (osoba) references osoba(id);

alter table teta add foreign key (osoba) references osoba(id);

alter table dijete_skupina add foreign key (dijete) references dijete(id);

alter table dijete_skupina add foreign key (skupina) references skupina(id);

alter table skupina add foreign key (teta) references teta(id);

