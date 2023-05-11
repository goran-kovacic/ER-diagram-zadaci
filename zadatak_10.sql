# c:\xampp\mysql\bin\mysql -uroot < C:\Users\AMD\AppData\Roaming\DBeaverData\workspace6\General\Scripts\zadatak_10.sql

drop database if exists zadatak_10;
create database zadatak_10;
use zadatak_10;

create table doktor(
    id int not null primary key auto_increment,
    iban varchar(50),
    osoba int
);

create table sestra(
    id int not null primary key auto_increment,
    iban varchar(50),
    osoba int
);

create table zahvat(
    id int not null primary key auto_increment,
    naziv varchar(50),
    doktor int,
    sestra int
);

create table osoba(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    telefon int,
    email varchar(50),
    DOB date
);

create table zahvat_pacijent(
    zahvat int,
    pacijent int
);

create table pacijent(
    id int not null primary key auto_increment,
    osoba int
);

alter table doktor add foreign key (osoba) references osoba(id);

alter table sestra add foreign key (osoba) references osoba(id);

alter table zahvat add foreign key (doktor) references doktor(id);

alter table zahvat add foreign key (sestra) references sestra(id);

alter table zahvat_pacijent add foreign key (zahvat) references zahvat(id);

alter table zahvat_pacijent add foreign key (pacijent) references pacijent(id);

alter table pacijent add foreign key (osoba) references osoba(id);

