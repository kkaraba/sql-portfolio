# Ποιες χώρες έχουν τους πελάτες με τον υψηλότερο μέσο credit score;
select country, round(avg(credit_score), 2) as average_credit_score
from customers 
group by country
order by avg(credit_score) desc;

# Ποιος μήνας είχε τις περισσότερες πωλήσεις (σε revenue);
SELECT
  DATE_FORMAT(order_date, '%Y-%m') AS year_and_month,
  sum(total_amount) as total_sum
FROM orders
where status != 'cancelled'
group by  DATE_FORMAT(order_date, '%Y-%m')
order by  sum(total_amount) desc
limit 1;