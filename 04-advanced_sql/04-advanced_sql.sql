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

# Ποιοι πελάτες έχουν κάνει παραγγελία σε 3 διαφορετικούς μήνες minimum;
with m_ord as (
select c.customer_id, c.last_name, date_format(order_date, '%Y-%m') as month, 
count(distinct (date_format(order_date, '%Y-%m')) ) as months_ordered
from customers c
join orders o 
on c.customer_id=o.customer_id
group by c.customer_id, c.last_name, date_format(order_date, '%Y-%m') 
)
select customer_id, last_name, count(months_ordered) as months_ordered
from m_ord
group by customer_id
having count(months_ordered)>=3
order by count(months_ordered) desc;

# Πόσο είναι το customer lifetime value (CLV) ανά country;
with tot as (
select c.customer_id, c.country, sum(o.total_amount) as total
from orders o 
join customers c
on o.customer_id = c.customer_id
where status!='cancelled'
group by c.customer_id, c.country
) 
select country, sum(total) as sum_all
from tot
group by country
order by sum(total) desc;