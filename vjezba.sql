# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\vjezba.sql

drop database if exists vjezba;
create database vjezba;
use vjezba;

create table operater(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50),
    oib varchar(50),
    lozinka varchar(50)
);

create table djelatnik(
    id int not null primary key auto_increment,
    iban varchar(50),
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib varchar(50),
    radnoMjesto varchar(50)
);

create table dijete(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    imeRoditelja varchar(50) not null,
    prezime varchar(50) not null,
    telefon varchar(50)
);

create table posjeta(
    id int not null primary key auto_increment,
    datumVrijemeDolaska datetime,
    datumVrijemeOdlaska datetime,
    napomena varchar(50),
    djelatnik_id int
);

create table usluga(
    id int not null primary key auto_increment,
    cijena decimal(18,2),
    jedinicaMjere varchar(50),
    kolicina decimal(18,2),
    naziv varchar(50)
);

create table dijeteposjeta(
    dijete int,
    posjeta int
);

create table uslugaposjeta(
    usluga int,
    posjeta int
);


alter table posjeta add foreign key (djelatnik_id) references djelatnik(id);

alter table dijeteposjeta add foreign key (dijete) references dijete(id);

alter table dijeteposjeta add foreign key (posjeta) references posjeta(id);

alter table uslugaposjeta add foreign key (usluga) references usluga(id);

alter table uslugaposjeta add foreign key (posjeta) references posjeta(id);

insert into djelatnik (id,iban,ime,prezime,oib,radnoMjesto) values
(null,null,'djelatnik_ime_1','djelatnik_prezime_1',null,'radnik');

insert into djelatnik (id,iban,ime,prezime,oib,radnoMjesto) values
(null,null,'djelatnik_ime_2','djelatnik_prezime_2',null,'radnik');

insert into djelatnik (id,iban,ime,prezime,oib,radnoMjesto) values
(null,null,'djelatnik_ime_3','djelatnik_prezime_3',null,'radnik');

insert into operater (id,ime,prezime,email,oib,lozinka) values
(null,'operater_1','operater_prezime_',null,null,null);

insert into dijete (id,ime,imeRoditelja,prezime,telefon) values
(null,'dijete_ime_1','imeRoditelja_1','prezime_dijete_1',null);

insert into dijete (id,ime,imeRoditelja,prezime,telefon) values
(null,'dijete_ime_2','imeRoditelja_2','prezime_dijete_2',null);

insert into dijete (id,ime,imeRoditelja,prezime,telefon) values
(null,'dijete_ime_3','imeRoditelja_3','prezime_dijete_3',null);

update djelatnik set ime='Ana' where id=1;

delete from djelatnik where id=2;

