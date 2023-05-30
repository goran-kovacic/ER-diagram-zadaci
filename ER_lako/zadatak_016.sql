# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_016.sql

drop database if exists zadatak_016;
create database zadatak_016;
use zadatak_016;

create table proizvod(
    id int not null primary key auto_increment,
    naziv varchar(50),
    cijena decimal (18,2),
    djelatnik int
);

create table proizvod_sirovina(
    proizvod int,
    sirovina int
);

create table sirovina(
    id int not null primary key auto_increment,
    naziv varchar(50)
);

create table djelatnik(
    id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    iban varchar (50)
);

alter table proizvod add foreign key (djelatnik) references djelatnik(id);

alter table proizvod_sirovina add foreign key (proizvod) references proizvod(id);

alter table proizvod_sirovina add foreign key (sirovina) references sirovina (id);

