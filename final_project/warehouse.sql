drop database if  exists order_store;
create database order_store character set utf8mb4;

use order_store;

# nvarchar, char, text 

create table employees (
    employee_id int not null primary key auto_increment,
    first_name varchar(20) null,
    last_name varchar(20) null,
    job_title varchar(20) null,
    address varchar(30) null,
    city varchar(30) null,
    country  varchar(30) null,
    zip_code  varchar(32) null,
    phone int null,
    report_to int not null,
    
    foreign key (report_to) references employees (employee_id)
);

create table customers (
     customer_id int not null primary key auto_increment,
     company_name  varchar(50) null,
     contact_name  varchar(30) null,
     contact_title varchar(30) null,
     address varchar(30) null,
     city varchar(30) null,
     country  varchar(30) null,
     zip_code  varchar(32) null,
     phone int null   
);

create table suppliers (
     supplier_id int not null primary key auto_increment,
     company_name varchar(50) null,
     contact_name varchar(30) null,
     contact_title varchar(30) null,
     address varchar(30) null,
     city varchar(30) null,
     country varchar(30) null,
     zip_code varchar(32) null,
     phone int null,
     webpage text null
);

create table categories (
     category_id int not null primary key auto_increment,
     category_name varchar(15) null,
     description text null
     #picture image,
);

create table orders (
     order_id int not null primary key auto_increment,
     order_date datetime not null,
     required_date datetime null,
     shipped_date datetime not null,
     ship_name varchar(50) not null,
     ship_address varchar(50) not null,
     ship_city varchar(30) not null,
     ship_country varchar(30) not null,
     ship_zip_code varchar(15)not  null,     
     supplier_name varchar(50) not null,
     supplier_phone varchar(50) null,
     customer_fk int,
     employee_fk int,
     
     foreign key (customer_fk) references customers (customer_id),
     foreign key (employee_fk) references employees (employee_id)
);

create table products (
     product_id int not null primary key auto_increment,
     product_name varchar(50) null,
     quantity_per_unit varchar(10) not null,
     unite_price int not  null,
     unite_in_stock smallint null,
     unite_on_order smallint null,
     supplier_fk int,
     category_fk int,
     
     foreign key (supplier_fk) references suppliers (supplier_id),
     foreign key (category_fk) references categories (category_id)
);

create table orders_details (
     order_detail_id int not null primary key auto_increment,
     unite_price int not null,
     quantity smallint not null,
     discount real null,
     order_fk int,
     product_fk int,
     
     foreign key (order_fk) references orders (order_id),
     foreign key (product_fk) references products (product_id)
);


