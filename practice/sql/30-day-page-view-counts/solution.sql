SELECT 
  user_id, 
  count(*)
FROM page_views
WHERE viewed_at BETWEEN '2025-01-01' AND '2025-12-28'
group by user_id
