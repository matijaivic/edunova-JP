-- This is a test data for database order_store

USE order_store;

insert into address (address1, city, state, postal_code) values 
('Gutstrasse 31', 'Zürich', 'Switzerland', '8000'); 

insert into customer (first_name, last_name, phone, credit_limit, billing_adress_fk, shipping_adress_fk) 
values ('Matija', 'Ivić', '+41 610-773-7458', 5000, 1, 1 ); 

insert into invoice ( due_date, shipped_date, delivery_date, vat_rate, customer_fk, shipping_address_fk) 
values ( '2021-02-15', '2020-12-17', '2021-01-11', 25, 1, 1);

insert into product (product_location, product_name, qty_in_stock, wholesale_price)
values ('S10-R', 'SAMSUNG Galaxy Note 10 Lite', 20, 2999.99);

insert into order_product (quantity, price_each, invoice_fk, product_fk) values
(1, 3399.99, 1, 1);

insert into payment ( total_price, invoice_fk) values 
(3399.99, 1);