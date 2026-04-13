# Data Model – E-Commerce ETL Pipeline

## Overview

The Data Warehouse is designed using a **star schema**, consisting of one fact table and two dimension tables.

---

## Fact Table: fact_sales

| Column | Description |
|--------|------------|
| order_id | Order identifier |
| source | Source system (SHOPIFY / AMAZON) |
| customer_key | Foreign key to dim_customer |
| product_key | Foreign key to dim_product |
| quantity | Number of items |
| price | Unit price |
| total_price | quantity × price |
| order_date | Order date |
| last_updated | Last update timestamp |

---

## Dimension Table: dim_product

| Column | Description |
|--------|------------|
| product_key | Surrogate key |
| product_id | Business key |
| product_name | Product name |
| source | Source system |

---

## Dimension Table: dim_customer

| Column | Description |
|--------|------------|
| customer_key | Surrogate key |
| customer_id | Business key |
| customer_email | Email |
| source | Source system |

---

## Relationships

- fact_sales.product_key → dim_product.product_key  
- fact_sales.customer_key → dim_customer.customer_key  

---

##  Design Highlights

- Star schema design  
- Surrogate keys for dimensions  
- Supports multi-source integration using `source` column  
