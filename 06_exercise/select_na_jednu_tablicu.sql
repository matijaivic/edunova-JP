# VJEZBANJE SELECT NA JEDNU TABLICU

# baza knjiznica
# 1. odaberite sve autore koji nemaju definiran datum rođenja

describe autor;
select * from autor where datumrodenja is null;

# 2. autora s prezimenom preišić ispraviti u Perišić

select * from autor where prezime = 'preišić';
update autor set prezime = 'Perišić' where sifra = 3;
select * from autor where sifra = 3;

update autor set datumrodenja = '1990-10-15' where sifra=3;


# 3. kreirati tablic grad (id, naziv). U tablicu autor dodati kolonu grad koja je vanjski ključ na grad(id)

create table grad(
	id int not null primary key auto_increment,
	naziv varchar(50)
);

alter table autor add foreign key (grad) references grad(id);
insert into grad (naziv) values ('Osijek');

alter table katalog add foreign key (autor) references autor(sifra);
update grad set id=0 where id = 1;

select * from grad;
select * from autor;

​
# 4. Koliko je izdavača društvo s ograničenom odgovornošću?
select * from izdavac where naziv like '%d%o%o%';


# 5. odaberite sva mjesta koja u svom nazivu imaju slovo Z
select * from mjesto where naziv like '%z%';


# Unesite sebe kao autora i unesite kataložni zapis čiji ste Vi autor
#describe autor;

select * from autor where sifra = 45677;
select * from katalog where sifra = 50001;

insert into autor (sifra, ime, prezime, datumrodenja, grad) values (45677, 'Matija', 'Ivić', '1989-10-05', 0);
insert into katalog (sifra, naslov, autor, izdavac, mjesto) values (50001, 'Naslov', 15195, 1, 1);

select * from katalog where (naslov like '%ljubav%' or naslov like '%srce%' )
and sifra not in (2541,2680,3063);