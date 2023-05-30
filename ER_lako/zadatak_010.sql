# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_010.sql


drop database if exists zadatak_010;
create database zadatak_010;
use zadatak_010;

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



insert into osoba (id,ime,prezime,telefon,email,DOB) values
(null,'doktor_ime1','doktor_prezime1',null,null,null),
(null,'doktor_ime2','doktor_prezime2',null,null,null),
(null,'sestra_ime1','sestra_prezime1',null,null,null),
(null,'sestra_ime2','sestra_prezime2',null,null,null),
(null,'pacijent_ime1','pacijent_ime1',null,null,null),
(null,'pacijent_ime2','pacijent_ime2',null,null,null);



insert into doktor (id,iban,osoba) values
(null,null,1),
(null,null,2);



insert into sestra (id,iban,osoba) values
(null,null,3),
(null,null,4);



insert into pacijent (id,osoba) values
(null,5),
(null,6);



insert into zahvat (id,naziv,doktor,sestra) values
(null,'zahvat_1',2,2),
(null,'zahvat_2',1,1);



insert into zahvat_pacijent(zahvat,pacijent) values
(1,1),(2,2);