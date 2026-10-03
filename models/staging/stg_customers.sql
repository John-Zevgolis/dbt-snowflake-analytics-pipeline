WITH raw_customers AS (
    SELECT * FROM {{ source('jaffle_shop', 'customers') }}
)

SELECT
    id as customer_id,
    name as customer_name
FROM raw_customers