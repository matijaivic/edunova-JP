# 4. Dječji vrtić 
#    U dječjem vrtiću postoji više odgojnih skupina. Svaka odgojna skupina ima više  
#    djece i vodi ih jedna odgajateljica. Odgajateljica ima jednu stručnu spremu.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\djeci_vrtic.sql
drop database if exists djeci_vrtic;
create database djeci_vrtic;

use djeci_vrtic;

create table vrtic(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    broj_skupine int,
    broj_mobitela int,
    odgojna_skupina int not null
);

create table odgojna_skupina(
    sifra int not null primary key auto_increment,
    odgajateljica int not null
);

create table odgajateljica(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50),
    oib char(11),
    strucna_sprema varchar(50) not null
);

create table dijete(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50),
    odgojna_skupina int not null
);

alter table dijete add foreign key (odgojna_skupina) references odgojna_skupina(sifra);

alter table odgojna_skupina add foreign key (odgajateljica) references odgajateljica(sifra);
alter table vrtic add foreign key (odgojna_skupina) references odgojna_skupina(sifra);
