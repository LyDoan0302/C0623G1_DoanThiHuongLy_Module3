CREATE DATABASE sale_management;
USE sale_management;
CREATE TABLE customers(
customer_id int auto_increment primary key,
customer_name varchar(50),
customer_age datetime
);
CREATE TABLE orders(
order_id int auto_increment primary key,
customer_id int,
FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
order_date datetime,
order_total_price int
);
CREATE TABLE products(
product_id int auto_increment primary key,
product_name varchar(50),
product_price int
);
CREATE TABLE order_detail(
order_id int,
product_id int,
PRIMARY KEY(order_id,product_id),
FOREIGN KEY(order_id) REFERENCES orders(order_id),
FOREIGN KEY(product_id) REFERENCES products(product_id),
order_quantity int
);
