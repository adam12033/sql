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











------------miskolci.sql----------------

--2022-02-09
--ZoldZrt adatbazis

--Kérdezzükle a miskolci dolgozók
--neveit, fizetésüket
--fizetés szerint csökkenő sorrendben.
select nev, fizetes 
from szemelyek
where telepules='Miskolc'
order by fizetes asc;

--Milyen településről vannak dolgozók
--akiknek a fizetése
--több mint 400000.

select telepules
from szemelyek
where fizetes > 700000
group by telepules
;













2022-02-16
Gyakorlás a gyakorlati dolgozatra.

importálja be az adatbázis

xampp-start
localhost/phpmyadmin-bongeszobe

cditthon

1.Importáljon valamilyen adatbázist
2.Kérdezzen le adatokat
  Szúrjon be új adatot
  Javítson adatot
  
1. Kéredezze le a polgári,váci és a paksi dolgozók neveit, fizetésüket, jutalmukat.  
Egyetlen lekérdezésben.

select nev as Név, fizetes as Fizetés, jutalom as Jutalom
from szemelyek 
where 
telepules="Polgár"
or telepules="Vác"
or telepules="Paks";


2. Számoltassa meg a polgári, váci és paksi dolgozóknak mennyi egyben az átlagfizetésük.

select avg(fizetés)
from szemelyek
where
telepules="Polgár"
or telepules="Vác"
or telepules="Paks";


3. Számoltassa meg a polgári, váci és paksi dolgozóknak mennyi az átlagfizetésük településenként.

select avg(fizetés)
from szemelyek
where
telepules="Polgár"
or telepules="Vác"
or telepules="Paks";
group by telepules;

4. szúrjon be egy új dolgozót.

insert into szemelyek        (insert or update lehet)
(nev, telepules)
values
('Nagy Pál', 'Szolnok')


Összegezni  sum()
Megszámolni count()

Pontozás:
	importálta (képernyőkép)
	szimpla  lekérős müködés
	függvényes működés
	csoprortosítós
	.sql fájlba tette
	Megjegyzésben neve, osztáy, dátum
	zoldzrt_DA_.sql










-----------------------------------------------






Adatbbázis létrehozása

pata

create database pata;

use pata
kategoriak=(az, szin, marka, ar, kategoriaId)
kategoriak=(az, nev)

create table kerekparok(
  az int not null primary key auto_increment,
  szin varchar(50),
  marka varchar(50),
  ar double,
  kategoriaId int
);

create table kategoriak (
  az int not null primary key auto_increment,
  nev varchar(50)
);


insert into kategoriak
(nev)
values
('városi'),
('országúti'),
('gyerek'),
('elektromos'),
('trekking');

insert into kerekparok
(szin, marka, ar, kategoriaId)
values
('fehér', 'Csepel', 178900, 5),
('szürke', 'Neuzer', 172900, 5),
('fehér', 'KTM', 256850, 5);


_____Táblák összekapcsolása____


select szin, marka, ar, nev
from kerekparok inner join kategoriak


Mik a kapcsoló mezők????



select szin, marka, ar, nev
from kerekparok inner join kategoriak
on kerekparok.kategoriaid = kategoriak.az
;




insert into kerekparok
(szin, marka, ar, kategoriaId)
values
('fehér', 'Gepida', 439900, 5);


select szin, marka, ar, nev
from kerekparok inner join kategoriak
on kerekparok.kategoriaid = kategoriak.az
;


update kerekparok
set ar=560900
where az=4



Esemény: vásárlás
táblázat

vasarlasok=(az, kerekparAZ, ugyfelAz, datum)
ugyfelek=(az, nev)


winscp

apt install smbclient

smbclient -u diak //172.16.16.16.246/diak
cd I(n)fra
cd SajatDir
put pata.sql










-------------------------------------------------------
Linuxon:
apt update
apt install mariadb-server
mysql
mysql < /home/janos/zoldZrt.sql
mentés: mysqldump zoldzrt > /home/janos/zoldZrtMentes.sql

winSCP.exe

SCP segítségével feltöltés olyan gépre, ahol van SSH szerver
SSH szerver

insert into szemelyek
(nev, fizetes, telepules, jutalom, lakcim, beosztasAz)
values
("Lakos Kázmér", 2830000, "Miskolc", 800000, "Pata u. 18.", 2);

select * from Szemelyek where az = 13112 \G


insert into beosztasok
    -> (nev, leiras)
    -> values
    -> ("titkár", "");

update szemelyek
set
  nev="Gipsz Jakab",
  anyja_neve="Purhab Mária",
  telepules="Bugyi",
  lakcim="Cég utca 12.",
  fizetes=2121000,
  szuletes="1996-03-12",
  jutalom=500,
  beosztasAz=6
where
  az=13112;

Szemelye(az, nev, anyja_neve, telepules, lakcim, fizetes, szuletes, jutalom, beosztasAz)
Beosztasok(az, nev, leiras)

create table Beosztasok(
  az int not null primary key auto_increment,
  nev varchar(50)),
  leiras text
  );




___Két táblás gyakorlat__
Jelenítsük meg a móri dolgozók nevét és beosztását.

select szemelyek.nev, beosztasok.nev 
from
  szemelyek inner join Beosztasok
  on szemelyek.beosztasAz = Beosztasok.az

where
  telepules="Mór"
;





___unique___(unique egyedivé teszi a mezőt)

create database kontjarmu
character set utf8
collate utf8_hungarian_ci;

use kontjarmu

create table jarmuvek (
  az int not null primary key auto_increment,
  rendszam varchar(10) unique,
  marka varchar(50)
);

insert into jarmuvek
(az, rendszam, marka)
values
(1, "ABC-123", "Opel");

