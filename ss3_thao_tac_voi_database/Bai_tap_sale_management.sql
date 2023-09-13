CREATE DATABASE sale_management;
USE sale_management;
CREATE TABLE customers(
	customer_id   INT 		  AUTO_INCREMENT PRIMARY KEY,
	customer_name VARCHAR(50) NOT NULL,
	customer_age  TINYINT     DEFAULT 18 CHECK(customer_age >= 18)
);
CREATE TABLE orders(
	order_id          INT      AUTO_INCREMENT PRIMARY KEY,
	customer_id       INT      NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
	order_date        DATETIME NOT NULL,
	order_total_price INT
);
CREATE TABLE products(
	product_id    INT         AUTO_INCREMENT PRIMARY KEY,
	product_name  VARCHAR(50) NOT NULL,
	product_price FLOAT       DEFAULT 0 CHECK(product_price >= 0)
);
CREATE TABLE order_detail(
	order_id       INT NOT NULL,
	product_id     INT NOT NULL,
	PRIMARY KEY(order_id,product_id),
	FOREIGN KEY(order_id)   REFERENCES orders(order_id),
	FOREIGN KEY(product_id) REFERENCES products(product_id),
	order_quantity INT NOT NULL
);

INSERT INTO customers
VALUES (1,'Minh Quan',18),
       (2,'Ngoc Oanh', 20),
       (3,'Hong Ha',50);

INSERT INTO orders
VALUES (1,1,'2006/3/21',NULL),
       (2,2,'2006/3/23',NULL),
       (3,1,'2006/3/16',NULL);

INSERT INTO products
VALUES (1,'May giat',3),
       (2,'Tu lanh',5),
       (3,'Dieu hoa',7),
       (4,'Quat',1),
       (5,'Bep dien',2);

INSERT INTO order_detail
VALUES (1,1,3),(1,3,7),
       (1,4,2),(2,1,1),
       (3,1,8),(2,5,4),(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT orders.order_id,orders.order_date,orders.order_total_price
FROM orders;

-- HiểN THị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT c.customer_id, c.customer_name, p.product_name
FROM customers c
JOIN orders       o   ON c.customer_id = o.customer_id
JOIN order_detail odt ON o.order_id = odt.order_id
JOIN products     p   ON p.product_id = odt.product_id;

-- Hiển thỊ têN những khácH hànG không mua bất kỳ một sản phẩm nào
SELECT 
    c.customer_id, c.customer_name
FROM
    customers c
        LEFT JOIN
    orders o ON c.customer_id = o.customer_id
WHERE
    o.customer_id IS NULL;

-- HIển thị mã hóa đƠn, ngày bán và GIÁ TiềN của từng hóA đƠN 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
--  Giá bán của từng loại được tính = odQTY*pPrice)
SELECT o.order_id, o.order_date, SUM(p.product_price * od.order_quantity) AS total_price
FROM orders o
JOIN order_detail od ON od.order_id = o.order_id
JOIN products     p  ON p.product_id = od.product_id
GROUP BY o.order_id;


