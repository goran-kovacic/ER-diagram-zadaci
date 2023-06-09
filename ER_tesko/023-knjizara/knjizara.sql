# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\023-knjizara\knjizara.sql

drop database if exists knjizara;
create database knjizara;
use knjizara;

create table vijest(
    id  int not null primary key auto_increment,
    naziv varchar(50) not null,
    datum date,
    opis text;
);

create table galerija(
    id int not null primary key auto_increment,
    naziv varchar(50),
    vijest int,
    foreign key (vijest) references vijest(id)
);

create table fotografija(
    id int not null primary key auto_increment,
    naziv varchar(50),
    galerija int,
    foreign key (galerija) references galerija(id)
);

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

create table informacija(
    id  int not null primary key auto_increment,
    naziv varchar(50),
    adresa varchar(50),
    kontakt varchar(50),
    komentar text
 );

 create table autor(
    id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    datum_rodjenja date
 );

 create table izdavac(
    id int not null primary key auto_increment,
    naziv varchar(50),
    email varchar(50)
 );

 create table knjiga(
    id  int not null primary key auto_increment,
    naziv varchar(50),
    autor int,
    izdavac int
    foreign key (autor) references autor(id),
    foreign key (izdavac) references izdavac(id)
 );

 