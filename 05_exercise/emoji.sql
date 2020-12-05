drop database if exists emoji_base;
create database emoji_base character set utf8mb4;

use emoji_base;

create table kutija(
	id			int primary key not null auto_increment
);

create table emotikon(
	id				int primary key not null auto_increment,
	kutija	int not null,
	boja		varchar(1)
);

alter table emotikon
	add foreign key (kutija) references kutija(id);

insert into kutija
	values(null);

insert into emotikon(kutija, boja) values
		(1, "📕"),
		(1, "📘"),
		(1, "📗");
