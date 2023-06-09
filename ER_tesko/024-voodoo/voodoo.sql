# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\024-voodoo\voodoo.sql

drop database if exists voodoo;
create database voodoo;
use voodoo;

create table korisnik(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null
);

create table prijava (
    id  int not null primary key auto_increment,
    korisnik int,
    foreign key (korisnik) references korisnik(id)
);

create table komentar(
    id  int not null primary key auto_increment,
    korisnik int,
    tekst text,
    foreign key (korisnik) references korisnik(id)
);

create table dogadjaj(
    id  int not null primary key auto_increment,
    naziv varchar(50),
    datum date,
    komentar int,
    prijava int,
    foreign key (komentar) references komentar(id),
    foreign key (prijava) references prijava(id)
);

create table galerija(
    id int not null primary key auto_increment,
    naziv varchar(50),
    dogadjaj int,
    foreign key (dogadjaj) references dogadjaj(id)
);

create table fotografija(
    id int not null primary key auto_increment,
    naziv varchar(50),
    galerija int,
    komentar int,
    foreign key (komentar) references komentar(id),
    foreign key (galerija) references galerija(id)
);

