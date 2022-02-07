---------------kekbt.sql----------------

--database.sql
--Nev
--2022-02-02

--Adatbázis létrehozása
create database if not exists kekbt
character set utf8
collate utf8_hungarian_ci;

use kekbt;

-- Tábla létrehozása
create table if not exists ugyfelek(
	az int not null primary key auto_increment,
	nev varchar(50),
	telepules varchar(50),
	vasarlas int
);

--Sorok beszúrása
insert into ugyfelek
(nev, telepules, vasarlas)
values
("Pontos Béla", "Szolnok", 2),
("Sebes Irén", "Szeged", 1),
("Nyolcas Imre", "Szolnok", 2),
("Lenti Ferenc", "Miskolc", 1),
("Fenti Katalin", "Hatvan", 1);








---------------cddb.sql------------------

-- nev
-- datum
-- osztaly

create database if not exists cdotthon
character set utf8
collate utf8_hungarian_ci;

use cdotthon;

create table if not exists  cd (
	az int not null
	  primary key
	  auto_increment,
	cim varchar(50),
	kiadoAz int
);

create table if not exists  eloado (
	az int not null
	  primary key
	  auto_increment,
	nev varchar(50)
);

create table if not exists  zeneszam(
	az int not null
	  primary key
	  auto_increment,
	nev varchar(50),
	hossz time,
	cdAz int,
	eloadoAz int  
);

create table if not exists kiado(
	az int not null
	  primary key
	  auto_increment,
	nev varchar(50)
); 









---------------devecser.sql---------------
