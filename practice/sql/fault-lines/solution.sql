SELECT
  event_day,
  region, 
  (SUM(crash_error_flag) * 1.00) / SUM(open_flag) error_rate
FROM
(
  SELECT
     t1.event_day,
     t1.crash_error_flag,
     t1.open_flag,
     t2.age_bucket as region
  FROM
  (
  SELECT
    user_id,
    CAST(event_timestamp AS DATE) as event_day, 
    CASE 
      WHEN event_type in ('crash', 'error') THEN 1
      ELSE 0
    END crash_error_flag,
    CASE 
      WHEN event_type in ('open') THEN 1
      ELSE 0
    END open_flag
  FROM event_data
  WHERE event_type in ('open', 'crash', 'error')
  ) t1
  INNER JOIN
  (
    SELECT user_id, age_bucket from users
  ) t2
  ON t1.user_id = t2.user_id
) t3
GROUP BY event_day, region
