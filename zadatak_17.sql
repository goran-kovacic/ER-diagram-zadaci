# c:\xampp\mysql\bin\mysql -uroot < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_17.sql

drop database if exists zadatak_17;
create database zadatak_17;
use zadatak_17;

create table djelatnik(
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
    ime varchar (50),
    prezime varchar (50)
);

create table popravak(
    id int not null primary key auto_increment,
    naziv varchar(50),
    djelatnik int,
    segrt int
);

create table popravak_kvar(
    popravak int,
    kvar int
);

create table kvar(
    id int not null primary key auto_increment,
    naziv varchar(50)
);

alter table djelatnik add foreign key (osoba) references osoba(id);

alter table segrt add foreign key (osoba) references osoba(id);

alter table popravak add foreign key (djelatnik) references djelatnik(id);

alter table popravak add foreign key (segrt) references segrt(id);

alter table popravak_kvar add foreign key (popravak) references popravak(id);

alter table popravak_kvar add foreign key (kvar) references kvar(id);

