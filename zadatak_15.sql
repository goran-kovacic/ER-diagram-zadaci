# c:\xampp\mysql\bin\mysql -uroot < C:\Users\AMD\AppData\Roaming\DBeaverData\workspace6\General\Scripts\zadatak_15.sql

drop database if exists zadatak_15;
create database zadatak_15;
use zadatak_15;

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

