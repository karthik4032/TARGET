with base as
(select extract(year from order_purchase_timestamp) as year, round(sum(payment_value),2) as total_order_value_per_year
from `target.orders` as o inner join `target.payments` as p on o.order_id = p.order_id
where extract(year from order_purchase_timestamp) in (2017,2018) and extract(month from order_purchase_timestamp) between 1 and 8
group by year
order by year)

select *,round(((next_year_order_value - total_order_value_per_year) / total_order_value_per_year ) * 100,2) as percentage_increase
from
(select *,lead(total_order_value_per_year) over (order by base.year) as next_year_order_value
from base)
order by year
