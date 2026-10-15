SELECT
  t1.left_id,
  t1.left_title, 
  t2.right_id,
  t2.right_title
FROM
(
  SELECT 
    content_id as left_id, 
    title as left_title
  FROM content_items
  WHERE MOD(content_id, 2) = 0
) t1
FULL JOIN
(
  SELECT 
    content_id as right_id, 
    title as right_title
  FROM content_items
  WHERE MOD(content_id, 2) != 0
) t2
ON t2.right_id = (t1.left_id + 1)
