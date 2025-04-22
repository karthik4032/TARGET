select extract(year from order_purchase_timestamp ) as year, extract(month from order_purchase_timestamp ) as month, payment_type, count(p.order_id) as total_no_orders_per_payment_type
from `target.payments` as p inner join `target.orders` as o on p.order_id = o.order_id
group by year , month, payment_type
order by year, month, payment_type