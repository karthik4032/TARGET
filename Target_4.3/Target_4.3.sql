select distinct c.customer_state as state , sum(i.freight_value) over (partition by c.customer_state) as total_freight_value_per_state,
round(avg(i.freight_value) over (partition by c.customer_state),2) as avg_freight_value_per_state
from `target.order_items` as i inner join `target.orders` as o on i.order_id = o.order_id inner join `target.customers` as c on o.customer_id = c.customer_id
order by state