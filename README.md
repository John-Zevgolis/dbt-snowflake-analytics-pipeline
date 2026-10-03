# Modern Data Stack Analytics Pipeline (dbt & Snowflake)

A production-grade analytics engineering project implementing a dimensional star schema using **dbt (Data Build Tool)** and **Snowflake**. This project models transactional and customer data following industry best practices, data governance, and automated testing.

## 🏗️️ Architecture & Data Modeling
The project follows a classic **Star Schema** architecture within the `marts` layer:
* **`fct_orders`**: Transaction-grain fact table incorporating advanced window functions (`ROW_NUMBER`, `LAG`) to track customer order sequences and intervals (`days_since_previous_order`).
* **`dim_customers`**: Customer-grain dimension table aggregating order metrics (`total_spent`, `number_of_orders`, `first_order_date`, `most_recent_order_date`).

## 🛠️ Tech Stack
* **Data Warehouse:** Snowflake
* **Transformation & Modeling:** dbt (Data Build Tool) with Jinja SQL
* **Data Governance & Quality:** dbt Data Contracts & Custom Data Tests

## 🌟 Key Features & Best Practices
* **Enforced Data Contracts:** Guaranteed schema definitions, data types, and primary/foreign key constraints (`enforced: true`).
* **Advanced Testing Suite:** Implemented unique, not-null, relationships, custom expression tests (e.g., chronological validation), and accepted ranges.
* **Incremental Processing:** Designed with incremental materialization capabilities for efficient data scaling.
