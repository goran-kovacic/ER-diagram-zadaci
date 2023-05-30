# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_015.sql

drop database if exists zadatak_015;
create database zadatak_015;
use zadatak_015;

create table kategorija(
    id int not null primary key auto_increment,
    naziv varchar(50)
);

create table jelo(
    id int not null primary key auto_increment,
    kategorija int,
    naziv varchar(50),
    cijena decimal (18,2)
);

create table jelo_pice(
    jelo int,
    pice int
);

create table pice(
    id int not null primary key auto_increment,
    naziv varchar(50),
    cijena decimal(18,2)
);

alter table jelo add foreign key (kategorija) references kategorija(id);

alter table jelo_pice add foreign key (jelo) references jelo(id);

alter table jelo_pice add foreign key (pice) references pice(id);

