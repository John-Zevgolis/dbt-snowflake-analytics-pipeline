select
    customer_id,
    sum(order_total) as total_spent
from {{ ref('fct_orders') }}
group by customer_id
order by total_spent desc;