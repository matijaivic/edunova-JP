#  17. Obiteljsko poljoprivredno gospodarstvo 
#      Vodoinstalater popravlja kvarove na vodovodnim instalacijama. Tijekom jednog
#      popravka može popraviti više kvarova a jedan kvar se može popravljati više puta.
#      Na određenim popravcima mu pomaže njegov šegrt.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\vodoinstalater.sql
drop database if exists vodoinstalater;
create database vodoinstalater;

use vodoinstalater;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50),
    oib varchar(50) not null
);

create table vodoinstalater(
    sifra int not null primary key auto_increment,
    broj_mobitela int,
    osoba int,

    foreign key (osoba) references osoba(sifra)
);

create table segrt(
    sifra int not null primary key auto_increment,
    broj_ugovora varchar(50),
    osoba int not null,

    foreign key (osoba) references osoba(sifra)
);

create table popravak(
    sifra int not null primary key auto_increment,
    cijena int not null,
    vodoinstalater int not null,
    segrt int not null,

    foreign key (vodoinstalater) references vodoinstalater(sifra),
    foreign key (segrt) references segrt(sifra)
);

create table kvar(
    sifra int not null primary key auto_increment,
    naziv_kvara varchar(50) not null,
    opis varchar(50) not null
);

create table popravak_kvar(
    sifra int not null primary key,
    popravak int not null,
    kvar int not null,
    pomoc_segrta boolean,
    
    foreign key (popravak) references popravak(sifra),
    foreign key (kvar) references kvar(sifra)
);

