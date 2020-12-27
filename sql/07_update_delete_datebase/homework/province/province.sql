drop database if exists zupanije;
create database zupanije character set utf8;  

use zupanije;

create table zupanija (
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	zupan int not null
);

create table zupan (
	sifra 	int not null primary key auto_increment,
	ime	  	varchar(50) not null,
	prezime varchar(50) not null 
);

create table opcina (
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	zupanija int not null
);

create table mjesto (
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	opcina int not null 
);


alter table zupanija add foreign key (zupan) references zupan(sifra);
alter table opcina add foreign key (zupanija) references zupanija(sifra);
alter table mjesto add foreign key (opcina) references opcina(sifra);

select * from zupan;
insert into zupan(ime,prezime) values
("ime1", "prezime1"),
("ime2", "prezime2"),
("ime3", "prezime3");

select * from zupanija;
insert into zupanija(naziv,zupan) values
("zupanija1", 1),
("zupanija2", 3),
("zupanija3", 2);

describe opcina;
select * from opcina;
insert into opcina(zupanija,naziv) values
(1, "opcina1"),
(2, "opcina2"),
(3, "opcina3"),
(1, "opcina4"),
(2, "opcina5"),
(3, "opcina6");

select * from mjesto;
insert into mjesto(opcina,naziv) values
(1, "mjesto1"),
(2, "mjesto2"),
(3, "mjesto3"),
(2, "mjesto4"),
(1, "mjesto5"),
(1, "mjesto6"),
(2, "mjesto7"),
(3, "mjesto8"),
(2, "mjesto9"),
(1, "mjesto10"),
(2, "mjesto11"),
(3, "mjesto12");

update mjesto set naziv = "Osijek" where sifra=12;
update mjesto set naziv = "Zagreb" where sifra=6;
update mjesto set naziv = "Split" where sifra=3;
update mjesto set naziv = "Dubrovnik" where sifra=5;
update mjesto set naziv = "Vinkovci" where sifra=9;

delete from mjesto where opcina=1; 
delete from opcina where sifra=1;
delete from mjesto where opcina=2;
delete from opcina where sifra=2;



