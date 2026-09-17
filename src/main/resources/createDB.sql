-- ============================================================
-- DROP TABLES
-- ============================================================

DROP TABLE IF EXISTS delivery;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS order_item;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS menu_item;
DROP TABLE IF EXISTS restaurant;
DROP TABLE IF EXISTS customer;


-- ============================================================
-- CREATE CUSTOMER
-- ============================================================

CREATE TABLE customer (
id BIGINT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(150) NOT NULL UNIQUE,
address VARCHAR(255) NOT NULL
);


-- ============================================================
-- CREATE RESTAURANT
-- ============================================================

CREATE TABLE restaurant (
id BIGINT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
address VARCHAR(255) NOT NULL
);


-- ============================================================
-- CREATE MENU ITEM
-- ============================================================

CREATE TABLE menu_item (
id BIGINT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
price DECIMAL(10, 2) NOT NULL,
restaurant_id BIGINT NOT NULL,

CONSTRAINT fk_menu_item_restaurant
FOREIGN KEY (restaurant_id)
REFERENCES restaurant(id)
);


-- ============================================================
-- CREATE ORDER
-- ============================================================

CREATE TABLE orders (
id BIGINT PRIMARY KEY,
customer_id BIGINT NOT NULL,
restaurant_id BIGINT NOT NULL,
status VARCHAR(30) NOT NULL,
total DECIMAL(10, 2) NOT NULL,

CONSTRAINT fk_order_customer
FOREIGN KEY (customer_id)
REFERENCES customer(id),

CONSTRAINT fk_order_restaurant
FOREIGN KEY (restaurant_id)
REFERENCES restaurant(id)
);


-- ============================================================
-- CREATE ORDER ITEM
-- ============================================================

CREATE TABLE order_item (
id BIGINT PRIMARY KEY,
order_id BIGINT NOT NULL,
menu_item_id BIGINT NOT NULL,
quantity INT NOT NULL,

CONSTRAINT fk_order_item_order
FOREIGN KEY (order_id)
REFERENCES orders(id),

CONSTRAINT fk_order_item_menu_item
FOREIGN KEY (menu_item_id)
REFERENCES menu_item(id)
);


-- ============================================================
-- CREATE PAYMENT
-- ============================================================

CREATE TABLE payment (
id BIGINT PRIMARY KEY,
order_id BIGINT NOT NULL,
amount DECIMAL(10, 2) NOT NULL,
status VARCHAR(30) NOT NULL,

CONSTRAINT fk_payment_order
FOREIGN KEY (order_id)
REFERENCES orders(id)
);


-- ============================================================
-- CREATE DELIVERY
-- ============================================================

CREATE TABLE delivery (
id BIGINT PRIMARY KEY,
order_id BIGINT NOT NULL,
address VARCHAR(255) NOT NULL,
status VARCHAR(30) NOT NULL,

CONSTRAINT fk_delivery_order
FOREIGN KEY (order_id)
REFERENCES orders(id)
);

-- ============================================================
-- CUSTOMERS
-- ============================================================

INSERT INTO customer (id, name, email, address)
VALUES (1, 'Alice Johnson', 'alice@example.com',
        'Main Street 10, Leuven');

INSERT INTO customer (id, name, email, address)
VALUES (2, 'Bob Smith', 'bob@example.com',
        'Station Street 25, Leuven');

INSERT INTO customer (id, name, email, address)
VALUES (3, 'Charlie Brown', 'charlie@example.com',
        'Park Avenue 5, Brussels');

INSERT INTO customer (id, name, email, address)
VALUES (4, 'Diana Miller', 'diana@example.com',
        'Market Street 18, Mechelen');


-- ============================================================
-- RESTAURANTS
-- ============================================================

INSERT INTO restaurant (id, name, address)
VALUES (1, 'Pizza Palace',
        'Bondgenotenlaan 20, Leuven');

INSERT INTO restaurant (id, name, address)
VALUES (2, 'Burger House',
        'Tiensestraat 45, Leuven');

INSERT INTO restaurant (id, name, address)
VALUES (3, 'Sushi World',
        'Naamsestraat 80, Leuven');


-- ============================================================
-- MENU ITEMS
-- ============================================================

INSERT INTO menu_item (id, name, price, restaurant_id)
VALUES (1, 'Margherita Pizza', 10.50, 1);

INSERT INTO menu_item (id, name, price, restaurant_id)
VALUES (2, 'Pepperoni Pizza', 12.50, 1);

INSERT INTO menu_item (id, name, price, restaurant_id)
VALUES (3, 'Four Cheese Pizza', 13.50, 1);

INSERT INTO menu_item (id, name, price, restaurant_id)
VALUES (4, 'Classic Burger', 11.00, 2);

INSERT INTO menu_item (id, name, price, restaurant_id)
VALUES (5, 'Cheeseburger', 12.00, 2);

INSERT INTO menu_item (id, name, price, restaurant_id)
VALUES (6, 'Bacon Burger', 13.50, 2);

INSERT INTO menu_item (id, name, price, restaurant_id)
VALUES (7, 'Salmon Sushi', 13.50, 3);

INSERT INTO menu_item (id, name, price, restaurant_id)
VALUES (8, 'California Roll', 11.50, 3);

INSERT INTO menu_item (id, name, price, restaurant_id)
VALUES (9, 'Vegetable Sushi', 10.00, 3);


-- ============================================================
-- ORDERS
-- ============================================================

INSERT INTO orders (id, customer_id, restaurant_id, status, total)
VALUES (1, 1, 1, 'CONFIRMED', 23.00);

INSERT INTO orders (id, customer_id, restaurant_id, status, total)
VALUES (2, 2, 2, 'PREPARING', 23.00);

INSERT INTO orders (id, customer_id, restaurant_id, status, total)
VALUES (3, 3, 3, 'DELIVERED', 25.50);

INSERT INTO orders (id, customer_id, restaurant_id, status, total)
VALUES (4, 1, 2, 'CREATED', 11.00);


-- ============================================================
-- ORDER ITEMS
-- ============================================================

INSERT INTO order_item (id, order_id, menu_item_id, quantity)
VALUES (1, 1, 1, 1);

INSERT INTO order_item (id, order_id, menu_item_id, quantity)
VALUES (2, 1, 2, 1);

INSERT INTO order_item (id, order_id, menu_item_id, quantity)
VALUES (3, 2, 4, 1);

INSERT INTO order_item (id, order_id, menu_item_id, quantity)
VALUES (4, 2, 6, 1);

INSERT INTO order_item (id, order_id, menu_item_id, quantity)
VALUES (5, 3, 7, 1);

INSERT INTO order_item (id, order_id, menu_item_id, quantity)
VALUES (6, 3, 8, 1);

INSERT INTO order_item (id, order_id, menu_item_id, quantity)
VALUES (7, 4, 4, 1);


-- ============================================================
-- PAYMENTS
-- ============================================================

INSERT INTO payment (id, order_id, amount, status)
VALUES (1, 1, 23.00, 'PAID');

INSERT INTO payment (id, order_id, amount, status)
VALUES (2, 2, 23.00, 'PAID');

INSERT INTO payment (id, order_id, amount, status)
VALUES (3, 3, 25.50, 'PAID');


-- ============================================================
-- DELIVERIES
-- ============================================================

INSERT INTO delivery (id, order_id, address, status)
VALUES (1, 1, 'Main Street 10, Leuven', 'IN_TRANSIT');

INSERT INTO delivery (id, order_id, address, status)
VALUES (2, 2, 'Station Street 25, Leuven', 'PREPARING');

INSERT INTO delivery (id, order_id, address, status)
VALUES (3, 3, 'Park Avenue 5, Brussels', 'DELIVERED');

commit;