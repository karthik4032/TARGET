with base as
(select order_id,c.customer_state, TIMESTAMP_DIFF(order_estimated_delivery_date,order_purchase_timestamp,day) as estimated_delivery_time,
case when order_delivered_customer_date is not null then TIMESTAMP_DIFF(order_delivered_customer_date,order_purchase_timestamp,day)
else null
end as delivery_time
from `target.orders` as o inner join `target.customers` as c on o.customer_id = c.customer_id)


select distinct customer_state as state, round(avg(base.delivery_time) over (partition by customer_state),2) as avg_time_per_state
from base
order by avg_time_per_state desc
limit 5