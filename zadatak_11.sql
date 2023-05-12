# c:\xampp\mysql\bin\mysql -uroot < C:\Users\AMD\AppData\Roaming\DBeaverData\workspace6\General\Scripts\zadatak_11.sql

drop database if exists zadatak_11;
create database zadatak_11;
use zadatak_11;

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

