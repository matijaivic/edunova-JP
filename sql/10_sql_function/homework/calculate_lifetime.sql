# DZ
# Na današnji dan uz unosa vlastitog datuma rođenja upit ispisuje
# koliko ste stari godina, mjeseci, dana
drop database if exists edunovajp23;
create database edunovajp23 CHARACTER SET utf8; 

use edunovajp23;

# Method 1
CREATE TABLE  users (
	name			 varchar(10),
	dob			 datetime	
);

insert into users  (name, dob) values ('Matija',  '1989-10-05');

SELECT
TIMESTAMPDIFF( YEAR, dob, now() ) AS 'Year',
TIMESTAMPDIFF( MONTH, dob, now() ) % 12 AS 'Months',
TIMESTAMPDIFF( DAY, dob, now() ) % 30.4375  AS 'Days'
FROM users;

/*
# Method 2
SELECT 
timestampdiff(YEAR, date('1989-10-05'), now())  as 'Year',
timestampdiff(MONTH, date('1989-10-05'), now()) % 12  as 'Months',
timestampdiff(DAY, date('1989-10-05'), now()) % 30.4375  as 'Days' ;
*/

# Broj 30.4375 je izračunat iz formule: [DAYS IN YEAR]/12, gdje je [DAYS IN YEAR] = 365.25 = 30.4375