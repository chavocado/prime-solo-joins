-- 0. Get all the users
SELECT *
FROM customers;
-- 1. Get all customers and their addresses.
SELECT *
FROM customers
JOIN addresses
ON addresses.id = customers.id;
-- 2. Get all orders and their line items.
SELECT *
FROM orders
JOIN line_items
ON line_items.product_id = orders.id;
-- 3. Which warehouses have cheetos?
SELECT *
FROM products
JOIN warehouse_product
ON warehouse_product.product_id = products.id
JOIN warehouse
ON warehouse.id = warehouse_product.warehouse_id
WHERE products.id = 5;
--just the warehouse on screen
SELECT warehouse.warehouse
FROM products
JOIN warehouse_product
ON warehouse_product.product_id = products.id
JOIN warehouse
ON warehouse.id = warehouse_product.warehouse_id
WHERE products.id = 5;
-- 4. Which warehouses have diet pepsi?
SELECT *
FROM products
JOIN warehouse_product
ON warehouse_product.product_id = products.id
JOIN warehouse
ON warehouse.id = warehouse_product.warehouse_id
WHERE products.id = 6;
-- more specific answer
SELECT warehouse.warehouse
FROM products
JOIN warehouse_product
ON warehouse_product.product_id = products.id
JOIN warehouse
ON warehouse.id = warehouse_product.warehouse_id
WHERE products.id = 6;
-- 5. Get the number of orders for each customer.
-- NOTE: It is OK if those without orders are not included in results.
SELECT customers.first_name, COUNT(orders.id)
FROM customers
JOIN addresses
ON addresses.customer_id = customers.id
JOIN orders
ON orders.address_id = addresses.id
GROUP BY customers.first_name;
--
SELECT customers.first_name, COUNT(first_name)
FROM customers
JOIN addresses
ON addresses.customer_id = customers.id
JOIN orders
ON orders.address_id = addresses.id
GROUP BY first_name;
-- 6. How many customers do we have?
SELECT COUNT(customers)
FROM customers;
-- 7. How many products do we carry?
SELECT COUNT(products)
FROM products;
-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(warehouse_product.on_hand)
FROM products
JOIN warehouse_product
ON warehouse_product.product_id = products.id
WHERE products.id = 6;
