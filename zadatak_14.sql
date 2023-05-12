# c:\xampp\mysql\bin\mysql -uroot < C:\Users\AMD\AppData\Roaming\DBeaverData\workspace6\General\Scripts\zadatak_14.sql

drop database if exists zadatak_14;
create database zadatak_14;
use zadatak_14;

create table trgovina(
    id int not null primary key auto_increment,
    naziv varchar (50),
    sef int
);

create table trgovina_osoba(
    trgovina int,
    osoba int
);

create table osoba(
    id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50),
    oib int,
    telefon int,
    iban varchar(50),
    sef int
);

alter table trgovina add foreign key (sef) references osoba(id);

alter table trgovina_osoba add foreign key (trgovina) references trgovina(id);

alter table trgovina_osoba  add foreign key (osoba) references osoba(id);

alter table osoba add foreign key (sef) references osoba(id);

