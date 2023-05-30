# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_002.sql

drop database if exists zadatak_002;
create database zadatak_002;
use zadatak_002;

create table djelatnica(
	sifra int not null primary key auto_increment,
	iban varchar (50),
	email varchar (50),
	osoba int,
	korisnik int
);

create table korisnik (
	sifra int not null primary key auto_increment,
	osoba int,
	usluga int
);

create table usluga(
	sifra int not null primary key auto_increment,
	naziv varchar (50),
	cijena decimal (10,2)
);

create table osoba (
	sifra int not null primary key auto_increment,
	ime varchar (50),
	prezime varchar (50),
	telefon int
);


alter table djelatnica add foreign key (osoba) references osoba(sifra);

alter table djelatnica add foreign key (korisnik) references korisnik (sifra);

alter table korisnik add foreign key (osoba) references osoba(sifra);

alter table korisnik add foreign key (usluga) references usluga(sifra);


