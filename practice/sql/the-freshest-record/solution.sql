SELECT
  log_id, 
  server_name, 
  log_level, 
  message,
  response_time_ms, 
  log_timestamp
FROM
(
  SELECT 
    log_id, 
    server_name, 
    log_level, 
    message,
    response_time_ms, 
    log_timestamp,
    ROW_NUMBER() OVER (PARTITION BY server_name, message ORDER BY log_timestamp) as row_nr
  FROM server_logs
) t1
WHERE t1.row_nr = 1 AND log_timestamp >= DATEADD(DAY, -90, GETDATE())
