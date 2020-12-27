# 13. Srednja škola 
#     Jedna srednja škola ima više razreda. Jedan razred pohađa više učenika.
#     U jednom razredu predaje više profesora. Jedan profesor može predavati u više razreda.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\srednja_skola.sql
drop database if exists srednja_skola;
create database srednja_skola;

use srednja_skola;

create table profesor(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11)
);

create table ucenik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11)
);

create table razred(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    profesor int not null,
    ucenik int not null,

    foreign key (ucenik) references ucenik(sifra),
    foreign key (profesor) references profesor(sifra)
);

create table razred_ucenik(
    sifra int not null primary key auto_increment,
    razred int not null,
    ucenik int not null,

    foreign key (razred) references razred(sifra),
    foreign key (ucenik) references ucenik(sifra)
);