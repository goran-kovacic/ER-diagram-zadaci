# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\027-sclavonia\sclavonia.sql

drop database if exists sclavonia;
create database sclavonia;
use sclavonia;

create table korisnik(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50)
);

create table grad(
    id int not null primary key auto_increment,
    naziv varchar(50)
);

create table lokacija(
    id  int not null primary key auto_increment,
    vrsta_lokacije varchar(50),
    adresa varchar(50),
    naziv varchar(50),
    grad int,
    foreign key (grad) references grad(id)
);

create table izmjena(
    id  int not null primary key auto_increment,
    korisnik int,
    foreign key (korisnik) references korisnik(id),
    tekst text,
    lokacije int,
    foreign key (lokacija) references lokacija(id)
);

create table kritika(
    id  int not null primary key auto_increment,
    korisnik int,
    foreign key (korisnik) references korisnik(id),
    tekst text,
    lokacije int,
    foreign key (lokacija) references lokacija(id)
);