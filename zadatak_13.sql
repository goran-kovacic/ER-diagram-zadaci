# c:\xampp\mysql\bin\mysql -uroot < C:\Users\AMD\AppData\Roaming\DBeaverData\workspace6\General\Scripts\zadatak_13.sql

drop database if exists zadatak_13;
create database zadatak_13;
use zadatak_13;

create table razred(
    id int not null primary key auto_increment,
    godina int not null,
    odjel varchar(1)
);

create table razred_profesor(
    razred int,
    profesor int
);

create table profesor(
    id int not null primary key auto_increment,
    osoba int,
    iban varchar(50)
);

create table osoba(
    id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    telefon int,
    oib int
);

create table ucenik(
    id int not null primary key auto_increment,
    osoba int,
    razred int
);

alter table razred_profesor add foreign key (razred) references razred(id);

alter table razred_profesor add foreign key (profesor) references profesor(id);

alter table  profesor add foreign key (osoba) references osoba(id);

alter table ucenik add foreign key (osoba) references osoba(id);

alter table ucenik add foreign key (razred) references razred(id);

