# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zadatak_011.sql

drop database if exists zadatak_011;
create database zadatak_011;
use zadatak_011;

create table student(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    br_indeksa int not null
);

create table student_rok(
    student int,
    rok int
);

create table rok(
    id int not null primary key auto_increment,
    datum date,
    kolegij int
);

create table kolegij(
    id int not null primary key auto_increment,
    naziv varchar(50),
    ECTS int
);

alter table student_rok add foreign key (student) references student(id);

alter table student_rok add foreign key (rok) references rok(id);

alter table rok add foreign key (kolegij) references kolegij(id);

