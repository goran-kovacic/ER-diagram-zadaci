# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\030-dubrovnik\dubrovnik.sql

drop database if exists dubrovnik;
create database dubrovnik;
use dubrovnik;

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

create table ocjena(
    id  int not null primary key auto_increment,
    ocjena int,
    korisnik int,
    foreign key (korisnik) references korisnik(id)
);

create table destinacija(
    id int not null primary key auto_increment,
    naziv varchar(50),

);

create table kritika(
    id int not null primary key auto_increment,
    korisnik int,
    foreign key (korisnik) references korisnik(id),
    naslov varchar(50),
    opis text,
    destinacija int,
    foreign key (destinacija) references destinacija(id)
);

create table prijedlog(
    id int not null primary key auto_increment,
    korisnik int,
    foreign key (korisnik) references korisnik(id),
    prijedlog text,
    datum date,
    destinacija int,
    foreign key (destinacija) references destinacija(id)
);

create table slobodni_termin(
    id int not null primary key auto_increment,
    korisnik int,
    foreign key (korisnik) references korisnik(id),
    foreign key (destinacija) references destinacija(id),
    datum_pocetak date,
    datum_kraj date
);

