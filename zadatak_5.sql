drop database if exists zadatak_5;
create database zadatak_5;
use zadatak_5;

create table izlozba(
	sifra int not null primary key auto_increment,
	ime varchar(50),
	kustos int,
	sponzor int
);

create table djelo(
	sifra int not null primary key auto_increment,
	naziv varchar(50),
	autor varchar(50),
	izlozba int
);

create table kustos(
	sifra int not null primary key auto_increment,
	iban varchar(50),
	osoba int
);

create table sponzor(
	sifra int not null primary key auto_increment,
	osoba int
);

create table osoba(
	sifra int not null primary key auto_increment,
	ime varchar(50),
	prezime varchar(50),
	oib varchar(50),
	kontakt varchar(50)
);

alter table izlozba add foreign key (kustos) references kustos(sifra);

alter table izlozba add foreign key (sponzor) references sponzor(sifra);

alter table djelo add foreign key (izlozba) references izlozba(sifra);

alter table kustos add foreign key (osoba) references osoba(sifra);

alter table sponzor add foreign key (osoba) references osoba(sifra);

