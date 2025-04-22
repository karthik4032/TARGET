with base as 
(select customer_state, count(customer_unique_id) as no_of_customers
from `target.customers`
group by customer_state
order by customer_state)

select *
from base
order by base.no_of_customers
