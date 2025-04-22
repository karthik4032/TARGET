select distinct c.customer_state as state , sum(p.payment_value) over (partition by c.customer_state) as total_order_value_per_state,
round(avg(p.payment_value) over (partition by c.customer_state),2) as avg_order_value_per_state
from `target.payments` as p inner join `target.orders` as o on p.order_id = o.order_id inner join `target.customers` as c on o.customer_id = c.customer_id
order by state