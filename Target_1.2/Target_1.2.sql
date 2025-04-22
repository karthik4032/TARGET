select min(order_purchase_timestamp) as first_order_timestamp , max(order_purchase_timestamp) as recent_order_timestamp
from `target.orders`