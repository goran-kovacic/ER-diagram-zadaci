# c:\xampp\mysql\bin\mysql -uroot --default_character_set=utf8 < C:\Users\AMD\Documents\GitHub\ER-diagram-zadaci\kolokvij_vjezbe\vjezba01.sql

drop database if exists vjezba01;
create database vjezba01;
use vjezba01;

create table punac(
    sifra int not null primary key auto_increment,
    ogrlica int,
    gustoca decimal(14,9),
    hlace varchar(41) not null
);

create table cura(
    sifra int not null primary key auto_increment,
    novcica decimal(16,5) not null,
    gustoca decimal(18,6) not null,
    lipa decimal(13,10),
    ogrlica int not null,
    bojakose varchar(38),
    suknja varchar(36),
    punac int,
    foreign key (punac) references punac(sifra)
);

create table sestra(
    sifra int not null primary key auto_increment,
    introvertno bit,
    haljina varchar(31) not null,
    maraka decimal(16,6),
    hlace varchar(46) not null,
    narukvica int
);

create table svekar(
    sifra int not null primary key auto_increment,
    bojaociju varchar(40) not null,
    prstena int,
    dukserica varchar(41),
    lipa decimal(13,8),
    eura decimal(12,7),
    majica varchar(35)
);

create table  sestra_svekar(
    sifra int not null primary key auto_increment,
    sestra int not null,
    svekar int not null,
    foreign key (sestra) references sestra(sifra),
    foreign key (svekar) references svekar(sifra)
);

create table zena(
    sifra int not null primary key auto_increment,
    treciputa datetime,
    hlace varchar(46),
    kratkamajica varchar(31) not null,
    jmbag char(11) not null,
    bojaociju varchar(39) not null,
    haljina varchar (44),
    sestra int not null,
    foreign key (sestra) references sestra(sifra)
);

create table muskarac(
    sifra int not null primary key auto_increment,
    bojaociju varchar(50) not null,
    hlace varchar(30),
    modelnaocala varchar(43),
    maraka decimal(14,5) not null,
    zena int not null,
    foreign key (zena) references zena(sifra)
);

create table mladic(
    sifra int not null primary key auto_increment,
    suknja varchar(50) not null,
    kuna decimal(16,8) not null,
    drugiputa datetime,
    asocijalno bit,
    ekstrovertno bit not null,
    dukserica varchar(48) not null,
    muskarac int,
    foreign key (muskarac) references muskarac(sifra)
);

insert into sestra (introvertno,haljina,maraka,hlace,narukvica) values 
(1,'haljina1',31.5,'hlace1',15),
(1,'haljina2',500.2,'hlace2',8),
(1,'haljin3',431.2,'hlace3',123);

insert into zena (treciputa,hlace,kratkamajica,jmbag,bojaociju,haljina,sestra) values
('2020-12-12','hlace1','majica1','12345678901','plava','haljina1',1),
('2020-12-12','hlace2','majica2','12345678901','plava','haljina2',2),
('2020-12-12','hlace3','majica3','12345678901','plava','haljina3',3);

insert into muskarac (bojaociju,hlace,modelnaocala,maraka,zena) values
('plava','hlace1','naocale1',123.4,1),
('plava','hlace2','naocale2',123.4,2),
('plava','hlace3','naocale3',123.4,3);

insert into svekar (bojaociju,prstena,dukserica,lipa,eura,majica) values
('plava',1,'duksa1',12.3,15.5,'majica1'),
('plava',1,'duksa2',12.3,15.5,'majica2'),
('plava',1,'duksa3',12.3,15.5,'majica3');

insert into  sestra_svekar (sestra,svekar) values
(1,1),
(1,2),
(1,3);

insert into cura (novcica,gustoca,lipa,ogrlica,bojakose,suknja) values 
(15.5,18.123,123.123,5,'boja1','suknja1'),
(15.5,18.123,123.123,5,'boja2','suknja2'),
(15.5,18.123,123.123,5,'boja3','suknja3');

update cura set gustoca = 15.77;

delete from mladic where kuna > 15.78;

select kratkamajica from zena where hlace like '%ana%';

select a.dukserica, f.asocijalno, e.hlace
from svekar a
inner join sestra_svekar b      on a.sifra=b.svekar
inner join sestra c             on b.sestra=c.sifra
inner join zena d               on c.sifra=d.sestra
inner join muskarac e           on d.sifra=e.zena
inner join mladic f             on e.sifra=f.muskarac
where d.hlace like 'a%' and c.haljina like '%ba%'
group by e.hlace desc;

select a.haljina, a.maraka
from sestra a 
left join sestra_svekar b on a.sifra=b.sestra 
where a.sifra not in (select sestra from sestra_svekar);