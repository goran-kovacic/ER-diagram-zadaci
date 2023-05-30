# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_008.sql

drop database if exists zadatak_008;
create database zadatak_008;
use zadatak_008;

create table postolar (
    id int not null primary key auto_increment,
    osoba int
);

create table segrt(
    id int not null primary key auto_increment,
    osoba int,
    iban varchar(50)
);

create table osoba(
    id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50)
);

create table popravak(
    id int not null primary key auto_increment,
    naziv varchar(50),
    segrt int,
    postolar int
);

create table korisnik(
    id int not null primary key auto_increment,
    osoba int,
    obuca int
);

create table popravak_obuca(
    popravak int,
    obuca int
);

create table obuca(
    id int not null primary key auto_increment,
    naziv varchar(50)
);

alter table postolar add foreign key (osoba) references osoba(id);

alter table segrt add foreign key (osoba) references osoba(id);

alter table korisnik add foreign key (osoba) references osoba(id);

alter table korisnik add foreign key (obuca) references obuca(id);

alter table popravak add foreign key (segrt) references segrt(id);

alter table popravak add foreign key (postolar) references postolar(id);

alter table popravak_obuca add foreign key (popravak) references popravak(id);

alter table popravak_obuca add foreign key (obuca) references obuca(id);