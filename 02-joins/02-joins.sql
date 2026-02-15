#Πόσοι πελάτες ανά tier (Bronze/Silver/Gold/Platinum) έχουν κάνει παραγγελία;
with ord as (
select distinct c.customer_id, c.customer_tier
from  customers c  
inner join  orders o 
on o.customer_id=c.customer_id
group by c.customer_id)
select customer_tier, count(customer_id)
from ord
group by customer_tier;

# Πόσο είναι το συνολικό revenue ανά κατηγορία και subcategory;
select p.category, p.subcategory, sum(oi.quantity *oi.unit_price) as total
from order_items oi 
join products p
on p.product_id=oi.product_id
group by p.category, p.subcategory
order by category, subcategory;

# Ποιος supplier έχει τα περισσότερα προϊόντα με stock_quantity < 50;
select s.supplier_id, s.supplier_name, count(p.product_id) as stock_under_50, p.stock_quantity
from products p 
join suppliers s
on p.supplier_id=s.supplier_id
#where p.stock_quantity < 50
group by s.supplier_id, s.supplier_name, p.stock_quantity
having p.stock_quantity < 50;