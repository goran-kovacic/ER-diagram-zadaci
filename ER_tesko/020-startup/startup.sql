# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\020-startup\startup.sql

drop database if exists startup;
create database startup;
use startup;

create table registracija(
    id  int not null primary key auto_increment,
    korisnik varchar(50) not null,
    password varchar(50) not null,
    email varchar(50) not null
);

create table korisnik(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    registracija int,
    foreign key (registracija) references registracija(id)
);

create table vijest(
    id  int not null primary key auto_increment,
    naziv varchar(50) not null,
    datum date,
    opis text;
);

create table predlozak(
    id  int not null primary key auto_increment,
    naziv varchar(50) not null,
    adresa varchar(50),
    telefon varchar(50),
    email varchar(50),
    slika blob
);

