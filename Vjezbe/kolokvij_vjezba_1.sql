# sql DDL & DML VJEZBA
# VJEZBA 1
# TRAJANJE: 55min

# 0. Kreirajte tablice i veze između tablica.  
drop database if exists kolokvij_vjezba_1;
create database kolokvij_vjezba_1 character set utf8mb4;

use kolokvij_vjezba_1;

create table sestra (
	sifra 			int not null primary key auto_increment,
	introvertno 	bit,
	haljina 		varchar(31) not null,
	maraka 			decimal(16,6),
	hlace 			varchar(46) not null,
	narukvica 		int not null
);

create table zena (
	sifra 			int not null primary key auto_increment,
	treciput 		datetime,
	hlace 			varchar(46),
	kratkamajica 	varchar(31) not null,
	jmbag 			char(11) not null,
	bojaociju 		varchar(39) not null,
	haljina 		varchar(44),
	sestra 			int not null
);

create table muskarac (
	sifra 			int not null primary key auto_increment,
	bojaociju 		varchar(50) not null,
	hlace 			varchar (30), 
	modelnaocala 	varchar(43),
	maraka 			decimal(14,5) not null,
	zena 			int not null
);

create table mladic (
	sifra 			int not null primary key auto_increment,
	suknja 			varchar(50) not null,
	kuna 			decimal(18,2) not null,
	drugiput 		datetime,
	asocijalno 		bit,
	ekstroventno 	bit not null,
	dukserica 		varchar(48) not null,
	muskarac 		int not null
);

create table sestra_svekar(
	sifra 			int not null primary key auto_increment,
	sestra 			int not null,
	svekar 			int not null
);

create table svekar(
	sifra 			int not null primary key auto_increment,
	bojaociju 		varchar(40) not null,
	prstena 		int,
	dukserica 		varchar(41),
	lipa 			decimal(13,8),
	euro 			decimal(12,7),
	majica 			varchar(35)
);

create table punac (
	sifra 			int not null primary key auto_increment,
	ogrlica 		int,
	gustoca			decimal (14,9),
	hlace 			varchar(41) not null
);

create table cura (
	sifra 			int not null primary key auto_increment,
	novcica			decimal(16,5) not null,
	gustoca			decimal(16,6) not null,
	lipa			decimal(13,10),
	ogrlica			int not null,
	bojakose 		varchar(38),
	suknja			varchar(36),
	punac			int
);

alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);

alter table zena add foreign key (sestra) references sestra(sifra);
alter table muskarac add foreign key (zena) references zena(sifra);
alter table mladic add foreign key (muskarac) references muskarac(sifra);

alter table cura add foreign key (punac) references punac(sifra);

# 1. U tablice muskarac, zena i sestra_svekar unesite po 3 retka.

insert into sestra (haljina, hlace, narukvica) values
		('bablje', 'hlace1', 10),
        ('bablje', 'hlace2', 20),
        ('bablje', 'hlace3', 30);
    
insert into zena (kratkamajica, jmbag, bojaociju, sestra, hlace) values
		('kratkamajica1', '11111111111', 'bojaociju1', 1, 'ana'),
		('kratkamajica2', '22222222222', 'bojaociju2', 2, 'milovana'),
		('kratkamajica3', '33333333333', 'bojaociju3', 3, 'helena');

insert into muskarac (bojaociju, maraka, zena) values
		('bojaociju1', 100, 1),
		('bojaociju2', 200, 2),
		('bojaociju3', 300, 3);

insert into svekar (bojaociju) values
		('bojaociju1'),
		('bojaociju2'),
		('bojaociju3');
			
insert into sestra_svekar (sestra, svekar) values
		(1, 2),
		(2, 3),
		(3, 1);
		
insert into punac (hlace) values 
		('hlace1'),
		('hlace2'),
		('hlace3');

insert into cura (novcica, gustoca, ogrlica, punac) values
		(11.2, 12.5, 2, 1),
		(18.6, 18.5, 4, 2),
		(15.8, 14.5, 6, 3);	


# 2. U tablici cura postavite svim zapisima kolonu gustoca na vrijednost 15,77.
update cura set gustoca = 10.25 where sifra=1;
update cura set gustoca = 9.33 where sifra=2;
update cura set gustoca = 55.55 where sifra=3;
	
# 3. U tablici mladic obrišite sve zapise čija je vrijednost kolone kuna veće od 15,78.
insert into mladic (suknja, kuna, ekstroventno, dukserica, muskarac) values
		('suknja1', 23.22, 0, 'dukserica1', 1),
		('suknja2', 10.12, 1, 'dukserica3', 2),
		('suknja3', 15.75, 0, 'dukserica2', 3);	   

#delete from mladic where kuna > 15.78;

describe mladic ;
select * from mladic;

# 4. Izlistajte kratkamajica iz tablice zena uz uvjet da vrijednost kolone hlace sadrže slova ana.
select kratkamajica from zena where hlace like '%ana%';

# 5. Prikažite dukserica iz tablice svekar, asocijalno iz tablice mladic te hlace iz tablice muskarac 
#    uz uvjet da su vrijednosti kolone hlace iz tablice zena počinju slovom a te da su vrijednosti 
#    kolone haljina iz tablice sestra sadrže niz znakova ba. 
#    Podatke posložite po hlace iz tablice muskarac silazno.
#dukserica, asocijalno, hlace

select g.dukserica, a.asocijalno, b.hlace 
from mladic a
inner join muskarac b on a.muskarac = b.sifra
inner join zena c on b.zena = c.sifra 
inner join sestra d on c.sestra = d.sifra
inner join sestra_svekar e on d.sifra = e.sestra
inner join svekar g on e.svekar = g.sifra
where c.hlace like 'a%' and d.haljina like '%ba%' order by hlace desc;


# 6. Prikažite kolone haljina i maraka iz tablice sestra čiji se primarni ključ ne nalazi u tablici sestra_svekar.
select * from sestra a
where a.sifra not in (select sestra from sestra_svekar);
insert into sestra (haljina, maraka, hlace, narukvica) values
('halja1', 150.55, 'hlac1', 5);


select sestra from sestra_svekar;











