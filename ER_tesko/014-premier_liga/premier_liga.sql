# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\014-premier_liga\premier_liga.sql

drop database if exists premier_liga;
create database premier_liga;
use premier_liga;

create table korisnik(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    email varchar(50) not null,
    password varchar(50) not null
);

create table mjesto(
    id int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table trener(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    datum_rodjenja date,
    mjesto_rodjenja int,
    foreign key (mjesto_rodjenja) references mjesto(id)
);

create table klub(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    trener int,
    foreign key (trener) references trener(id),
    mjesto int,
    foreign key (mjesto) references mjesto(id)
);

create table utakmica(
    id int not null primary key auto_increment,
    mjesto int,
    foreign key(mjesto) references mjesto(id),
    datum date,
    domaci int,
    gostujuci int,
    foreign key (domaci) references klub(id),
    foreign key (gostujuci) references klub(id)
);

create table igrac(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    mjesto_rodjenja int,
    foreign key (mjesto_rodjenja) references mjesto(id),
    datum_rodjenja date,
    klub int,
    foreign key (klub) references klub(id)
);

create table oklada(
    id int not null primary key auto_increment,
    korisnik int,
    utakmica int,
    klub int,
    iznos decimal (18,2),
    foreign key (korisnik) references korisnik(id),
    foreign key (utakmica) references utakmica(id),
    foreign key (klub) references klub(id)
);

create table ulaznica(
    id int not null primary key auto_increment,
    cijena decimal (18,2),
    utakmica int,
    foreign key (utakmica) references utakmica(id)
);

create table rezervacija(
    id int not null primary key auto_increment,
    korisnik int,
    ulaznica int,
    foreign key (korisnik) references korisnik(id),
    foreign key (ulaznica) references ulaznica(id)
);

