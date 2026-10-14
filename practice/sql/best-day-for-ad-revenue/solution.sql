SELECT
  day_of_month,
  ISNULL(revenue_per_day_and_impression, 0) revenue_per_day_and_impression,
  CASE 
    WHEN clicks_per_day = 0 OR revenue_per_day IS NULL THEN NULL
    ELSE revenue_per_day / (clicks_per_day * 1.000)
  END revenue_per_click,
  max_revenue
FROM
(
  SELECT 
      DAY(DATE(impression_time)) day_of_month,
      SUM(revenue) as revenue_per_day,
      SUM(revenue) / COUNT(*) as revenue_per_day_and_impression,
      SUM(clicked) as clicks_per_day,
      MAX(revenue) as max_revenue 
   FROM ad_impressions
   GROUP BY DAY(DATE(impression_time))
 ) t1
 ORDER BY revenue_per_day_and_impression DESC
