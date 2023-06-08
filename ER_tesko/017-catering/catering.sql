# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\017-catering\catering.sql

drop database if exists catering;
create database catering;
use catering;

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


create table ponuda(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(18,2) not null
);

create table nazudzba(
    id int not null primary key auto_increment,
    korisnik int,
    foreign key (korisnik) references korisnik(id),
    ponuda int,
    foreign key (ponuda) references ponuda(id),
    vrsta varchar(50),
    datum date
);

create table komentar(
    id int not null primary key auto_increment,
    komentar text,
    registracija int,
    foreign key (registracija) references registracija(id),
    datum date,
    ponuda int,
    foreign key (ponuda) references ponuda(id)
);

create table galerija(
    id int not null primary key auto_increment,
    naziv varchar(50)
);

create table fotografija(
    id int not null primary key auto_increment,
    naziv varchar(50),
    galerija int,
    foreign key (galerija) references galerija(id),
    ponuda int,
    foreign key (ponuda) references ponuda(id)
);

create table rating(
    id int not null primary key auto_increment,
    korisnik int,
    foreign key (korisnik) references korisnik(id),
    ocjena int,
    ponuda int,
    foreign key (ponuda) references ponuda(id)
);
 create table informacije(
    id  int not null primary key auto_increment,
    naziv varchar(50),
    adresa varchar(50),
    kontakt varchar(50),
    komentar text
 );