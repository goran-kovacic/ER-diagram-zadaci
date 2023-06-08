# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\013-babyrythm\babyrythm.sql

drop database if exists babyrythm;
create database babyrythm;
use babyrythm;

create table beba(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    datum_rodjenja date not null
);

create table aktivnost(
    id int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table dnevnik(
    id int not null primary key auto_increment,
    beba int,
    aktivnost int,
    vrijeme_aktivnosti datetime not null,
    komentar text,
    foreign key (beba) references beba(id),
    foreign key (aktivnost) references aktivnost(id)
);

create table dogadjaj(
    id int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table kalendar(
    id int not null primary key auto_increment,
    beba int,
    dogadjaj int,
    foreign key (beba) references beba(id),
    foreign key (dogadjaj) references dogadjaj(id),
    vrijeme datetime not null,
    komentar text
);

create table zdravstvena_aktivnost(
    id int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table zdravstveni_kalendar(
    id  int not null primary key auto_increment,
    datum datetime not null,
    beba int,
    zdravstvena_aktivnost int,
    foreign key (beba) references beba(id),
    foreign key (zdravstvena_aktivnost) references zdravstvena_aktivnost(id)
);