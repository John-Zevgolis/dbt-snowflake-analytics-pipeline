WITH raw_orders AS (
    SELECT * FROM {{ source('jaffle_shop', 'orders') }}
)

SELECT
    id as order_id,
    customer as customer_id,
    cast(ordered_at as timestamp) as ordered_at,
    store_id,
    cast(subtotal as numeric(10,2)) as subtotal,
    cast(tax_paid as numeric(10,2)) as tax_paid,
    cast(order_total as numeric(10,2)) as order_total
FROM raw_orders