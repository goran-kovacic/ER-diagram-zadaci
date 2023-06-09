# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\025-osnovnaskola\osnovnaskola.sql

drop database if exists osnovnaskola;
create database osnovnaskola;
use osnovnaskola;

create table korisnik(
    id  int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    email varchar(50)
);

create table informacija(
    id  int not null primary key auto_increment,
    naziv varchar(50),
    datum date,
    opis text
);

create table upit(
    id  int not null primary key auto_increment,
    korisnik int,
    foreign key (korisnik) references korisnik(id),
    datum date,
    upit text
);

