select extract(year from order_purchase_timestamp) as year, count(order_id) as total_no_orders
from `target.orders`
group by year
order by year
