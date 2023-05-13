# c:\xampp\mysql\bin\mysql -uroot < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\zupanije.sql

drop database if exists zupanije;
create database zupanije;
use zupanije;

create table zupanija(
    id int not null primary key auto_increment,
    naziv varchar(100),
    zupan int
);

create table zupan(
    id int not null primary key auto_increment,
    ime varchar(50),
    prezime varchar(50)
);

create table opcina(
    id int not null primary key auto_increment,
    zupanija int,
    naziv varchar(50)
);

create table mjesto(
    id int not null primary key auto_increment,
    opcina int,
    naziv varchar(50)
);


alter table zupanija add foreign key (zupan) references zupan(id);

alter table opcina add foreign key (zupanija) references zupanija(id);

alter table mjesto add foreign key (opcina) references opcina(id);


