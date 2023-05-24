#  c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\Polaznik\Documents\EdunovaJP28\galerija.sql

drop database if exists galerija;
create database galerija;
use galerija;

create table galerija(
    id int not null primary key auto_increment,
    naziv varchar(50),
    nadredena int,
    autor_id int
);

create table autor(
    id int not null primary key auto_increment,
    ime varchar (50),
    prezime varchar (50)
);

create table slika(
    id int not null primary key auto_increment,
    galerija int,
    putanja varchar(255)
);

create table oznaka(
    id int not null primary key auto_increment,
    naziv varchar(50)
);

create table slika_oznaka(
    slika int,
    oznaka int
);

alter table galerija add foreign key (nadredena) references galerija(id);

alter table galerija add foreign key (autor_id) references autor(id);

alter table slika add foreign key (galerija) references galerija(id);

alter table slika_oznaka add foreign key (slika) references slika(id);

alter table slika_oznaka add foreign key (oznaka) references oznaka(id);

insert into autor (id,ime,prezime) values
(null,'ime_1','prezime_1'),
(null,'ime_2','prezime_2'),
(null,'ime_3','prezime_3');

insert into galerija (id,naziv,nadredena,autor_id) values
(null,'galerija_1',null,1),
(null,'galerija_2',1,1),
(null,'galerija_3',2,1);



insert into slika (id,galerija,putanja) values
(null,1,'C:\slika1.jpg'),
(null,2,'C:\slika2.jpg'),
(null,3,'C:\slika3.jpg');

insert into oznaka (id,naziv) values
(null,'sport'),
(null,'priroda'),
(null,'tehnika');

insert into slika_oznaka (slika,oznaka) values
(1,1),
(2,1),
(3,1);

update oznaka set naziv='tehnologija' where id=3;
update oznaka set naziv='nature' where id=2;

delete from autor where id=3;

delete from oznaka where id=2;

