# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\021-panonian\panonian.sql

drop database if exists panonian;
create database panonian;
use panonian;

create table prijava (
    id  int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50),
    email varchar(50)
);

create table volonter(
    id int not null primary key auto_increment,
    prijava int,
    foreign key (prijava) references prijava(id)
);

create table natjecatelj(
    id int not null primary key auto_increment,
    prijava int,
    foreign key (prijava) references prijava(id)
);

create table vijest(
    id  int not null primary key auto_increment,
    naziv varchar(50) not null,
    datum date,
    opis text;
);

create table galerija(
    id int not null primary key auto_increment,
    naziv varchar(50),
    vijest int,
    foreign key (vijest) references vijest(id)
);

create table fotografija(
    id int not null primary key auto_increment,
    naziv varchar(50),
    galerija int,
    foreign key (galerija) references galerija(id)
);