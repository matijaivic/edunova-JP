drop database if exists vjezba3;
create database vjezba3 character set utf8;

use vjezba3;

create table prog_jezik (
	sifra int not null primary key auto_increment,
	name varchar(50) not null
);

create table kategorija (
	sifra int not null primary key auto_increment,
	name varchar(50) not null
);

create table prog_jezik_kategorija (
	prog_jezik int not null, 
	kategorija int not null
);

alter table prog_jezik_kategorija add foreign key (prog_jezik) references prog_jezik(sifra);
alter table prog_jezik_kategorija add foreign key (kategorija) references kategorija(sifra);

insert into prog_jezik(name)
values	("Java"),
		("Swift"),
		("PHP"),
		("Go");

insert into kategorija(name)
values	("oop"),
		("osx"),
		("linux"),
		("win");

insert into prog_jezik_kategorija(prog_jezik, kategorija)
values	(1, 1),
		(1, 4),
		(1, 2),
				
		(2, 2),
				
		(3, 1),
		(3, 3),
		(3, 4),
				
		(4, 3),
		(4, 2);
		
		