select order_id, TIMESTAMP_DIFF(order_estimated_delivery_date,order_purchase_timestamp,day) as estimated_delivery_time,
case when order_delivered_customer_date is not null then TIMESTAMP_DIFF(order_delivered_customer_date,order_purchase_timestamp,day)
else null
end as delivery_time
from `target.orders`
