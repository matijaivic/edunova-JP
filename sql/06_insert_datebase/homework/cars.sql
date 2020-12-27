drop database if exists factory;
create database factory;

use factory;

create table car(
	sifra int not null primary key auto_increment,
	marka 			varchar(50),
	model 			varchar(50),
	godina 			int,
	broj_vrata 		char(2)
);

insert into car (marka, model, godina, broj_vrata)
values ("Renault", "Clio", 2015, 5),
		("BMW", "Seria 3", 2010, "3"),
		("Opel", "Zafira", 1998, "7"),
		("Volvo", "S90", 2012, "5"),
		("Wolkswagen", "Golf", 2010, "5");

select * from car;

update car set model = "Seria 5" where sifra = 2;
update car set godina = RAND()*(2020-1990)+1990 where sifra = 3;

delete from car where sifra = 5;

