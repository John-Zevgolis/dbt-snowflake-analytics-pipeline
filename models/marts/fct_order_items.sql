with order_items as (
    select * from {{ ref('stg_order_items') }}
),
products as (
    select * from {{ ref('stg_products') }}
),
joined as (
    select 
        order_items.item_id,
        order_items.order_id,
        order_items.product_id,
        products.price as item_price
    from order_items join products on order_items.product_id = products.product_id
)

select * from joined