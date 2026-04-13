
# ETL Flow – E-Commerce Pipeline

## Overview

This ETL pipeline integrates data from multiple sources and processes it into a Data Warehouse.

---

## Data Flow

Source → Staging → Clean Layer → Data Warehouse

---

## Source Layer

- Shopify (MySQL table)
- Amazon (CSV file)

---

## Staging Layer

- Raw data ingestion
- Adds metadata:
  - source
  - extracted_at

---

## Clean Layer

- Data cleaning and transformation
- Removes invalid records
- Deduplication (latest record retained)
- Calculates:
  - total_price

---

## Data Warehouse

### Dimensions:
- dim_product  
- dim_customer  

### Fact:
- fact_sales  

---

## Error Handling

Invalid records are redirected to:

→ etl_error_orders

---

## Incremental Processing

- Controlled using `etl_control` table  
- Uses `last_updated` to extract only new/updated data  
