SELECT
   t1.user_id,
   t1.endpoint,
   count(*) as cnt
FROM
(
  SELECT 
    user_id, 
    endpoint,
    DATEDIFF(MINUTE, LAG(call_time,1,0) OVER (PARTITION BY user_id, endpoint ORDER BY call_time ASC), call_time) AS mins
  FROM api_calls
  WHERE err_msg IS NOT NULL
 ) t1
 WHERE t1.mins BETWEEN 0 AND 5
 GROUP BY user_id, endpoint
 ORDER BY cnt DESC, user_id, endpoint
