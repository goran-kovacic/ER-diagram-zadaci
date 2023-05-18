# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_007.sql

drop database if exists zadatak_007;
create database zadatak_007;
use zadatak_007;

create table vozilo(
    id int not null primary key auto_increment,
    broj int,
    vozac int
);

create table vozac(
    id int not null primary key auto_increment,
    voznja int,
    osoba int,
    iban varchar(50)
);

create table voznja(
    id int not null primary key auto_increment
);

create table voznja_putnik(
    voznja int,
    putnik int
);

create table putnik(
    id int not null primary key auto_increment,
    voznja_putnik int,
    osoba int
);

create table osoba(
    id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50)
);

alter table vozilo add foreign key (vozac) references vozac(id);

alter table vozac add foreign key (voznja) references voznja(id);

alter table vozac add foreign key (osoba) references osoba(id);

alter table voznja_putnik add foreign key (voznja) references voznja(id);

alter table voznja_putnik add foreign key (putnik) references putnik(id);

alter table putnik add foreign key (osoba) references osoba (id);

