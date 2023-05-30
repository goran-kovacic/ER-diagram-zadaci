# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_009.sql

drop database if exists zadatak_009;
create database zadatak_009;
use zadatak_009;

create table urar (
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
    urar int
);

create table korisnik(
    id int not null primary key auto_increment,
    osoba int,
    sat int
);

create table popravak_sat(
    popravak int,
    sat int
);

create table sat(
    id int not null primary key auto_increment,
    naziv varchar(50)
);

alter table urar add foreign key (osoba) references osoba(id);

alter table segrt add foreign key (osoba) references osoba(id);

alter table korisnik add foreign key (osoba) references osoba(id);

alter table korisnik add foreign key (sat) references sat(id);

alter table popravak add foreign key (segrt) references segrt(id);

alter table popravak add foreign key (urar) references urar(id);

alter table popravak_sat add foreign key (popravak) references popravak(id);

alter table popravak_sat add foreign key (sat) references sat(id);