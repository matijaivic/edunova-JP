# VJEZBANJE INNER I LEFT JOIN NA DVIJE I TRI TABLICE

# Baza knjiznica

# odaberite sve naslove knjiga koje su napisali autori rođeni 1980 godine

select a.sifra, a.naslov
from katalog a inner join autor b on a.autor =b.sifra 
where b.datumrodenja between '1980-01-01' and '1980-12-31';

# odaberite sve naslove koji su izdani od strane aktivnih izdavača

select a.naslov 
from katalog a
inner join izdavac b on a.izdavac = b.sifra
where b.aktivan = true;

# odaberite imena i prezimena autora koji su pisali knjige na ljubavnu tematiku

select a.ime, a.prezime
from autor a
inner join katalog b on b.autor = a.sifra
where naslov like '%ljubav%';



# Baza world

# odaberite imena gradova u Europi
#select * from country c where Region like '%Europe%' order by Region desc ;

select b.name
from country a
inner join city b on a.Code = b.CountryCode
where a.Continent = 'Europe';

select Continent from country c ;
select * from country;


# odaberite nazive zemalja u kojima se priča španjolski jezik

describe countrylanguage ;
#select * from countrylanguage c where `Language` like '%Spanish%';

select c.Name 
from country c
inner join countrylanguage cl on cl.CountryCode = c.Code
where cl.`Language` = 'Spanish';



