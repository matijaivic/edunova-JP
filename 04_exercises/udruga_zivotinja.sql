# 3. Udruga za zaštitu životinja 
#    U udruzu radi više osoba. Jedna osoba se brine za jednog ili više štićenika udruge.
#    Štićenici udruge su životinje. Svaki štićenik se nalazi u jednom prostoru.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\udruga_zivotinja.sql
drop database if exists udruga_zivotinja;
create database udruga_zivotinja;

use udruga_zivotinja;

create table udruga(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    broj_mobitela int not null,
    osoba int not null
);

create table osoba(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50),
    email varchar(50) not null
);

create table sticenik(
    sifra int not null primary key auto_increment,
    osoba int not null,
    prostor int not null
);

create table prostor(
    sifra int not null primary key auto_increment,
    temperatura decimal(18,2),
    zivotinja varchar(50) not null
);

create table zivotinja(
    sifra int not null primary key auto_increment,
    ime varchar(50),
    osoba varchar(50),
    sticenik int not null
);

create table sticenstvo (
    sifra_sticenik int,
    sifra_osoba int
);

alter table sticenstvo add foreign key (sifra_osoba) references sticenik(sifra);
alter table sticenstvo add foreign key (sifra_sticenik) references osoba(sifra);

alter table udruga add foreign key (osoba) references osoba(sifra);

alter table sticenik add foreign key (prostor) references prostor(sifra);

alter table zivotinja add foreign key (sticenik) references sticenik(sifra);






