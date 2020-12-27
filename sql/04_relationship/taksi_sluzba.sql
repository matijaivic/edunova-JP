# 7. Taksi služba 
#    Taksi tvrtka ima više vozila. Jedno vozilo vozi jedan vozač.
#    U jednoj vožnji vozač može prevesti više putnika.
#    Jedan putnik se naravno može tijekom vremena imati više vožnji.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\taksi_sluzba.sql
drop database if exists taksi_sluzba;
create database taksi_sluzba;

use taksi_sluzba;

create table vozilo(
	reg_tablica int primary key not null,
	maksimalni_broj_putnika int not null,
	vozac int
);

create table vozac(
	sifra int primary key not null auto_increment,
	ime varchar(50) not null,
	prezime varchar(50) not null,
	taksi_dozvola char(8) not null
);

create table voznja(
	sifra int primary key not null auto_increment,
	vozilo int not null
);

create table putnik(
	sifra int primary key not null auto_increment,
	ime varchar(50) not null,
	broj_telefona int not null
);

create table voznja_putnik(
	sifra int primary key not null auto_increment,
	putnik int not null,
	voznja int not null
);

alter table vozilo add foreign key (vozac) references vozac(sifra);

alter table voznja add foreign key (vozilo) references vozilo(reg_tablica);

alter table voznja_putnik add foreign key (putnik) references putnik(sifra);
alter table voznja_putnik add foreign key (voznja) references voznja(sifra);


