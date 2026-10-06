{% macro drop_dev_schemas() %}
  {% set query %}
    show schemas in database JAFFLE_SHOP;
  {% endset %}

  {% set results = run_query(query) %}
  
  {% if execute %}
    {% set results_list = results.columns[1].values() %}
  {% else %}
    {% set results_list = [] %}
  {% endif %}

  {% for schema in results_list %}
    {% if schema.startswith('PR_') or schema.startswith('DEV_') %}
      {% set drop_query = "drop schema if exists " ~ target.database ~ "." ~ schema %}
      {{ log("Dropping schema: " ~ schema, info=True) }}
      {% do run_query(drop_query) %}
    {% endif %}
  {% endfor %}
{% endmacro %}