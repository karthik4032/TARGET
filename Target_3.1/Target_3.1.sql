
select c.customer_state, extract(year from order_purchase_timestamp) as year,extract(month from order_purchase_timestamp) as month,
count(order_id) as total_orders 
from `target.orders` as o left join `target.customers` as c on o.customer_id = c.customer_id
group by c.customer_state,year,month
order by c.customer_state,year,month
