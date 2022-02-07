--------cddb.sql----------

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
