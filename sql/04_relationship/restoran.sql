#  14. Restoran 
#      Restoran ima više kategorija na jelovniku. Jedna kategorija ima više jela.
#      Uz svako jelo može se ponuditi više pića. Jedno piće se može ponuditi uz više jela.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\restoran.sql
drop database if exists restoran;
create database restoran;

use restoran;

create table jelovnik(
    sifra int not null primary key auto_increment,
    kategorija int not null,
    pice int not null
);

create table kategorija(
    sifra int not null primary key auto_increment,
    naziv int not null,
    jelo int not null
);

create table jelo(
    sifra int not null primary key auto_increment,
    cijena decimal(18, 2)
);

create table pice(
    sifra int not null primary key auto_increment,
    cijena decimal(18, 2)
);

alter table jelovnik add foreign key (kategorija) references kategorija(sifra);
alter table jelovnik add foreign key (pice) references pice(sifra);

alter table kategorija add foreign key (jelo) references jelo(sifra);