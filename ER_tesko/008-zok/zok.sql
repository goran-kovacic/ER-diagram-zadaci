# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\008-zok\zok.sql

drop database if exists zok;
create database zok;
use zok;

create table korisnik(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    email varchar(50) not null
);

create table igrac(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib varchar(50) not null,
    telefon varchar(50)
);

create table klub(
    id int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table mjesto(
    id int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table utakmica(
    id int not null primary key auto_increment,
    naziv varchar(50),
    datum date,
    domaci int,
    gostujuci int,
    mjesto int,
    foreign key (domaci) references klub(id),
    foreign key (gostujuci) references klub(id),
    foreign key (mjesto) references mjesto(id)
);

create table komentar(
    id int not null primary key auto_increment,
    tekst text not null,
    igrac int,
    korisnik int,
    foreign key (igrac) references igrac(id),
    foreign key (korisnik) references korisnik(id)
);

create table vijest(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    datum date,
    tekst text,
    igrac int,
    foreign key (igrac) references igrac(id)
);