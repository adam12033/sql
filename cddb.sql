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

-- devecser.sql
-- 2022-02-07


-- A dolgozók nevei és fizetésük
-- devecserről

select nev, fizetes
from szemelyek 
where telepules="Devecser";

select nev as Név, fizetes as Fizetés
from szemelyek 
where telepules="Devecser";

-- Hány dolgozó van Devecserről

select count(*) as "Devecseri dolgozók"
from szemelyek
where telepules="Devecser";

-- A devecseri dolgozók fizetése osszesen

select sum(fizetes)
as "Devecseri fizetések összesen"
from szemelyek
where telepules="Devecser";

--Mennyi az átlagfizetése a dolgozóknak

select avg(fizetes)
as "Devecseri fizetések összesen"
from szemelyek
where telepules="Devecser";

--Van e miskolci dolgozó 

select telepules
from szemelyek
where telepules="Hatvan";

select telepules
from szemelyek
where telepules="Miskolc";

select telepules
from szemelyek
where telepules="Miskolc" or telepules="Hatvan";

-- A miskolci és hatvani dolgozó nevei és fiztésük,
-- akiknek a fizetése nagyobb mint 300 ezer.

select nev, fizetes, telepules
from szemelyek
where (telepules="Miskolc" or telepules="Hatvan")
and fizetes>300000;

-- A miskolci és hatvani dolgozók neveit
-- rendezve név szerint

select nev
from szemelyek
where telepules="Miskolc" or telepules="Hatvan"
order by nev;

select nev
from szemelyek
where telepules="Miskolc" or telepules="Hatvan"
order by nev asc;






