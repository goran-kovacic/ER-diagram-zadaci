# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_003.sql

drop database if exists zadatak_003;
create database zadatak_003;
use zadatak_003;

create table djelatnik(
	sifra int not null primary key auto_increment,
	ime  varchar(50),
	prezime varchar(50),
	iban varchar(50),
	email varchar(50),
	telefon int,
	sticenik int
);

create table sticenik(
	sifra int not null primary key auto_increment,
	ime varchar(50),
	vrsta varchar(50),
	prostor int
);

create table prostor(
	sifra int not null primary key auto_increment,
	broj_prostora int,
	velicina_prostora int
);

alter table djelatnik add foreign key (sticenik) references sticenik(sifra);

alter table sticenik  add foreign key (prostor) references prostor(sifra);

