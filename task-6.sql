SELECT
    customers.company_name AS company_name,
    COUNT(orders.order_id) AS orders,
    STRING_AGG(cast(orders.order_id as TEXT),',') AS order_ids
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
WHERE customers.country LIKE 'USA'
GROUP BY customers.company_name
HAVING COUNT(orders.order_id) < 5
ORDER BY orders, customers.company_name;