WITH raw_supplies AS (
    SELECT * FROM {{ source('jaffle_shop', 'supplies') }}
)

SELECT
    {{dbt_utils.generate_surrogate_key(['id', 'sku'])}} as supply_id,
    id as source_supply_id,
    name as supply_name,
    cast(cost as numeric(10,2)) as cost,
    perishable,
    sku as product_id
FROM raw_supplies