
SELECT
  t2.product_id,
  t2.minimo
FROM
(
  SELECT
     t1.product_id,
     t1.minimo,
     AVG(t1.minimo) OVER () avgMinimo
  FROM
  (
    SELECT 
      product_id, 
      MIN(total_amount) minimo
    FROM transactions
    GROUP BY product_id
  ) t1
) t2
WHERE t2.minimo > t2.avgMinimo
ORDER BY product_id
