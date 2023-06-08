# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\016-vinyl\vinyl.sql

drop database if exists vinyl;
create database vinyl;
use vinyl;

create table korisnik(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    email varchar(50) not null,
    password varchar(50) not null
);

create table ploca(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    autor varchar(50)
);

create table korisni_ploca(
    korisnik int,
    ploca int,
    foreign key (korisnik) references korisnik(id),
    foreign key (ploca) references ploca(id)
);

create table ponuda(
    id int not null primary key auto_increment,
    datum date,
    korisnik int,
    ploca int,
    naziv_oglasa varchar(50),
    foreign key (korisnik) references korisnik(id),
    foreign key (ploca) references ploca(id)
);

create table potraznja(
    id int not null primary key auto_increment,
    datum date,
    korisnik int,
    ploca int,
    naziv_oglasa varchar(50),
    foreign key (korisnik) references korisnik(id),
    foreign key (ploca) references ploca(id)
);

create table audio_sample(
    id int not null primary key auto_increment,
    ploca int,
    foreign key (ploca) references ploca(id),
    file_path varchar(200)
);