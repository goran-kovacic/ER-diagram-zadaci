# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\009-katalog\katalog.sql

drop database if exists katalog;
create database katalog;
use katalog;

create table korisnik(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50) ,
    password varchar(50) not null
);

create table mjesto(
    id int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table autor(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    datum_rodjenja date,
    datum_smrti date,
    mjesto_rodjenja int,
    foreign key (mjesto_rodjenja) references mjesto(id)
);

create table izdavac(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    mjesto int,
    foreign key (mjesto) references mjesto(id)
);

create table djelo(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    autor int,
    mjesto int,
    izdavac int,
    godina_izdanja date,
    foreign key (autor) references autor(id),
    foreign key (mjesto) references mjesto(id),
    foreign key (izdavac) references izdavac(id)
);