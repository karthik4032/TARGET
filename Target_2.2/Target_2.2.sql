select extract(year from order_purchase_timestamp) as year,extract(month from order_purchase_timestamp) as month,
count(order_id)as total_orders_per_year
from `target.orders`
where extract(year from order_purchase_timestamp) in (2017,2018) and extract(month from order_purchase_timestamp) between 1 and 10
group by year,month
order by year,month