drop database if exists zadatak_1;
create database zadatak_1;
use zadatak_1;

create table usluga(
	sifra int not null primary key auto_increment,
	naziv varchar(50),
	cijena decimal(10,2)
);

create table djelatnica(
	sifra int not null primary key auto_increment,
	iban varchar(50),
	osoba int,
	email varchar(50),
	korisnik int
);

create table korisnik(
	sifra int not null primary key auto_increment,
	osoba int,
	usluga int
);

create table osoba(
	sifra int not null primary key auto_increment,
	ime varchar (50),
	prezime varchar (50),
	telefon int
);

alter table djelatnica add foreign key (osoba) references osoba(sifra);

alter table djelatnica add foreign key (korisnik) references korisnik(sifra);

alter table korisnik add foreign key (osoba) references osoba(sifra);

alter table korisnik add foreign key (usluga) references usluga(sifra);

