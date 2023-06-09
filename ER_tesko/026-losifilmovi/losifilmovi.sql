# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\026-losifilmovi\losifilmovi.sql

drop database if exists losifilmovi;
create database losifilmovi;
use losifilmovi;

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

create table glumac(
    id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    datum_rodjenja date,
);
create table film(
    id int not null primary key auto_increment,
    naslov varchar(50),
);

create table glumac_film(
    glumac int,
    film int,
    foreign key (glumac) references glumac(id),
    foreign key (film) references film (id)
);

create table recenzija(
    id  int not null primary key auto_increment,
    tekst text,
    datum date,
    korisnik int,
    foreign key (korisnik) references korisnik(id)
);

create table ocjena(
    id  int not null primary key auto_increment,
    ocjena int,
    korisnik int,
    foreign key (korisnik) references korisnik(id)
);

