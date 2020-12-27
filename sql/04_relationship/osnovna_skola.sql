# 12. Osnovna škola 
#     U osnovnoj školi postoje dječje radionice. Na jednoj radionici sudjeluje više djece.
#     Jedno dijete može sudjelovati na više radionica. Radionicu vodi jedna učiteljica.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\osnovna_skola.sql
drop database if exists osnovna_skola;
create database osnovna_skola;

use osnovna_skola;

create table uciteljica(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    broj_indeksa int not null
);

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    broj_roditelja int
);

create table radionica(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    uciteljica int not null,
    datum_pocetka datetime,
    foreign key (uciteljica) references uciteljica(sifra)
);

create table radionica_dijete(
    sifra int not null primary key auto_increment,
    radionica int not null,
    dijete int not null,
    foreign key (radionica) references radionica(sifra),
    foreign key (dijete) references dijete(sifra)
);
