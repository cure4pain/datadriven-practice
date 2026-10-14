SELECT 
  t1.product_name
FROM products t1
LEFT JOIN
(
  SELECT DISTINCT product_id FROM transactions
) t2
ON t1.product_id = t2.product_id 
WHERE t2.product_id IS NULL 
ORDER BY t1.product_name
