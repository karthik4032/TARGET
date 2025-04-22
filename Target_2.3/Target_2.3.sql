select case
when (extract(hour from order_purchase_timestamp)) between 0 and 6 then "Dawn"
when (extract(hour from order_purchase_timestamp)) between 7 and 12 then "Mornings"
when (extract(hour from order_purchase_timestamp)) between 13 and 18 then "Afternoon"
when (extract(hour from order_purchase_timestamp)) between 19 and 23 then "Night"
end as time_of_the_day,
count(order_id) as total_orders
from `target.orders`
group by time_of_the_day
order by total_orders desc