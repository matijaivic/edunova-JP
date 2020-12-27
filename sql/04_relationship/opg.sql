#  16. Obiteljsko poljoprivredno gospodarstvo OPG proizvodi
#      proizvode od sirovina koje sami uzgoje.
#      Jedan proizvod se može sastojati od više sirovina. 
#      Jedna sirovina se može nalaziti u više proizvoda. 
#      Jedan djelatnik OPG-a je odgovoran za jedan ili više proizvoda.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\opg.sql
drop database if exists opg;
create database opg;

use opg;

create table proizvod(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    rok_trajanja datetime not null
);

create table djelatnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50),
    oib varchar(50) not null
);

create table sirovina(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    kolicina int not null
);

create table proizvod_sirovina(
    sifra int not null primary key auto_increment,
    proizvod int not null,
    sirovina int not null,

    foreign key (proizvod) references proizvod(sifra),
    foreign key (sirovina) references sirovina(sifra)
);

create table proizvod_djelatnik(
    sifra int not null primary key auto_increment,
    proizvod int not null,
    djelatnik int not null,

    foreign key (proizvod) references proizvod(sifra),
    foreign key (djelatnik) references djelatnik(sifra)
);
