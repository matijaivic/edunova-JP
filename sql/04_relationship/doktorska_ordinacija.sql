# 10. Doktorska ordinacija 
#     Doktor liječi pacijente. Jednog pacijenta može liječiti više puta.
#     U liječenju pacijenta doktoru pomažu medicinske sestre.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\doktorska_ordinacija.sql
drop database if exists doktorska_ordinacija;
create database doktorska_ordinacija;

use doktorska_ordinacija;

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11) not null
);

create table doktor(
    sifra int not null primary key auto_increment,
    osoba int not null,
    broj_telefona int
);

create table medicinska_sestra(
    sifra int not null primary key auto_increment,
    osoba int not null,
    broj_ugovora int
);

create table lijecenje(
    sifra int not null primary key auto_increment,
    doktor int not null,
    trajanje boolean
);

create table lijecenje_sestra(
    sifra int not null primary key auto_increment,
    lijecenje int not null,
    medicinska_sestra int not null
);

create table lijecenje_pacijent(
    sifra int not null primary key auto_increment,
    lijecenje int not null,
    pacijent int not null
);

alter table doktor add foreign key (osoba) references osoba(sifra);
alter table medicinska_sestra add foreign key (osoba) references osoba(sifra);
alter table lijecenje add foreign key (doktor) references doktor(sifra);

alter table lijecenje_sestra add foreign key (lijecenje) references lijecenje(sifra);
alter table lijecenje_sestra add foreign key (medicinska_sestra) references medicinska_sestra(sifra);

alter table lijecenje_pacijent add foreign key (lijecenje) references lijecenje(sifra);
alter table lijecenje_pacijent add foreign key (pacijent) references osoba(sifra);
