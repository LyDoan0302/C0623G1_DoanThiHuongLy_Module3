CREATE DATABASE ss5_ex_products;
USE ss5_ex_products;
CREATE TABLE products(
	id                 INT auto_increment PRIMARY KEY,
	productCode        VARCHAR(50) NOT NULL,
	productName        VARCHAR(50) NOT NULL,
	productPrice       DOUBLE NOT NULL,
	productAmount      INT,
	productDescription VARCHAR(100),
	productStatus      VARCHAR(45)
);
INSERT INTO products (productCode,productName,productPrice,productAmount,productDescription,productStatus)
VALUES 
		('01', 'pink',50000, 3,'for baby','stored at 01'),
		('02', 'black',40000, 5,'for toolde','stored at 01'),
		('03', 'red',40000, 4,'for kid','stored at 01'),
		('04', 'yellow',50000, 100,'for boy','stored at 01'),
		('05', 'white',70000, 10,'for girl','stored at 01'),
		('06', 'grey',90000, 78,'for man','stored at 01')
;
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index
CREATE UNIQUE INDEX index_products 
ON 					products(productCode)
;
CREATE INDEX composite_index_products
ON 			 products(productName, productPrice)
;
EXPLAIN  SELECT *
FROM products
WHERE productName = 'white'
;
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tiến hành sửa đổi view
-- Tiến hành xoá view
CREATE VIEW view_product AS
SELECT productCode, productName, productPrice, productStatus 
FROM products
;
UPDATE view_product
SET productPrice = 78000
WHERE productCode = '05'
;
DROP VIEW view_product
;
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
-- Tạo store procedure thêm một sản phẩm mới
-- Tạo store procedure sửa thông tin sản phẩm theo id
-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE find_all_products()
BEGIN
SELECT * FROM products;
END //
DELIMITER ;
CALL find_all_products();
DELIMITER //
CREATE PROCEDURE add_new_product(productCode VARCHAR(50),productName VARCHAR(50) ,productPrice DOUBLE ,productAmount INT ,productDescription VARCHAR(50),productStatus VARCHAR(50))
BEGIN 
INSERT INTO products (productCode,productName,productPrice,productAmount,productDescription,productStatus)
VALUES (productCode,productName,productPrice,productAmount,productDescription,productStatus);
END //
DELIMITER ;
CALL add_new_product('07', 'grey',90000, 78,'for man','stored at 01')
;
DELIMITER //
CREATE PROCEDURE update_products(id_prodduct INT, product_name VARCHAR(50), price DOUBLE )
BEGIN 
UPDATE products
SET productName = product_name, productPrice = price
WHERE id = id_prodduct;
END //
DELIMITER ;
CALL update_products(2, 'pink', 98000)
;
DELIMITER //
CREATE PROCEDURE delete_product(id_prodduct INT)
BEGIN
DELETE FROM products
WHERE id = id_prodduct;
END //
DELIMITER ; 
CALL delete_product(7);




