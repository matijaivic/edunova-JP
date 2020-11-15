# 9. Urar Silvija 
#    Urar popravlja satove. Jedan korisnik može uraru donijeti više satova na popravak
#    dok jedan sat može biti više puta na popravku. Urar ima šegrta koji sudjeluje u
#    određenim popravcima satova.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\urar_sivija.sql
drop database if exists urar_sivija;
create database urar_sivija;

use urar_sivija;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50),
    oib varchar(50)
);

create table postolar(
    sifra int not null primary key auto_increment,
    osoba int not null,
    broj_mobitela int,
    oib varchar(50)
);

create table segrt(
    sifra int not null primary key auto_increment,
    osoba int not null,
    broj_ugovoar varchar(50)
);

create table obuca(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    boja varchar(50) not null,
    vlasnik int not null
);

create table popravak(
    sifra int not null primary key auto_increment,
    postolar int not null,
    segrt int,
    cijena decimal(18,2)
);

create table popravak_obuca(
    sifra int not null primary key auto_increment,
    popravak int not null,
    obuca int not null
);

alter table postolar add foreign key (osoba) references osoba(sifra);
alter table segrt add foreign key (osoba) references osoba(sifra);

alter table obuca add foreign key (vlasnik) references osoba(sifra);

alter table popravak add foreign key (postolar) references postolar(sifra);
alter table popravak add foreign key (segrt) references segrt(sifra);

alter table popravak_obuca add foreign key (popravak) references popravak(sifra);
alter table popravak_obuca add foreign key (obuca) references obuca(sifra);
