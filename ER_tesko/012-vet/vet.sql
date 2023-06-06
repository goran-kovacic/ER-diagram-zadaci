# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\012-vet\vet.sql

drop database if exists vet;
create database vet;
use vet;

create table vlasnik(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    telefon varchar(50)
);

create table vrsta(
    id int not null primary key auto_increment,
    naziv varchar(50) not null
    
);

create table pasmina(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    vrsta int,
    foreign key (vrsta) references vrsta(id)
);

create table cipiranje(
    id int not null primary key auto_increment,
    datum date
);

create table zivotinja(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    vrsta int,
    pasmina int,
    vlasnik int,
    datum_rodjenja date,
    cipiranje int,
    foreign key (cipiranje) references cipiranje(id),
    foreign key (vrsta) references vrsta(id),
    foreign key (pasmina) references pasmina(id),
    foreign key (vlasnik) references vlasnik(id)
);

create table tretman(
    id int not null primary key auto_increment,
    naziv varchar(50)
);

create table termin(
    id int not null primary key auto_increment,
    datum date not null,
    sljedeci_termin date,
    tretman int,
    foreign key (tretman) references tretman(id),
    zivotinja int,
    foreign key (zivotinja) references zivotinja(id)

);
