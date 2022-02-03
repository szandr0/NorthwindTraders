SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH from order_date) AS month,
    COUNT(DISTINCT order_details.order_id) AS order_count,
    ROUND(SUM(unit_price*quantity*(1-discount))) AS revenue
FROM order_details
INNER JOIN orders
ON order_details.order_id = orders.order_id
WHERE EXTRACT(YEAR FROM orders.order_date) = 1997
GROUP BY EXTRACT(MONTH from order_date), EXTRACT(YEAR FROM order_date);