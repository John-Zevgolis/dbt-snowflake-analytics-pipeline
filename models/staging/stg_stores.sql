WITH raw_stores AS (
    SELECT * FROM {{ source('jaffle_shop', 'stores') }}
)

SELECT
    id as store_id,
    name as store_name,
    cast(opened_at as date) as opened_at,
    cast(tax_rate as numeric(10,2)) as tax_rate
FROM raw_stores