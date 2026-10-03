{% snapshot scd_customers %}

{{
    config(
      target_schema='snapshots',
      unique_key='id',
      strategy='check',
      check_cols=['name'],
      hard_deletes='invalidate'
    )
}}

select * from {{ source('jaffle_shop', 'customers') }}

{% endsnapshot %}