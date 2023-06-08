# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\019-kavisimo\kavisimo.sql

drop database if exists kavisimo;
create database kavisimo;
use kavisimo;

create table korisnik (
    id  int not null primary key auto_increment,
    ime varchar(50) not null
);

create table vlasnik(
    id  int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    email varchar(50)
);

create table dodatne_pogodnosti(
    id int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table kafic(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    vlasnik int,
    foreign key (vlasnik) references vlasnik(id),
    adresa varchar(50),
    dodatne_pogodnosti int,
    foreign key (dodatne_pogodnosti) references dodatne_pogodnosti(id)
);

create table prijava(
    id int not null primary key auto_increment,
    vlasnik int,
    prijava text,
    foreign key (vlasnik) references vlasnik(id)
);

create table recenzija(
    id int not null primary key auto_increment,
    korisnik int,
    kafic int,
    foreign key (kafic) references kafic(id),
    foreign key (korisnik) references korisnik(id),
    ocjena int,
    komentar text
);
