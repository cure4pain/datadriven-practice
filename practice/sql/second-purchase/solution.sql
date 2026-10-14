SELECT 
  user_id, 
  total_amount,
  transaction_date
FROM
(
  SELECT 
      user_id, 
      total_amount,
      transaction_date,
      ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY DATE(transaction_date)) as row_number
  FROM transactions
) t1
WHERE row_number = 2
