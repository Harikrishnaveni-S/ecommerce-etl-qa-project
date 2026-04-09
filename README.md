# E-Commerce ETL Pipeline with End-to-End QA Validation

## Project Overview

This project simulates a real-world data engineering and QA scenario, covering both ETL development and structured testing lifecycle (STLC).
It demonstrates how data pipelines are validated in real-world scenarios to ensure data quality, consistency, and reliability.

The pipeline integrates data from multiple sources, transforms and validates the data, and loads it into a Data Warehouse using a dimensional model.

---

## Objectives

- Integrate multi-source data (Shopify & Amazon)
- Implement incremental data loading
- Perform data cleaning and validation
- Design a star schema data warehouse
- Execute end-to-end QA testing of ETL pipeline

---

## Architecture

**Flow:**

Source → Staging → Transformation (Clean Layer) → Data Warehouse

---

## ETL Process Overview

1. Extract data from:
   - Shopify (Database)
   - Amazon (CSV file)

2. Load into staging layer

3. Perform transformations:
   - Data cleaning
   - Standardization
   - Deduplication
   - Validation

4. Load into:
   - Product Dimension
   - Customer Dimension
   - Sales Fact Table

5. Capture and log error records

---

## Data Warehouse Model

- **Fact Table:**
  - Sales

- **Dimension Tables:**
  - Product
  - Customer

---

## QA Approach

This project follows a structured Software Testing Life Cycle (STLC) for validating the ETL pipeline:

- Requirement Analysis (Business-level validation)
- Test Planning
- Test Scenario & Test Case Design
- Data Validation using SQL
- Error handling and rejection validation
- Edge case and negative testing

---

## Screenshots & Demo

(Screenshots and demo videos will be added to showcase ETL workflow and execution)
---

## Note

This repository contains documentation and QA artifacts only.

ETL design files (.ktr/.kjb) are intentionally not included to maintain project integrity and ownership.

---

## Future Enhancements (Phase 2)

- Automation using Python
- SQL-based validation scripts
- CI/CD pipeline integration

---

## Author

Harikrishnaveni
