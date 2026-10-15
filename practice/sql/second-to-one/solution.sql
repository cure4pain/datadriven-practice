SELECT DISTINCT  
   t1.department,
   t1.salary as second_highest_salary
FROM
(
  SELECT 
      department,
      salary,
      DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) as rank
  FROM employees
) t1
  WHERE rank = 2
  ORDER BY department ASC
