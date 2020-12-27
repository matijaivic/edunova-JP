drop database if exists vjezba1;
create database vjezba1 CHARACTER SET utf8;

use vjezba1;

create table osoba(
	id			int primary key not null auto_increment,
	ime			varchar(50) not null,
	prezime		varchar(50) not null,
	drzava		varchar(50) not null,
	zaposlen	int null
);

insert into osoba(ime, prezime, drzava, zaposlen)
	values 	("Ana", "Tipuric", "Hrvatska", false),
			("Mario", "Vekic", "Slovenija", false),
			("Vesna", "Nikšic", "BiH", true),
			("Nika", "Veric", "Hrvatska", true),
			("Ivan", "Maric", "Njema?ka", true);
		

	
