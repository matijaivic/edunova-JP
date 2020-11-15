#  18. Odvjetnik 
#      Jedan odvjetnik brani više klijenata. Jednog klijenta može braniti više puta.
#      U obranama mu pomažu suradnici. Na jednoj obrani može biti više suradnika
#      a jedan suradnik može sudjelovati na više obrana.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\odvjetnik.sql
drop database if exists odvjetnik;
create database odvjetnik;

use odvjetnik;

create table osoba(
    sifra int primary key not null auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11)
);

create table odvjetnik(
    sifra int primary key not null auto_increment,
    cijena int,
    osoba int not null,

    foreign key (osoba) references osoba(sifra)
);

create table klijent(
    sifra int primary key not null auto_increment,
    osoba int not null,

    foreign key (osoba) references osoba(sifra)
);

create table klijent_slucaj(
    sifra int primary key not null auto_increment,
    naslov varchar(50) not null,
    adresa varchar(50) not null,
    opis varchar(255) not null,
    vrijeme_rasprave datetime not null,
    klijent int not null
);

create table obrana(
    sifra int primary key not null auto_increment,
    klijent_slucaj int not null,

    foreign key (klijent_slucaj) references klijent_slucaj(sifra)
);

create table suradnik(
    sifra int primary key not null auto_increment,
    osoba int not null,

    foreign key (osoba) references osoba(sifra)
);

create table odvjetnik_obrana(
    odvjetnik int not null,
    suradnik int not null,
    obrana int not null,

    foreign key (odvjetnik) references odvjetnik(sifra),
    foreign key (suradnik) references suradnik(sifra),
    foreign key (obrana) references obrana(sifra)
);
  