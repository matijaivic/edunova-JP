# 5. Muzej 
#    U muzeju postoji više izložaba. Jedna izložba ima više djela.
#    Svaki kustos je zadužen za jednu izložbu. Svaka izložba ima jednog sponzora.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\muzej.sql
drop database if exists muzej;
create database muzej;

use muzej;

create table muzej(
    sifra int not null primary key auto_increment,
    naziv varchar(50),
    broj_telefona int
);

create table izlozba(
    sifra int not null primary key auto_increment,
    datum_pocetka datetime,
    kustos int not null,
    sponzor i nt not null,
    muzej int not null
);

create table djelo(
    sifra int not null primary key auto_increment,
    autor int not null,
    izlozba int not null
);

create table autor(
    sifra int not null primary key auto_increment,
    osoba int not null
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    email varchar(50) not null
);

create table kustos(
    sifra int not null primary key auto_increment,
    osoba int not null
);

create table sponzor(
    sifra int not null primary key auto_increment,
    iban char(11),
    osoba int not null
);

alter table izlozba add foreign key (muzej) references muzej(sifra);
alter table izlozba add foreign key (kustos) references kustos(sifra);
alter table izlozba add foreign key (sponzor) references sponzor(sifra);

alter table djelo add foreign key (autor) references autor(sifra);
alter table djelo add foreign key (izlozba) references izlozba(sifra);

alter table sponzor add foreign key (osoba) references osoba(sifra);
alter table kustos add foreign key (osoba) references osoba(sifra);
alter table autor add foreign key (osoba) references osoba(sifra);
