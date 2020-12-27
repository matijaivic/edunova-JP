# 6. Samostan 
#    U samostanu se nalaze svećenici. Svaki svećenik je zadužen za više poslova.
#    Jedan posao u isto vrijeme može obavljati više svećenika.
#    Svaki svećenik ima samo jednog nadređenog svećenika. 

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\samostan.sql
drop database if exists samostan;
create database samostan;

use samostan;

create table samostan(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    broj_telefona int,
    svecenik int not null
);

create table svecenik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    nadredjeni_svecenik int not null
);

create table nadredjeni_svecenik(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11)
);

create table posao(
    sifra int not null primary key auto_increment,
    naziv varchar(50) not null,
    vrijeme datetime not null
);

create table svecenik_posao(
    sifra int not null primary key auto_increment,
    svecenik int not null,
    posao int not null
);

alter table svecenik_posao add foreign key (svecenik) references svecenik(sifra);
alter table svecenik_posao add foreign key (posao) references posao(sifra);

alter table svecenik add foreign key (nadredjeni_svecenik) references nadredjeni_svecenik(sifra);
alter table samostan add foreign key (svecenik) references svecenik(sifra);







