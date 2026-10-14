SELECT 
    pipe_name, 
    start_at,
    CASE 
      WHEN rows_out IS NULL or rows_out = -1 THEN NULL
      ELSE CAST( 1.0 * rows_out / NULLIF(rows_in, 0) AS DECIMAL(18, 4))
    END throughput_ratio
FROM data_pipes
ORDER BY pipe_name, start_at
