# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\015-baranja\baranja.sql

drop database if exists baranja;
create database baranja;
use baranja;

create table korisnik(
    id  int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib varchar(50)
);

create table mjesto(
    id int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table agencija(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    korisnik int,
    foreign key (korisnik) references korisnik(id)
);

create table objekt(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    mjesto int,
    foreign key (mjesto) references mjesto(id),
    korisnik int,
    foreign key (korisnik) references korisnik(id)
);

create table uplata(
    id int not null primary key auto_increment,
    korisnik int,
    agencija int,
    datum date,
    cijena decimal(18,2),
    foreign key (korisnik) references korisnik(id),
    foreign key (agencija) references agencija(id)
);

