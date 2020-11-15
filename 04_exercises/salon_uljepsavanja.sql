# 2. Salon za uljepšavanje 
#    U salonu za uljepšavanje radi više djelatnica.
#    Jedna djelatnica na dan radi s više korisnika.
#    Korisnik tijekom jednog posjeta koristi jednu uslugu.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\salon_uljepsavanja.sql
drop database if exists salon_uljepsavanja;
create database salon_uljepsavanja;

use salon_uljepsavanja;

create table djelatnica(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    iban varchar(50)
);

create table korisnik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar (50) not null
);

create table posjet(
    djelatnica int not null,
    korisnik int not null,
    usluga int not null
);

create table usluga(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    cijena decimal(10,2) not null
);

alter table posjet add foreign key (djelatnica) references djelatnica(sifra);
alter table posjet add foreign key (korisnik) references korisnik(sifra);
alter table posjet add foreign key (usluga) references usluga(sifra);


