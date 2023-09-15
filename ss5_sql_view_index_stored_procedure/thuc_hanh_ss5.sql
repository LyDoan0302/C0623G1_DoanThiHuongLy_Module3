use classicmodels;

-- [Thực hành] Chỉ mục trong MySql (v.2023)
SELECT * 
FROM customers 
WHERE customerName = 'Land of Toys Inc.'
; 
EXPLAIN SELECT * 
FROM customers 
WHERE customerName = 'Land of Toys Inc.'
; 
ALTER TABLE customers 
ADD INDEX idx_customerName(customerName)
;
EXPLAIN SELECT * 
FROM customers 
WHERE customerName = 'Land of Toys Inc.'
; 
ALTER TABLE customers 
ADD INDEX idx_full_name(contactFirstName, contactLastName)
;
EXPLAIN SELECT *
FROM customers 
WHERE contactFirstName = 'Jean' or contactFirstName = 'King'
;
ALTER TABLE customers 
DROP INDEX idx_full_name
;

-- [Thực hành] Store Procedure (v.2023)
DELIMITER //

CREATE PROCEDURE find_all_customers()

BEGIN

  SELECT * FROM customers;

END //

DELIMITER ;
call find_all_customers();
DELIMITER //

DROP PROCEDURE IF EXISTS `find_all_customers`//

CREATE PROCEDURE find_all_customers()

BEGIN

SELECT * FROM customers where customerNumber = 175;

END //

-- [Thực hành] Truyền tham số vào Store Procedure (v.2023)

-- Tham số loại IN
DELIMITER //

CREATE PROCEDURE get_cus_by_id (IN cus_num INT(11))

BEGIN

  SELECT * FROM customers WHERE customerNumber = cus_num;

END //

DELIMITER ;
call get_cus_by_id(175);

-- Tham số loại OUT
CREATE PROCEDURE GetCustomersCountByCity(

    IN  in_city VARCHAR(50),

    OUT total INT

)

BEGIN

    SELECT COUNT(customerNumber)

    INTO total

    FROM customers

    WHERE city = in_city 

END//

DELIMITER ;
CALL GetCustomersCountByCity('Lyon',@total);

SELECT @total;

-- Tham số loại INOUT
DELIMITER //

CREATE PROCEDURE SetCounter(

    INOUT counter INT,

    IN inc INT

)

BEGIN

    SET counter = counter + inc;

END//

DELIMITER ;
SET @counter = 1;

CALL SetCounter(@counter,1); -- 2

CALL SetCounter(@counter,1); -- 3

CALL SetCounter(@counter,5); -- 8

SELECT @counter; -- 8

-- [Thực hành] View trong MySql (v.2023)
CREATE VIEW customer_views AS

SELECT customerNumber, customerName, phone

FROM  customers;
SELECT * FROM customer_views;
DROP VIEW customer_views;