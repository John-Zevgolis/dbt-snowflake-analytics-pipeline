with customers as (
    select * from {{ ref('stg_customers') }}
),
orders as (
    select * from {{ ref('stg_orders') }}
),
joined as (
    select 
        customers.customer_id,
        customers.customer_name,
        orders.order_id,
        orders.ordered_at,
        orders.store_id,
        orders.subtotal,
        orders.tax_paid,
        orders.order_total
    from customers 
    left join orders 
    on customers.customer_id = orders.customer_id
)

select 
    joined.customer_id as customer_id, 
    SPLIT_PART(joined.customer_name, ' ', 1) as first_name,
    SPLIT_PART(joined.customer_name, ' ', 2) as last_name, 
    count(order_id) as number_of_orders, 
    coalesce(sum(order_total), 0) as total_spent, 
    min(ordered_at) as first_order_date, 
    max(ordered_at) as most_recent_order_date
from joined group by customer_id, first_name, last_name