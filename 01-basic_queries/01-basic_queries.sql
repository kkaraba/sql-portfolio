#Ποιοι είναι οι top 10 πελάτες κατά συνολικό ποσό αγορών;
select c.customer_id, concat(c.last_name,' ', c.first_name) as name, sum(o.total_amount) as total_amount
from orders o 
join customers c 
on o.customer_id=c.customer_id
group by c.customer_id, c.last_name, c.first_name
order by sum(o.total_amount) desc
limit 10;

#Ποιες χώρες έχουν τους πελάτες με τον υψηλότερο μέσο credit score;
select country, round(avg(credit_score), 2) as average_credit_score
from customers 
group by country
order by avg(credit_score) desc;

# Πόσα προϊόντα έχουν stock_quantity < 20 και ανήκουν στην subcategory 'Premium';
select count(product_id)
from products
where stock_quantity < 20 and subcategory = 'Premium';

# Ποιος μήνας είχε τις περισσότερες πωλήσεις (σε revenue);
SELECT
  DATE_FORMAT(order_date, '%Y-%m') AS year_and_month,
  sum(total_amount) as total_sum
FROM orders
where status != 'cancelled'
group by  DATE_FORMAT(order_date, '%Y-%m')
order by  sum(total_amount) desc
limit 1;

#Πόσοι πελάτες ανά πόλη έχουν average order value > 200€;
with o_c as (
select c.customer_id, concat(c.last_name,'     ', c.first_name) as name, c.city as city, avg(o.total_amount) as average_amount
from orders o 
join customers c 
on o.customer_id=c.customer_id
group by c.customer_id) 
select city, count(*) as num
from o_c
where average_amount > 200
group by city
order by num desc;