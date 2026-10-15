SELECT
  t1.ad_campaign, 
  t1.alert_count,
  ISNULL(t2.resolved_count, 0) as resolved_count
FROM
(
  SELECT 
    ad_campaign,
    count(*) as alert_count
  FROM ad_impressions t1
  INNER JOIN alert_events t2
  ON t1.impression_time = t2.fired_at
  GROUP BY ad_campaign
) t1
LEFT JOIN
(
  SELECT 
    ad_campaign,
    count(*)  as resolved_count
  FROM ad_impressions t1
  INNER JOIN alert_events t2
  ON t1.impression_time = t2.fired_at
  WHERE t2.status = 'resolved'
  GROUP BY ad_campaign
) t2
ON t1.ad_campaign = t2.ad_campaign
