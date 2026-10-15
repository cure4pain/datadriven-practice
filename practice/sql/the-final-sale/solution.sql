SELECT 
  t2.product_name,
  t2.category,
  t1.total_amount as latest_sale_amount,
  t1.transaction_date as last_sale_date
FROM
(
  SELECT 
    product_id, 
    total_amount, 
    transaction_date,
    ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY transaction_date DESC) as row_nr
  FROM transactions
) t1
INNER JOIN products as t2
ON t1.product_id = t2.product_id
WHERE t1.row_nr = 1
ORDER BY product_name
