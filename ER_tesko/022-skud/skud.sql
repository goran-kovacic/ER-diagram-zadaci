# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\022-skud\skud.sql

drop database if exists skud;
create database skud;
use skud;

create table kontakt(
    id  int not null primary key auto_increment,
    adresa varchar(50),
    telefon varchar(50),
    email varchar(50)
);

create table obavijest(
    id  int not null primary key auto_increment,
    naziv varchar(50),
    datum date,
    opis text
);

create table galerija(
    id int not null primary key auto_increment,
    naziv varchar(50),
    obavijest int,
    foreign key (obavijest) references obavijest(id)
);

create table fotografija(
    id int not null primary key auto_increment,
    naziv varchar(50),
    galerija int,
    foreign key (galerija) references galerija(id)
);

create table grupa(
    id  int not null primary key auto_increment,
    naziv varchar(50),
    broj_clanova int
);

create table clan(
    id  int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    email varchar(50),
    grupa int,
    foreign key (grupa) references grupa (id)
);