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
