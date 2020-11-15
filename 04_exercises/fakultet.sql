# 11. Fakultet 
#     Studenti polažu kolegije kroz rokove. Student može rok prijaviti  
#     više puta a na jedan rok može izaći više studenata.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\fakultet.sql
drop database if exists fakultet;
create database fakultet;

use fakultet;

create table student(
    sifra int not null primary key auto_increment,
    ime varchar(50) not null,
    prezime varchar(50) not null,
    oib char(11),
    broj_indeksa int not null
);

create table kolegiji(
    sifra int not null primary key auto_increment,
    naziv_kolegija varchar(50) not null,
    broj_ects_bodova int
);

create table rok(
    sifra int not null primary key auto_increment,
    kolegiji int not null,
    broj_indeksa int not null,
    datum_pocetka datetime,
    foreign key (kolegiji) references kolegiji(sifra),
    foreign key (broj_indeksa) references student(sifra)
);

create table student_rok(
    sifra int not null primary key auto_increment,
    student int not null,
    rok int not null,
    foreign key (student) references student(sifra),
    foreign key (rok) references student(sifra)
);
