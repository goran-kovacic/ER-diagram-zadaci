# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\ER_tesko\011-rap\rap.sql

drop database if exists rap;
create database rap;
use rap; 

create table autor(
    id int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table album(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    datum_izdavanja date,
    autor int,
    foreign key (autor) references autor(id)
);

create table pjesma(
    id int not null primary key auto_increment,
    naslov varchar(50) not null,
    autor int,
    album int,
    foreign key (autor) references autor(id),
    foreign key (album) references album(id)
);

create table mjesto(
    id int not null primary key auto_increment,
    naziv varchar(50) not null
);

create table koncert(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    datum date,
    mjesto int,
    autor int,
    foreign key (mjesto) references mjesto(id),
    foreign key (autor) references autor(id)
);

create table vijest(
    id int not null primary key auto_increment,
    naslov varchar(50) not null
);

create table galerija(
    id int not null primary key auto_increment,
    naziv varchar(50) not null,
    datum date,
    koncert int,
    vijest int,
    foreign key (koncert) references koncert(id),
    foreign key (vijest) references vijest(id)
);

create table slika(
    id int not null primary key auto_increment,
    naziv varchar(50),
    galerija int,
    file_path text,
    foreign key (galerija) references galerija(id)
);

create table video_klip(
    id int not null primary key auto_increment,
    naziv varchar(50),
    file_path text,
    galerija int,
    foreign key (galerija) references galerija(id)
);

create table korisnik(
    id int not null primary key auto_increment,
    ime varchar(50) not null,
    email varchar(50),
    password varchar(50) not null
);

create table komentar(
    id int not null primary key auto_increment,
    komentar text,
    korisnik int,
    foreign key (korisnik) references korisnik(id)
);

create table ocjena(
    id int not null primary key auto_increment,
    ocjena int,
    korisnik int,
    foreign key (korisnik) references korisnik(id)
);

