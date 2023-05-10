drop database if exists zadatak_3;
create database zadatak_3;
use zadatak_3;

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

