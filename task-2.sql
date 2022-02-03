SELECT DISTINCT
    categories.category_name AS category,
    COUNT(products.units_in_stock) AS number_of_products
FROM categories
JOIN products
ON products.category_id=categories.category_id
GROUP BY categories.category_name
ORDER BY number_of_products DESC, category_name;