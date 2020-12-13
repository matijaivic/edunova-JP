# This is my database for e-commerce

DROP DATABASE IF EXISTS order_store;
CREATE DATABASE order_store CHARACTER SET utf8;

USE order_store;

CREATE TABLE products (
	product_id 			INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	product_sku			INT NOT NULL,
	product_name 		VARCHAR(100) NOT NULL, 
	manufactorer		VARCHAR(75) NOT NULL, 
	category_name		VARCHAR(30) NULL,
	product_price		DECIMAL(18,2) NOT NULL,
	quantity_in_stock	INT NOT NULL DEFAULT 0, CHECK (quantity_in_stock > 0),
	description			TEXT NULL
	#product_image		image NULL
);

CREATE TABLE customers (
	customer_id 	 	INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	create_date 		DATETIME NOT null DEFAULT NOW(),
	national_id_number	VARCHAR(30) NULL,  
    first_name 			VARCHAR(50) NULL,
    last_name 			VARCHAR(50) NULL,
    address 			VARCHAR(50) NOT NULL,
    city 				VARCHAR(30) NOT NULL,
    country  			VARCHAR(30) NOT NULL DEFAULT 'CROATIA',
    zip_code  			VARCHAR(30) NOT NULL,
    phone 				INT NULL
);

create table orders ( 
	order_id 			INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	create_date 		DATETIME NOT null DEFAULT NOW(),
	order_date			DATETIME NOT NULL, 
	bought_quantity		INT NOT NULL, CHECK (bought_quantity > 0), 
	total_price			DECIMAL(18,2) NOT NULL DEFAULT 0.0,
	customer_fk 		INT NOT NULL,
	
	foreign key (customer_fk) references customers(customer_id)
);

CREATE TABLE customer_products (
	sales_id		INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	create_date 	DATETIME NOT null DEFAULT NOW(),
	sales_type 		BOOLEAN NOT NULL,
	quantity 		SMALLINT NOT NULL DEFAULT 1,
    discount 		REAL NULL DEFAULT 0,
	price			DECIMAL(18,2) NOT NULL,
	vat_rate		TINYINT(4) NULL,
	product_fk		INT NOT NULL,
	order_fk		INT NOT NULL,
    	
	foreign key (product_fk) references products(product_id),
	foreign key (order_fk) references orders(order_id)
);

   
