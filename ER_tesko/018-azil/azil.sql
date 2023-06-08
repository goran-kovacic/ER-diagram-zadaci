# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\018-azil\azil.sql

drop database if exists azil;
create database azil;
use azil;

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

create table informacije(
    id  int not null primary key auto_increment,
    naziv varchar(50),
    adresa varchar(50),
    kontakt varchar(50),
    komentar text
 );

 create table vrsta(
    id  int not null primary key auto_increment,
    naziv varchar(50) not null
 );

 create table zivotinja(
    id int not null primary key auto_increment,
    naziv varchar(50),
    vrsta int,
    foreign key (vrsta) references vrsta(id),
    datum_rodjenja date,
    zdravlje text,
    osobine text
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
    zivotinja int,
    foreign key (zivotinja) references zivotinja(id)
);

create table pogled(
    id  int not null primary key auto_increment,
    zivotinja int,
    foreign key (zivotinja) references zivotinja(id),
    registracija int,
    foreign key (registracija) references registracija(id)
);

create table udomljavanje(
    id  int not null primary key auto_increment,
    korisnik int,
    foreign key (korisnik) references korisnik(id),
    komentar text
);