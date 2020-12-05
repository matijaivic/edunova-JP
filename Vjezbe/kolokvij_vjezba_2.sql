# sql DDL & DML VJEZBA
# VJEZBA 2
# TRAJANJE: 50min

drop database if exists kolokvij_vjezba_2;
create database kolokvij_vjezba_2 character set utf8mb4;

use kolokvij_vjezba_2;

#0. Kreirajte tablice (16) i veze između tablica. (6)

create table decko (
	sifra 			int not null primary key auto_increment,
	indiferentno 	bit,
	vesta			varchar(34),
	asocijalno		bit  not null
);

create table zarucnica(
	sifra 			int not null primary key auto_increment,
	narukvica		int,
	bojakose 		varchar(37) not null,
	novcica			decimal(15,9),
	lipa 			decimal(15,8) not null,
	indiferentno 	bit not null
);

create table cura (
	sifra 			int not null primary key auto_increment,
	haljina			varchar(33) not null,
	drugiputa		datetime not null,
	suknja			varchar(38),
	narukvica 		int,
	introvertno 	bit,
	majica 		varchar(40) not null,
	decko 			int 	
);

create table brat (
	sifra 			int not null primary key auto_increment,
	suknja			varchar(47),
	ogrlica			int not null,
	asocijalno		int not null,
	neprijatelj		int not null
);

create table decko_zarucnica (
	sifra 			int not null primary key auto_increment,
	decko 			int not null,
	zarucnica		int not null
);

create table neprijatelj (
	sifra 			int not null primary key auto_increment,
	majica 			varchar(32),
	haljina			varchar(43) not null,
	lipa			decimal(16,8),
	modelnaocala	varchar(49)	not null,
	kuna			decimal(12,6) not null,
	jmbag			char(11),
	cura 			int
);

create table prijatelj(
	sifra 			int not null primary key auto_increment,
	modelnaocala 	varchar(37),
	treciputa		datetime not null,
	ekstrovetno		bit not null,
	prviputa		datetime,
	svekar			int not null
);

create table svekar (
	sifra 			int not null primary key auto_increment,
	stilfrizura		varchar(48),
	ogrlica			int not null,
	asocijalno 		bit not null
);

alter table decko_zarucnica add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);

alter table cura add foreign key (decko) references decko(sifra);
alter table neprijatelj add foreign key (cura) references cura(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj (sifra);

alter table prijatelj add foreign key (svekar) references svekar(sifra);


# 1. U tablice neprijatelj, cura i decko_zarucnica unesite po 3 retka.
insert into decko (asocijalno, vesta) values
		(1, 'banana'),
		(0, 'barometar'),
		(1, 'pas');

insert into cura (haljina, suknja, drugiputa, majica, decko) values
		('haljina1', 'suknja1', '2016-08-15', 'majica1', 1),
		('haljina2', 'suknja2', '2013-10-25', 'majica2', 2),
		('haljina3', 'suknja2', '2019-08-10', 'majica3', 3);

insert into neprijatelj (haljina, modelnaocala, kuna, cura) values
		('haljina1', 'modelnaocala1', 50.2, 1),
		('haljina2', 'modelnaocala2', 50.2, 2),
		('haljina3', 'modelnaocala3', 50.2, 3);

insert into zarucnica (bojakose, novcica, lipa, indiferentno) values
('bojakose1', 20.88, 10.2, 1),
('bojakose2', 15.20, 20.4, 1),
('bojakose3', 63.23, 15.7, 0);

insert into decko_zarucnica (decko, zarucnica) values
		(1, 2),
		(2, 3),
		(3, 1);

	
# 2. U tablici prijatelj postavite svim zapisima kolonu treciputa na vrijednost 30. travnja 2020.
insert into svekar (ogrlica, asocijalno) values
(10, 1),
(20, 1),
(30, 1);
	
insert into prijatelj (treciputa, ekstrovetno, svekar) values
		('2020-12-03', 1, 1),
		('2019-12-03', 1, 2),
		('2018-12-03', 1, 3);

update prijatelj set treciputa = '2020-04-30';


# 3. U tablici brat obrišite sve zapise čija je vrijednost kolone ogrlica različito od 14.
insert into brat (ogrlica, asocijalno, neprijatelj) values
		(10, 1, 1), 
		(14, 1, 2),
		(15, 0, 3);

select * from brat where ogrlica <> 14;

# 4. Izlistajte suknja iz tablice cura uz uvjet da vrijednost kolone drugiputa nepoznate.
select suknja from cura where drugiputa is null;

# 5. Prikažite novcica iz tablice zarucnica, neprijatelj iz tablice brat te haljina iz tablice 
#    neprijatelj uz uvjet da su vrijednosti kolone drugiputa iz tablice cura poznate te da su
#    vrijednosti kolone vesta iz tablice decko sadrže niz znakova ba.
#    Podatke posložite po haljina iz tablice neprijatelj silazno.	


select a.novcica, e.haljina, g.neprijatelj
from zarucnica a
inner join decko_zarucnica b on a.sifra = b.zarucnica 
inner join decko c on b.decko = c.sifra
inner join cura d on c.sifra = d.decko
inner join neprijatelj e on d.sifra = e.cura
inner join brat g on e.sifra = g.neprijatelj
where d.drugiputa is not null and c.vesta like '%ba%';


# Prikažite kolone vesta i asocijalno iz tablice decko čiji se primarni ključ ne nalaze u tablici decko_zarucnica.
select * from decko d 
where d.sifra not in (select decko from decko_zarucnica);

insert into decko (vesta, asocijalno) values
('vesta1', 1),
('vesta2', 1),
('novavesta1', 1);

