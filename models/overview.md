{% docs __overview__ %}

# Jaffle Shop dbt Project Overview

This document captures the exact structure, models, and configuration of your local `jaffle_shop` dbt project as organized in your VS Code workspace.

## 1. Project Directory Structure

```text
jaffle_shop/
├── .vscode/
├── dbt_packages/
├── logs/
├── macros/
├── models/
│   ├── marts/
│   │   ├── dim_customers.sql & .yml
│   │   ├── dim_products.sql & .yml
│   │   ├── dim_stores.sql & .yml
│   │   ├── fct_order_items.sql & .yml
│   │   ├── fct_orders.sql & .yml
│   │   └── fct_product_supplies.sql & .yml
│   └── staging/
│       ├── sources.yml
│       ├── stg_customers.sql & .yml
│       ├── stg_order_items.sql & .yml
│       ├── stg_orders.sql & .yml
│       ├── stg_products.sql & .yml
│       ├── stg_stores.sql & .yml
│       └── stg_supplies.sql & .yml
├── seeds/
├── snapshots/
├── target/
├── .gitignore
├── dbt_project.yml
├── package-lock.yml
├── packages.yml
└── README.md
```

## 2. Modeling Layers & Components

- **Staging Layer (`models/staging/`):**
  - Direct cleaning and normalization of raw source files (`stg_customers`, `stg_orders`, `stg_order_items`, `stg_products`, `stg_stores`, `stg_supplies`).
  - Backed by `sources.yml` for source definitions.

- **Mart Layer (`models/marts/`):**
  - **Dimensions:** `dim_customers`, `dim_products`, `dim_stores` capturing core business entities with robust configuration and descriptions.
  - **Facts:** `fct_orders`, `fct_order_items`, `fct_product_supplies` capturing transactional data and metrics.

## 3. Data Governance & Testing (`.yml` Contracts)

As seen in `dim_customers.yml`, the project implements advanced dbt features:

- **Model Contracts:** `enforced: true` to guarantee schema compliance.
- **Data Tests:** Built-in tests such as `unique`, `not_null`, and custom expressions (`dbt_utils.expression_is_true`) to ensure data integrity (e.g., `first_order_date <= most_recent_order_date`).

## 4. Documentation & Local Serving

- Documentation generated via `dbt docs generate`.
- Local server hosted successfully at `http://127.0.0.1:8580` using `dbt docs serve` to visualize lineage graphs and table schemas.

{% enddocs %}
