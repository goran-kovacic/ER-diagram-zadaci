# c:\xampp\mysql\bin\mysql -uroot < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_18.sql

drop database if exists zadatak_18;
create database zadatak_18;
use zadatak_18;

create table odvjetnik(
    id int not null primary key auto_increment,
    osoba int
);

create table suradnik(
    id int not null primary key auto_increment,
    iban varchar(50),
    osoba int
);

create table obrana(
    id int not null primary key auto_increment,
    naziv varchar(50)
);

create table osoba(
    id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50)
);

create table klijent(
    id int not null primary key auto_increment,
    osoba int
);

create table obrana_klijent(
    obrana int,
    klijent int
);

create table obrana_odvjetnik(
    obrana int,
    odvjetnik int
);

create table obrana_suradnik(
    obrana int,
    suradnik int
);

alter table odvjetnik add foreign key (osoba) references osoba(id);

alter table suradnik add foreign key (osoba) references osoba(id);

alter table klijent add foreign key (osoba) references osoba(id);

alter table obrana_suradnik add foreign key (obrana) references obrana(id);

alter table obrana_suradnik add foreign key (suradnik) references suradnik(id);

alter table obrana_odvjetnik add foreign key (obrana) references obrana(id);

alter table obrana_odvjetnik add foreign key (odvjetnik) references odvjetnik(id);

alter table obrana_klijent add foreign key (obrana) references obrana(id);

alter table obrana_klijent add foreign key (klijent) references klijent(id);


