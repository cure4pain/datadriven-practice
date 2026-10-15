WITH main_cte as (
  
    SELECT 
      branch,
      CASE
        WHEN trigger != 'manual' THEN 'merge'
        ELSE 'other'
      END as other_vs_merge,
      dur_secs
    FROM ci_builds
    WHERE YEAR(built_at) = 2026 AND branch IN ('develop', 'main', 'release')

)


SELECT
    t1.branch,
    ISNULL(t2.build_count,0) build_count,
    ISNULL(t2.build_count_decimal, 0.0) build_count_decimal,
    (total_secs * 1.000) / build_count_avg as avg_duration
FROM
(
  SELECT 'develop' AS branch
  UNION ALL
  SELECT 'main'
  UNION ALL
  SELECT 'release'
) t1
LEFT JOIN
(
  SELECT 
    branch, 
    COUNT(*) as build_count,
    CAST(COUNT(*) as DECIMAL(14,4)) as build_count_decimal
  FROM main_cte
  WHERE other_vs_merge = 'merge'
  GROUP BY branch
) t2
ON t1.branch = t2.branch
LEFT JOIN
(
  SELECT 
    branch, 
    COUNT(*) as build_count_avg,
    SUM(dur_secs) as total_secs
  FROM main_cte
  WHERE other_vs_merge = 'merge' AND dur_secs IS NOT NULL
  GROUP BY branch
) t3
ON t1.branch = t3.branch
