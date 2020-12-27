#  14. Trgovački centar 
#      U jednom trgovačkom centru postoji više trgovina. U svakoj trgovini radi više osoba.
#      Jedna osoba može raditi u više trgovina. Svaka trgovina ima jednog šefa koji je ujedno i osoba.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\trgovacki_centar.sql
drop database if exists trgovacki_centar;
create database trgovacki_centar;

use trgovacki_centar;

create table trgovina(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    broj_telefona int,
    sef int not null
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    broj_mobitela int not null
);

create table trgovina_osoba(
    sifra int,
    trgovina int not null,
    osoba int not null,

    foreign key (trgovina) references trgovina(sifra),
    foreign key (osoba) references osoba(sifra)
);
