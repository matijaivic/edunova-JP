drop database if exists bend;
create database bend;

use bend;

create table grupa (
	sifra 			int not null primary key auto_increment,
	naziv 			varchar(50) not null,
	godina_osnutka 	varchar(50) not null,
	godina_raspada  varchar(50), 
	tema_pjesme		varchar(50),
	opis_grupe		varchar(200),
	web_stranica	varchar(50),
	zemlja_porijekla 	int,
	lokacija			int,
	status				int,
	zarn				int
);

create table status (
	sifra 	int not null primary key auto_increment,
	naziv 	varchar(50) not null
);
create table zarn (
	sifra 	int not null primary key auto_increment,
	naziv 	varchar(50) not null
);

create table grad (
	sifra 	int not null primary key auto_increment,
	naziv 	varchar(50) not null,
	drzava 	int 
);

alter table grupa add foreign key (lokacija) references grad(sifra);
alter table grupa add foreign key (status) references status(sifra);
alter table grupa add foreign key (zarn) references zarn(sifra);

create table drzava (
	sifra 	int not null primary key auto_increment,
	naziv 	varchar(50) not null
);

alter table grupa add foreign key (zemlja_porijekla ) references drzava(sifra);
alter table grad add foreign key (drzava) references drzava(sifra);

create table izdavacka_kuca (
	sifra 	int not null primary key auto_increment,
	naziv 	varchar(50) not null,
	sjediste int
);

alter table izdavacka_kuca add foreign key (sjediste) references grad(sifra);

create table grupa_izdavacka_kuca(
	grupa int,
	izdavacka_kuca int, 
	datum_potpisivanja int,
	primary key (grupa, izdavacka_kuca, datum_potpisivanja),
	datum_raskida 		datetime
);

alter table grupa_izdavacka_kuca add foreign key (grupa) references grupa(sifra);
alter table grupa_izdavacka_kuca add foreign key (izdavacka_kuca) references izdavacka_kuca(sifra);

create table izvodjac (
	sifra 			int not null primary key auto_increment,
	ime 			varchar(50),
	prezime 		varchar(50),
	nadimak 		varchar(50) not null,
	datum_rodjena 	varchar(50),
	datum_smrti 	varchar(50),
	grad_rodjena 	int,
	spol 			int
);

create table spol (
	sifra 	int not null primary key auto_increment,
	naziv 	varchar(50) not null
);

alter table izvodjac add foreign key (grad_rodjena) references grad(sifra);
alter table izvodjac add foreign key (spol) references spol(sifra);

create table grupa_izvodjaci (
	grupa 				int,
	izvodjac 			int,
	datum_ucljanjenja 	int,
	primary key (grupa, izvodjac, datum_ucljanjenja),
	datum_izlaska 		varchar(50)
);

alter table grupa_izvodjaci add foreign key (grupa) references grupa(sifra);
alter table grupa_izvodjaci add foreign key (izvodjac) references izvodjac(sifra);


create table korisnik (
	sifra 			int not null primary key auto_increment,
	ime 			varchar(50),
	prezime 		varchar(50),
	korisnicko_ime	varchar(50) not null,
	lozinka 		varchar(50) not null,
	email 			varchar(50) not null,
	datum_rodjena 	varchar(50),
	tekst 			varchar(250),
	spol 					int,
	grad_rodjena 			int,
	trenutno_boraviste  	int
);

alter table korisnik add foreign key (spol) references spol(sifra);
alter table korisnik add foreign key (grad_rodjena) references grad(sifra);
alter table korisnik add foreign key (trenutno_boraviste) references grad(sifra);

create table album (
	sifra 			int not null primary key auto_increment,
	naslov 			varchar(50) not null,
	prezime 		varchar(50),
	datum_rodjena 	varchar(50),
	tekst 			varchar(250),
	grupa 			int,
	vrsta_albuma 	int,
	zarn 			int,
	izdavacka_kuca  int
);

create table vrsta_albuma (
	sifra 		int not null primary key auto_increment,
	naziv 		varchar(50) not null,
	skracenica 	varchar(50) not null
);

alter table album add foreign key (grupa) references grupa(sifra);
alter table album add foreign key (zarn) references zarn(sifra);
alter table album add foreign key (izdavacka_kuca) references izdavacka_kuca(sifra);
alter table album add foreign key (vrsta_albuma) references vrsta_albuma(sifra);

create table korisnik_slusa_zarnove (
	korisnik 		int,
	zarn 			int,
	primary key (korisnik, zarn),
	ocjena 	int
);

create table ocjena (
	sifra 	int not null primary key auto_increment,
	naziv 	varchar(50) not null,
	opis 	varchar(300) not null
);

alter table korisnik_slusa_zarnove add foreign key (korisnik) references korisnik(sifra);
alter table korisnik_slusa_zarnove add foreign key (zarn) references zarn(sifra);
alter table korisnik_slusa_zarnove add foreign key (ocjena) references ocjena(sifra);

create table korisnik_grupa (
	korisnik 		int,
	grupa 			int,
	primary key (korisnik, grupa),
	ocjena 			int
);

alter table korisnik_grupa add foreign key (korisnik) references korisnik(sifra);
alter table korisnik_grupa add foreign key (grupa) references grupa(sifra);
alter table korisnik_grupa add foreign key (ocjena) references ocjena(sifra);

create table album_izvodjaci (
	izvodjac 		int,
	album 			int,
	instrument 		int,
	primary key (izvodjac, album, instrument),
	datum_izlaska 	varchar(50)
);

create table instrument (
	sifra 	int not null primary key auto_increment,
	naziv 	varchar(50) not null
);

alter table album_izvodjaci add foreign key (izvodjac) references izvodjac(sifra);
alter table album_izvodjaci add foreign key (album) references album(sifra);
alter table album_izvodjaci add foreign key (instrument) references instrument(sifra);

create table korisnik_je_izvodjac (
	korisnik 		int,
	izvodjac 		int,
	primary key (korisnik, izvodjac)
);

alter table korisnik_je_izvodjac add foreign key (korisnik) references korisnik(sifra);
alter table korisnik_je_izvodjac add foreign key (izvodjac) references izvodjac(sifra);

create table korisnik_zeli_album (
	korisnik 		int,
	album 			int,
	primary key (korisnik, album),
	ocjena 			int
);

alter table korisnik_zeli_album add foreign key (korisnik) references korisnik(sifra);
alter table korisnik_zeli_album add foreign key (album) references album(sifra);
alter table korisnik_zeli_album add foreign key (ocjena) references ocjena(sifra);

create table korisnik_ima_album (
	korisnik 		int,
	album 			int,
	primary key (korisnik, album),
	datum_nabave 	varchar(50),
	stanje_albuma 	varchar(50),
	ocjena      	int
);

alter table korisnik_ima_album add foreign key (korisnik) references korisnik(sifra);
alter table korisnik_ima_album add foreign key (album) references album(sifra);
alter table korisnik_ima_album add foreign key (ocjena) references ocjena(sifra);

create table pjesme (
	sifra 			int not null primary key auto_increment,
	naziv 			varchar(50) not null,
	trajanje 		int not null,
	rijeci  		varchar(50),
	album 			int
);

alter table pjesme add foreign key (album) references album(sifra);

create table najdraze_pjesme (
	korisnik 		int,
	pjesme 			int,
	primary key (korisnik, pjesme),
	komentar 		varchar(50)
);

alter table najdraze_pjesme add foreign key (korisnik) references korisnik(sifra);
alter table najdraze_pjesme add foreign key (pjesme) references pjesme(sifra);
