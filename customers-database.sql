--CUSTOMERS TABLE
CREATE TABLE customers( customer_id SERIAL PRIMARY KEY, name VARCHAR(100), email VARCHAR(100) UNIQUE adrdress TEXT);

--PRODUCTS TABLE
CREATE TABLE products (product_id SERIAL PRIMARY KEY, name VARCHAR(100) price FLOAT);

--ORDERS TABLE
CREATE TABLE orders (order_id SERIAL PRIMARY KEY, customer_id INT, product_id INT,quantity INT, order_date DATE, FOREIGN KEY (customer_id) REFERENCES customers(customer_id), FOREIGN KEY (product_id) REFERENCES products(product_id) );

--TOTAL REVENUE GENERATED FROM ORDERS
SELECT SUM(p.price * o.quantity) AS total_revenue FROM orders o JOIN products p ON o.product_id = p.product_id;