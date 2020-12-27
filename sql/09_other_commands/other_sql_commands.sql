use somebase;

select * from employees;

# odaberite sve proizvode koje je prodao martin
select e.productName
from employees a inner join customers b on a.employeeNumber = b.salesRepEmployeeNumber 
inner join orders c on b.customerNumber = c.customerNumber
inner join orderdetails d on c.orderNumber = d.orderNumber
inner join products e on d.productCode = e.productCode
where a.firstName = 'Martin';

# Odaberite sve podređene zaposlenike od Patterson Mary
select firstName, lastName from employees 
where reportsTo IN 
(select employeeNumber from employees where firstName = 'Mary' and lastName = 'Patterson');

# odaberite sve proizvode koji nisu niti na jednoj narudžbi
select distinct productCode from orderdetails;
select count(*) from products;

select * from products where productCode not in 
(select distinct productCode from orderdetails);


# Obrišite 1985 Toyota Supra
DELETE FROM products WHERE productCode='S18_3233';

# obrisati sve proizvode koji nisu niti na jednoj narudžbi
delete from products where productLine not in 
(select distinct productCode from orderdetails);


# Na koji datum narudžbe je prodan najskuplji (priceEach) proizvod?
select od.priceEach, o.orderDate
from orderdetails od
inner join orders o on o.orderNumber = od.orderNumber
where od.priceEach = (select max(od2.priceEach) from orderdetails od2);



