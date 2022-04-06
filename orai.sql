 use zoldzrt
Database changed
MariaDB [zoldzrt]> select count(*)
    -> from szemelyek
    -> where telepules="Szolnok"
    -> ;
+----------+
| count(*) |
+----------+
|       34 |
+----------+
1 row in set (0.069 sec)

MariaDB [zoldzrt]> update szemelyek
    -> set
    -> fizetes=1500000
    -> where
    -> telepules="Szolnok"
    -> ;

select telepules, fizetes
from szemelyek
where telepules="Szolnok";


MariaDB [zoldzrt]> update szemelyek
    -> set
    -> fizetes="1800000"
    -> where
    -> telepules="Nagykőrös"
    -> and
    -> fizetes<100000;


select
  telepules, fizetes
from
  szemelyek
where
  telepules="Nagykőrös";


Milyen településekről vannak dolgozók?
select nev, telepules
from szemelyek
where fizetes < 20000
group by telepules
order by telepules
;


update szemelyek
set 
  fizetes = fizetes + 500000
  where fizetes < 20000;





Listázzuk ki településenként a dolgozók fizetését.

select telepules, sum(fizetes)
from szemelyek
where 
  fizetes < 30000
  and
  telepules like "P%"
group by telepules
order by telepules
;


select telepules
from szemelyek
where
  fizetes < 30000
order by telepules
limit 10;





Jeléenítsük meg annak aszegedi dolgozónak a nevét és fizetését,akinek a legtöbb a szegediek közül.
select nev, fizetes
from szemelyek
where
  telepules="Szeged"
order by fizetes desc
limit 1;






Melyik miskolci dolgozónak van a legtöbb jutalma?
Név jelenjen meg, jutalommal.

select nev, jutalom
from szemelyek
where
  telepules="Miskolc"
order by jutalom
;


update szemelyek
set
  jutalom = jutalom + 120000
where
  az=5298;


select nev, jutalom
from szemelyek
where
  telepules="Miskolc"
order by jutalom desc
limit 1
;


desc szemelyek;
show tables;


select * from beosztasok;


insert into szemelyek
(nev, telepules, fizetes, beosztasAz)
values
("Tenger Zoltán", "Szeged", 2830000, 5);


select telepules, sum(fizetes)
from szemelyek
where
  fizetes>800000
group by telepules 
;





(Az előzőből kiindulva)
Csak azoknak a településekbnek jelenjen meg a fizetése, ahol az kevesebb mint 20 millió.

select telepules, sum(fizetes)
from szemelyek
where
  fizetes>800000
group by telepules 
having
  sum(fizetes)< 20000000
;








2022-03-02

___Adatbázis definíció_____

Database Definition Language
DDL

create
drop 
alter
rename

___Tábla átnevezése___

create table szemely(nev varchar(20));

rename table szemely to szemelyek;

xampp
apt install mariadb-server
systemctl status mariadb


create database bibi;
use bibi
create table szemely(nev varchar(20));
rename table szemely to szemelyek;
alter table szemelyek add az int first;
alter table szemelyek modify az int not null primary key auto_increment;

-----Hozzáadás mező varos
alter table szemelyek add varos varchar(20);

-----Fizetes mező
alter table szemelyek add fizetes double;

-----Cím mező beszúrása a varos után
alter table szemelyek add cim varchar(20) after varos;

--varos mezű, telepules 
alter table szemelyek change column varos telepules varchar(20);



_____Index______

create database
create table
create index
create view


sezmelyek(az, nev, telepules, cim, fizetes)
1, Mar Pál, Zalaegerszeg, Tél u. 3, 2830000
2, Hó Tibor, Szolnok, Tél u, 3, 2230000
3, Fehér Ödön, Miskolc, Kar u. 5, 2250000
4, Lógi Katalin, Aszód, Rét u. 25, 2150000

              Index:
                Aszód
                Miskolc
                Szolnok
                Zalaegerszeg
                






===============================
2022-03-16


____IS NULL____

select * from dolgozok
where telepules is not null;

ahol a település ismert csak azt
szeretném megjeleníteni.

scp fer.sql janos@172.16.16.x:



Jelenítsen meg minden dolgozót akiknek a
fizetése nagyobb mint 2 millió 

select nev, telepules, fizetes
from dolgozok
where
  fizetes > 2000000
  and telepules != "Szolnok";
;


Jelenítse mag azokat a dolgozókat, akinek se
fizetése, se települése nincs beállítva.

insert into dolgozok
(az, nev)
values
(10, "Pontos Ádám")
(11, "Rejtő Béla")
(12, "Almás Péter")

select *
from dolgozok
where
  fizetes is not null
  and telepules is null;

use fer
vegyen fel új oszlopot 
a dolgozók táblába.
telefon varchar(20);

vegye fel az 1-s dolgozónak a
következő telefonszámot:
83 824-3432

update dolgozok
set
  telefon="83 824-3432"
where
  az=2;

select nev, telefon
from dolgozok;



83 824-34323

select nev, replace('gépház', 'ház', 'ész' );


select nev, replace(telefon, ' ', ') ') telefon
from dolgozok;

select substring(
   'gépház', 4);

select nev, concat(  "(", telefon)
from dolgozok;


------
select nev,

   replace(  concat(  "(", telefon), ' ', )   )

from dolgozok;
------

            
            
     
           
           (Linuxba zoldZrt.sql importálás)



apt update
apt install ssh mariadb-server

scp zoldZrt.sql janos@172.16.16.xy


___SSH kapcsolat___

|PC|			|server0|
p_privát 		p_nyilvános
p_nyilvános		s_privát	
s_nyilvános		s_nyilvános


létrehozunk
kulcspár

ls /home/janos (megállapítottuk hogy a zoldzrt itt van)

mariadb < /home/janos/zoldZrt.sql 

mariadb
use zoldZrt;
show tables;
desc Szemelyek;


Vegyük azoknak a dolgozóknak az adatait,akiknek a fizetése nagyobb mint 790 ezer.

select telepules, sum(fizetes)
from Szemelyek
where fizetes>790000
group by telepules;

Jelenítsük meg településenként a fizetések összegét.
Az eredményben csak azok a települések szerepeljenek,
ahol az összeg nagyobb mint 1 millió.

select telepules, sum(fizetes)
from Szemelyek
where fizetes>790000
group by telepules
having sum(fizetes) > 1000000
;

(a kapott eredményt a havinggel szűröm tovább)


insert into Szemelyek
(nev, telepules, fizetes, beosztasAz)
values
(" Pali Richard ", " Szeged ", 2300000, 2);

select nev, telepules 
from Szemelyek
where telepules="Szeged"
;


select trim(nev), trim(telepules) 
from Szemelyek
where trim(telepules)="Szeged"
;

A trim() 
leveszi a szóköz9ket és tabulátorokat a szöveg elejéről és vegéről.
    








_____Dolgozat jövőhéten_____

db: okta
create database okta
character set utf8
collate utf8_hungarian_ci;

create table kurzusok(
  kurzus_az int not null primary key auto_increment,
  kurzus_nev varchar(50),
  attekintes varchar(200)
);

describe kurzusok;
desc kurzusok;
show create table kurzusok;


create table kurzusok(
  kurzus_az int not null primary key auto_increment,
  kurzus_nev varchar(50),
  attekintes varchar(200)
  primary key(kurzus_az)
);

insert into kurzusok
(kurzus_nev)
values
("Linux rendszergazda");

select * from kurzusok;

insert into kurzusok
(attekintes)
values
("Boldog rendszergazdák képzése");


desc kurzusok;


update kurzusok
set
  kurzus_nev="Bolodog képzés"
where
  kurzus_az = 2;

alter table kurzusok
modify kurzus_nev varchar(50) not null;

insert into kurzusok
(kurzus_nev, attekintes)
values
("Windows rendszergazda",
"Windows rendszergazdák képzése");


fizetos (igen vagy nem)

alter table kurzusok
add fizetos boolean;


update kurzusok
set
  fizetos=1
where
  kurzus_az = 2;

create index indexnév
  on táblanév (mezőnév, ...)


create index fizetos_index
on kurzusok (fizetos);

Ezek lesznek jővőhéten


______ER-modell______

Adatbázis tervezéshez használják.

Rendelő
  orvos
  páciensek
  vizsgálat

Entity Relationship => ER
Egyed Kapcsolat => EK
