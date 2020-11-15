# 21. Dječja igraonici
#     U dječjoj igraonici djeca se igraju u skupinama. Jedno dijete se može igrati u 
#     više skupina a jedna skupina se sastoji od više djece. Svaku skupinu vodi jedna teta.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\djecja_igraonica.sql
drop database if exists djecja_igraonica;
create database djecja_igraonica;

use djecja_igraonica;

create table odgajatelj(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    email varchar(50) not null,
    oib char(11) not null,
    strucna_sprema varchar(50) not null
);

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    broj_roditelja int not null
);

create table skupina(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    odgajatelj int not null,

    foreign key (odgajatelj) references odgajatelj(sifra)
);

create table skupina_dijete(
    sifra int not null primary key auto_increment,
    skupina int not null,
    dijete int not null,
    
    foreign key (skupina) references skupina(sifra),
    foreign key (dijete) references dijete(sifra)
);

