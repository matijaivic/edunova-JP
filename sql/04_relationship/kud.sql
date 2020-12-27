# 20. Kulturno umjetničko društvo
#     KUD nastupa u zemlji i inozemstvu. Na jedan nastup ide više članova KUD-a dok
#     jedan član može nastupati na više nastupa. Svaki nastup se odvija u jednom mjestu.

# c:\xampp\mysql\bin\mysql -uedunova -pedunova < d:\JP23\bases\kud.sql
drop database if exists kud;
create database kud;

use kud;

create table clan(
    sifra       int not null primary key auto_increment,
    ime         varchar(50) not null,
    prezime     varchar(50) not null,
    email       varchar(50) not null,
    oib         char(11) not null
);

create table nastup(
    sifra       int not null primary key auto_increment,
    zarada      decimal(18,2),
    mjesto      varchar(50) not null,
    trosak      int
);

create table nastup_clan(
    sifra       int not null primary key auto_increment,
    nastup      int not null,
    clan        int not null,

    foreign key (nastup) references nastup(sifra),
    foreign key (clan) references clan(sifra)
);

