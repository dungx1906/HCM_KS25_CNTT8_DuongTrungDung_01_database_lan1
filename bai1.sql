CREATE DATABASE SalesManagement;
USE SalesManagement;

CREATE TABLE Product(
ID_product INT AUTO_INCREMENT PRIMARY KEY ,
name_product VARCHAR(255) NOT NULL UNIQUE,
unit_price DECIMAL(20,5) DEFAULT 0 CHECK (unit_price > 0),
manufacturer VARCHAR(255) NOT NULL UNIQUE,
inventory_puantity INT NOT NULL CHECK (inventory_puantity > 0)
);

ALTER TABLE Product
CHANGE manufacturer nha_San_Xuat VARCHAR(255) NOT NULL;

ALTER TABLE Product 
ADD UNIQUE (nha_San_Xuat);



CREATE TABLE customer(
ID_customer INT AUTO_INCREMENT PRIMARY KEY ,
name_customer VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
phone VARCHAR(255) NOT NULL UNIQUE,
address VARCHAR(255) NOT NULL ,
ID_product INT,
CONSTRAINT FOREIGN KEY (ID_product) REFERENCES Product(ID_product)
);

CREATE TABLE orders(
ID_orders INT AUTO_INCREMENT PRIMARY KEY ,
date_order DATE NOT  NULL,
total_amount DECIMAL(20,5) NOT NULL CHECK(total_amount > 0),
ID_customer INT,
CONSTRAINT FOREIGN KEY (ID_customer) REFERENCES customer(ID_customer)
);

ALTER TABLE orders
ADD COLUMN note TEXT NOT NULL ;

CREATE TABLE order_detail(
selling_price DECIMAL(20,5) NOT NULL CHECK(selling_price > 0),
purchase_puantity INT NOT NULL CHECK(purchase_puantity > 0),
ID_orders INT ,
CONSTRAINT FOREIGN KEY (ID_orders) REFERENCES orders(ID_orders)
);

DROP TABLE order_detail,orders;

INSERT INTO Product(name_product, unit_price, nha_San_Xuat, inventory_puantity)
VALUES 
('iPhone 15 Pro Max 256GB - Blue', 30000000, 'Apple', 50),
('Smart TV Sony 55 inch 4K', 18500000, 'Sony', 15),
('Chuột Logitech MX Master 3S', 2500000, 'Logitech', 100),
('Giày Nike Air Max Nữ Size 40', 3200000, 'Nike', 20),
('Laptop Lenovo Legion 5 16IRX9', 28500000, 'Lenovo', 45);

INSERT INTO customer(name_customer, email, phone, address, ID_product)
VALUES 
('Nguyễn Văn An', 'anvan.nguyen@gmail.com', '0905123456', '123 Lê Lợi, Quận Hải Châu, Đà Nẵng', 1),
('Trần Thị Bích', 'bichtran92@yahoo.com', '0914987654', '45 Nguyễn Huệ, Quận 1, TP. Hồ Chí Minh', 2),
('Lê Hoàng Nam', 'namlh.work@outlook.com', '0988222333', 'Số 10 Trần Duy Hưng, Quận Cầu Giấy, Hà Nội', 3),
('Phạm Minh Tuấn', 'tuanpham.it@hotmail.com', '0935444555', '56 Hùng Vương, TP. Huế, Thừa Thiên Huế', 4),
('Đặng Thu Thảo', 'thuthao.dang@gmail.com', '0909777888', '78 Võ Văn Kiệt, Quận Ninh Kiều, Cần Thơ', 5);


UPDATE Product 
SET unit_price = unit_price * 1.1
WHERE nha_San_Xuat = 'Apple';

DELETE FROM customer
WHERE phone IS NULL OR phone = '';

SELECT * 
FROM Product
WHERE unit_price BETWEEN 10000000 AND 20000000;




