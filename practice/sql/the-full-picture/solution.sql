SELECT 
  t1.emp_name, 
  ISNULL(t2.total_metric_value, 0.000) as total_metric_value
FROM employees t1
LEFT JOIN
(
  SELECT 
    department, 
    SUM(metric_value) as total_metric_value
  FROM employee_metrics
  WHERE fiscal_quarter = 'Q1'
  GROUP BY department
) t2
ON t1.department = t2.department
