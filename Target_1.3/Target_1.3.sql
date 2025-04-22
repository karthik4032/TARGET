select count (distinct customer_city) as no_of_cities, count(distinct customer_state) as no_of_states
from target.customers as c right join `target.orders` as o on c.customer_id = o.customer_id
