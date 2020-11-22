drop database if exists vjezba2;
create database vjezba2 character set utf8;

use vjezba2;

create table osoba(
sifra 	int not null primary key auto_increment,
ime 	varchar(50) not null,
prezime varchar(50) not null
);

create table vozilo(
sifra 		int not null primary key auto_increment,
osoba 		int not null,
marka 		varchar(50)
);

alter table vozilo add foreign key (osoba) references osoba(sifra);

insert into osoba(ime, prezime)
	values	("Marko", "Bulic"),
			("Vedran", "Bulic");

insert into vozilo(osoba, marka)
	values	(2, "Renault"),
			(1, "Toyota"),
			(2, "BMW"),
			(1, "Audi");