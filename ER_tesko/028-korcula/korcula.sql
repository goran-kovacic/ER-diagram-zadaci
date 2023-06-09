# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\028-korcula\korcula.sql

drop database if exists korcula;
create database korcula;
use korcula;

create table zvanje(
    id  int not null primary key auto_increment,
    naziv varchar(50)
);

create table korisnik(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    sifra varchar(50) not null,
    zvanje int,
    foreign key (zvanje) references zvanje(id)
);

create table dogadjaj(
    id int not null primary key auto_increment,
    naslov varchar(50),
    datum date,
    opis text
);

create table kritike(
    id int not null primary key auto_increment,
    korisnik int,
    foreign key (korisnik) references korisnik(id),
    naslov varchar(50),
    opis text
);

