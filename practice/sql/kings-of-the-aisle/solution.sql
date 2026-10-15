SELECT
    category,
    product_name,
    total_revenue
FROM
(
  SELECT 
    t1.category,
    t1.product_name,
    total_revenue, 
    ROW_NUMBER() OVER (PARTITION BY t1.category ORDER by total_revenue DESC) as row_number
  FROM products t1
  LEFT JOIN 
  (
      SELECT
        t1_in.*,
        SUM(total_amount) as total_revenue
      FROM(
          SELECT 
            *
          FROM transactions 
          WHERE YEAR(DATE(transaction_date)) = 2026
          ) t1_in
      GROUP BY product_id
  ) t2
  ON t1.product_id = t2.product_id
) t3
WHERE t3.row_number = 1
ORDER BY total_revenue DESC



/*      
SELECT
  *
from products
where product_name = 'Eco Kit 98X'  --5754
*/

/*
SELECT 
   *
FROM transactions
where product_id = 5754
*/
