# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\hijerarhija.sql


drop database if exists hijerarhija;
create database hijerarhija;
use hijerarhija;

create table zaposlenik(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    placa decimal(18,2),
    nadredeni int
);

alter table zaposlenik add foreign key (nadredeni) references zaposlenik(id);

insert into zaposlenik(id,ime,prezime,placa,nadredeni) values
(null,'ime1','prezime1',null,null);

insert into zaposlenik(id,ime,prezime,placa,nadredeni) values
(null,'ime2','prezime2',null,1);

insert into zaposlenik(id,ime,prezime,placa,nadredeni) values
(null,'ime3','prezime3',null,1);

