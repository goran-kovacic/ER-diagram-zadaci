# c:\xampp\mysql\bin\mysql -uroot < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_22.sql

drop database if exists zadatak_22;
create database zadatak_22;
use zadatak_22;


create table clan(
    id int not null primary key auto_increment,
    broj_clana int,
    osoba int
);

create table vlasnik(
    id int not null primary key auto_increment,
    osoba int
);

create table knjiga(
    id int not null primary key auto_increment,
    naziv varchar(50),
    autor varchar(50),
    vlasnik int
);

create table clan_knjiga(
    clan int,
    knjiga int,
    vlasnik int
);

create table osoba(
    id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50)
);

alter table clan add foreign key (osoba) references osoba(id);

alter table vlasnik add foreign key (osoba) references osoba(id);

alter table knjiga add foreign key (vlasnik) references vlasnik(id);

alter table clan_knjiga add foreign key (clan) references clan(id);

alter table clan_knjiga add foreign key (knjiga) references knjiga(id);

alter table clan_knjiga add foreign key (vlasnik) references vlasnik(id);

