select payment_installments ,count(order_id) as total_no_of_orders_per_installment
from `target.payments`
group by payment_installments
order by payment_installments