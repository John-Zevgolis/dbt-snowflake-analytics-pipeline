{# {{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}} #}

with orders as (
    select * from {{ ref('stg_orders') }}

    {#
        {% if is_incremental() %}
        where ordered_at > (select max(ordered_at) from {{ this }})
        {% endif %}
    #}
)

select 
    row_number() over(partition by customer_id order by ordered_at) as order_sequence,
    customer_id,
    order_id,
    ordered_at,
    lag(ordered_at) over(partition by customer_id order by ordered_at) as last_ordered_at,
    datediff(day, lag(ordered_at) over(partition by customer_id order by ordered_at), ordered_at) as days_since_previous_order,
    store_id,
    subtotal,
    tax_paid,
    order_total
from orders 