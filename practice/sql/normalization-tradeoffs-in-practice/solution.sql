SELECT 
  t1.category,
  SUM((t1.price * t2.total_quantity)) as total_revenue
FROM products t1
INNER JOIN
(
SELECT 
  product_id,
  SUM(quantity) as total_quantity
FROM transactions
GROUP BY product_id
) t2
ON t1.product_id = t2.product_id
GROUP BY t1.category
