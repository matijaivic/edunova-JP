DROP DATABASE IF EXISTS store;
CREATE DATABASE store;

USE store;

create table address (
id INT not null primary key auto_increment,
address1 VARCHAR(255) not null,
address2 VARCHAR(255) not null,
city VARCHAR(255) not null,
provinces VARCHAR(255) null,
state VARCHAR(255) not null default 'CROATIA',
postal_code VARCHAR(255) not null
);

create table customer (
id INT not null primary key auto_increment,
personal_id VARCHAR(255) null,
first_name VARCHAR(255) not null,
last_name VARCHAR(255) not null,
phone INT null,
credit_limit int not null,
billing_adress_fk int not null,
shipping_adress_fk int null,

foreign key (billing_adress_fk) references address (id),
foreign key (shipping_adress_fk) references address (id)
);

create table product ( 
id INT not null primary key auto_increment,
location_product VARCHAR(255) not null,
name VARCHAR(255) not null,
vendor varchar(255) null,
description TEXT null,
qty_in_stock INT not null default 0,
check (qty_in_stock > 0),
wholesale_price DECIMAL(18,2) not null,
retail_price DECIMAL(18,2) null,
msrp DECIMAL(18,2) null
);

create table invoice (
id INT not null primary key auto_increment,
due_date DATETIME not null default NOW(),
required_date DATETIME null,
shipped_date DATETIME not null,
delivery DATETIME not null,
vat_rate tinyint(4) null,
discount_amount tinyint(4) not null,
comments text null,
customer_fk int not null,
shipping_address_fk int null,

foreign key (customer_fk) references customer (id),
foreign key (shipping_address_fk) references address (id)
);

create table orders_products (
id INT not null primary key auto_increment,
quantity int not null default 1,
check (quantity > 0),
price_each decimal(18,2) null,
discount int null default 0,
invoice_fk int not null,
product_fk int not null,

foreign key (invoice_fk) references invoice (id),
foreign key (product_fk) references product (id)
);

create table payment ( 
id INT not null primary key auto_increment,
payment_date DATETIME not null default NOW(),
total_price DECIMAL(18,2) not null default 0.0,
invoice_fk int not null,

foreign key (invoice_fk) references invoice (id)
);

