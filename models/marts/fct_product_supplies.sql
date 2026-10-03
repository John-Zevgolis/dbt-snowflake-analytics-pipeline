with supplies as (
    select * from {{ ref('stg_supplies') }}
)

select 
    supply_id,
    source_supply_id,
    product_id,
    supply_name,
    cost,
    perishable
from supplies;
