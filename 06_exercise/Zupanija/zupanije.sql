drop database if exists županije;
create database županije character set utf8;  

use županije;

create table županija (
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	župan int not null
);

create table župan (
	sifra 	int not null primary key auto_increment,
	ime	  	varchar(50) not null,
	prezime varchar(50) not null 
);

create table općina (
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	županija int not null
);

create table mjesto (
	sifra int not null primary key auto_increment,
	naziv varchar(50) not null,
	općina int not null 
);


alter table županija add foreign key (župan) references župan(sifra);
alter table općina add foreign key (županija) references županija(sifra);
alter table mjesto add foreign key (općina) references općina(sifra);

select * from župan;
insert into župan(ime,prezime) values
("ime1", "prezime1"),
("ime2", "prezime2"),
("ime3", "prezime3");

select * from županija;
insert into županija(naziv,župan) values
("županija1", 1),
("županija2", 3),
("županija3", 2);

describe općina;
select * from općina;
insert into općina(županija,naziv) values
(1, "općina1"),
(2, "općina2"),
(3, "općina3"),
(1, "općina4"),
(2, "općina5"),
(3, "općina6");

select * from mjesto;
insert into mjesto(općina,naziv) values
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

delete from mjesto where općina=1; 
delete from općina where sifra=1;
delete from mjesto where općina=2;
delete from općina where sifra=2;



