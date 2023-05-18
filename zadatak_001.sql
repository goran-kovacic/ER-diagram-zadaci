# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_001.sql

drop database if exists zadatak_001;
create database zadatak_001;
use zadatak_001;

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

insert into osoba (sifra,ime,prezime,telefon) values
(null,'ime1','prezime1',null),
(null,'ime1','prezime1',null),
(null,'ime1','prezime1',null);

insert into usluga (sifra, naziv,cijena) values
(null,'usluga1',150),
(null,'usluga2',200),
(null,'usluga3',45);

insert into korisnik (osoba,usluga) values
(2,1),(3,3);

insert into djelatnica (osoba,korisnik) values
(1,2),(1,1);

