# 8. Postolar 
#    Postolar popravlja obuću. Jedan korisnik može postolaru donijeti više
#    komada obuće na popravak dok jedan komad obuće može biti više puta na popravku.
#    Postolar ima šegrta koji sudjeluje u određenim popravcima obuće.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\postolar.sql
drop database if exists postolar;
create database postolar;

use postolar;

create table majstor(
    sifra int primary key not null auto_increment,
    ime varchar(50),
    prezime varchar(50) not null,
    broj_mobitela int not null,
    popravak int not null
);

create table segrt(
    sifra int primary key not null auto_increment,
    ime varchar(50) not null,
    prezime varchar(50),
    popravak int not null
);

create table popravak(
    sifra int primary key not null auto_increment,
    cijena decimal(18, 2) not null,
    vrijeme_popravka datetime not null,
    bilo_popravljano int not null,
    obuca int not null
);

create table popravak_obuca(
    sifra int primary key not null auto_increment,
    datum_popravka int not null,
    popravak int not null,
    obuca int not null
);

create table obuca(
    sifra int primary key not null auto_increment,
    korisnik int not null,
    vlasnik int not null
);

create table korisnik(
    sifra int primary key not null auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    broj_mobitela int not null
);

alter table majstor add foreign key (popravak) references popravak(sifra);
alter table segrt add foreign key (popravak) references popravak(sifra);

alter table popravak add foreign key (obuca) references obuca(sifra);
alter table popravak_obuca add foreign key (obuca) references obuca(sifra);
alter table popravak_obuca add foreign key (popravak) references popravak(sifra);

alter table obuca add foreign key (korisnik) references korisnik(sifra);


