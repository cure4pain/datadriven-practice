SELECT TOP 5
  product_name, 
  total_revenue
FROM
(
  SELECT 
    product_id, 
    SUM(total_amount) as total_revenue
  FROM transactions
  GROUP BY product_id
) t1
INNER JOIN products t2
ON t1.product_id = t2.product_id
ORDER BY total_revenue DESC
