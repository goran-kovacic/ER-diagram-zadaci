# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_012.sql

drop database if exists zadatak_012;
create database zadatak_012;
use zadatak_012;

create table ucenik(
    id int not null primary key auto_increment,
    osoba int
);

create table ucenik_radionica(
    ucenik int,
    radionica int
);

create table radionica(
    id int not null primary key auto_increment,
    datum date,
    uciteljica int
);

create table uciteljica(
    id int not null primary key auto_increment,
    osoba int
);

create table osoba(
    id int not null primary key auto_increment,
    ime varchar (50) not null,
    prezime varchar(50) not null

);

alter table ucenik add foreign key (osoba) references osoba(id);

alter table ucenik_radionica add foreign key (ucenik) references ucenik(id);

alter table ucenik_radionica add foreign key (radionica) references radionica(id);

alter table uciteljica add foreign key (osoba) references osoba(id);

