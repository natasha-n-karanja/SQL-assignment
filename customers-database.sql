--CUSTOMERS TABLE
CREATE TABLE customers( customer_id SERIAL PRIMARY KEY, name VARCHAR(100), email VARCHAR(100) UNIQUE adrdress, TEXT);

--PRODUCTS TABLE
CREATE TABLE products (product_id SERIAL PRIMARY KEY, name VARCHAR(100) price FLOAT);

--ORDERS TABLE
CREATE TABLE orders (order_id SERIAL PRIMARY KEY, customer_id INT, product_id INT,quantity INT, order_date DATE, FOREIGN KEY (customer_id) REFERENCES customers(customer_id), FOREIGN KEY (product_id) REFERENCES products(product_id) );

--TOTAL REVENUE GENERATED FROM ORDERS
SELECT SUM(p.price * o.quantity) AS total_revenue FROM orders o JOIN products p ON o.product_id = p.product_id;

--PRODUCTS WITH THE HIGHEST SALES REVENUE
SELECT p.name, SUM(p.price * o.quantity) AS revenue FROM orders o JOIN products p ON o.product_id = p.product_id GROUP BY p.name ORDER BY revenue DESC LIMIT 5;

--UPDATE CUSTOMER INFORMATION
UPDATE customers SET name = 'Jr' WHERE customer_id = 1;
UPDATE customers SET email = 'bobby@gmail.com' WHERE customer_id = 2;
UPDATE customers SET address = 'section 58' WHERE customer_id = 3;

--TRANSACTION TO TRANSFER FUNDS BETWEEN TWO ACCOUNTS
CREATE TABLE bank_accounts (account_id SERIAL PRIMARY KEY, customer_id INT, balance FLOAT);