WITH raw_products AS (
    SELECT * FROM {{ source('jaffle_shop', 'products') }}
)

SELECT
    sku as product_id,
    name as product_name,
    type,
    cast(price as numeric(10,2)) as price, 
    description
FROM raw_products