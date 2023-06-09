# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\029-plate\plate.sql

drop database if exists plate;
create database plate;
use plate;

create table namirnica(
    id  int not null primary key auto_increment,
    naziv varchar(50),
    cijena decimal(18,2)
);

create table recept(
    id int not null primary key auto_increment,
    naziv varchar(50),
    opis text,
    vrijeme_pripreme int
);

create table namirnica_recept(
    namirnica int,
    recept int,
    foreign key (namirnica) references namirnica(id),
    foreign key (recept) references recept(id)
);

