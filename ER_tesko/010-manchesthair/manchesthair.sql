# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\010-manchesthair\manchesthair.sql

drop database if exists manchesthair;
create database manchesthair;
use manchesthair;

create table vjestina(
    id int not null primary key auto_increment,
    naziv varchar(50)
);

create table korisnik(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    password varchar(50) not null,
    email varchar(50) not null,
    karma int
);

create table korisnik_zanimanje(
    id int not null primary key auto_increment,
    korisnik int,
    vjestina int,
    foreign key (korisnik) references korisnik(id),
    foreign key (vjestina) references vjestina(id)
);

create table ponuda(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    opis text,
    korisnik int,
    vjestina int,
    foreign key (korisnik) references korisnik(id),
    foreign key (vjestina) references vjestina(id)
);
