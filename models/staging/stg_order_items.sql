WITH raw_items AS (
    SELECT * FROM {{ source('jaffle_shop', 'items') }}
)

SELECT
    id as item_id,
    order_id,
    sku as product_id
FROM raw_items