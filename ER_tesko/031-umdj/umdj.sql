# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\031-umdj\umdj.sql

drop database if exists umdj;
create database umdj;
use umdj;

create table mjesto(
    id  int not null primary key auto_increment,
    naziv varchar(50)
);

create table korisnik(
    id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    email varchar(50)
);

create table aktivnost(
    id int not null primary key auto_increment,
    mjesto int,
    foreign key (mjesto) references mjesto(id),
    naziv varchar(50),
    datum date,
    trajanje time,
    odgovorna_osoba int,
    foreign key (odgovorna_osoba) references korisnik(id)
);
