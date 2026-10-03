{% snapshot scd_products %}

{{
    config(
      target_schema='snapshots',
      unique_key='sku',
      strategy='check',
      check_cols=['name', 'type', 'price', 'description'],
      hard_deletes='invalidate'
    )
}}

select * from {{ source('jaffle_shop', 'products') }}

{% endsnapshot %}