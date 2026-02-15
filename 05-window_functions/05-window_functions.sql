# Ποιο είναι το customer retention rate ανά μήνα (πελάτες που έκαναν παραγγελία και τον προηγούμενο μήνα);
WITH monthly_active AS (
  SELECT 
    DATE_FORMAT(order_date, '%Y-%m') as month,
    customer_id
  FROM orders
  WHERE status != 'cancelled'
  GROUP BY DATE_FORMAT(order_date, '%Y-%m'), customer_id
),
retention_data AS (
  SELECT 
    curr.month,
    COUNT(DISTINCT curr.customer_id) as active_customers,
    COUNT(DISTINCT prev.customer_id) as retained_from_previous
  FROM monthly_active curr
  LEFT JOIN monthly_active prev ON curr.customer_id = prev.customer_id
    AND prev.month = DATE_FORMAT(
      DATE_SUB(STR_TO_DATE(CONCAT(curr.month, '-01'), '%Y-%m-%d'), INTERVAL 1 MONTH), 
      '%Y-%m'
    )
  GROUP BY curr.month
)
SELECT 
  month,
  active_customers,
  retained_from_previous,
  LAG(active_customers) OVER (ORDER BY month) as previous_month_total,
  ROUND(
    COALESCE(retained_from_previous * 100.0 / 
    LAG(active_customers) OVER (ORDER BY month), 0), 
    2
  ) as retention_rate_percent
FROM retention_data
ORDER BY month;

# Πόσες παραγγελίες ήταν cancelled ανά μήνα και ποιος είναι ο λόγος τους (high value/low value);
with lev as(
SELECT
  DATE_FORMAT(order_date, '%Y-%m') AS year_and_month,
  ntile(3) over (partition by DATE_FORMAT(order_date, '%Y-%m') order by total_amount) as amount_level, 
  total_amount, order_id,
case when  (ntile(3) over (partition by DATE_FORMAT(order_date, '%Y-%m') order by total_amount)) = 1 then 1 else 0 end as low_level,
case when (ntile(3) over (partition by DATE_FORMAT(order_date, '%Y-%m') order by total_amount)) = 3 then 1 else 0 end as high_level
FROM orders
 where status='cancelled')
select year_and_month, count(*),
sum(high_level)/sum(low_level), sum(high_level), sum(low_level)
from lev
group by  year_and_month;