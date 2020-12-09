

DROP database IF EXISTS order_store;
CREATE database order_store CHARACTER SET utf8;

USE order_store;

create table products (
	product_id 			int not null primary key auto_increment, 
	product_name 		varchar(100) not null, # naziv proizvoda
	manufactorer		varchar(200) not null, # proizvođač
	category_name		varchar(30) null, #kategorija proizvoda
	description			varchar(3000) null
	#product_image		image null
);

create table sales (
	sales_id		int not null primary key auto_increment,
	total_price		decimal(18,2) not null,
	sales_type 		boolean, # pravna (osoba) ili privatno prodaja
	quantity 		int, CHECK (quantity > 0) # količina

);

CREATE TABLE users (
	user_id 	 	int not null primary key auto_increment, 
	user_name	 	varchar(100) not null, # ime kupca, ime firme..
	user_type	 	varchar(25) not null, # može biti kupac, prodavatelj, dobavljač, zaposlenik..  
	address		 	varchar(200) not null, # navodi se što je potrebno pod adresu
	phone_number 	varchar(15),	
	sales_fk		int not null,
	
	foreign key (sales_fk) references sales(sales_id)
);

create table orders ( 
	order_id 			int not null primary key auto_increment,
	order_date			datetime not null, # datum narudžbe
	bought_quantity		int not null, CHECK (bought_quantity > 0), # cijena
	product_fk 			int not null,
	buyer_fk			int not null,
	
	foreign key (buyer_fk) references users(user_id),
	foreign key (product_fk) references products(product_id)
);
