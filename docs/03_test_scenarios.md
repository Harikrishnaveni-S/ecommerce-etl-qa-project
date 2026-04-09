# Test Scenarios – E-Commerce ETL Pipeline

## 1. Introduction

This document defines high-level test scenarios to validate the ETL pipeline. These scenarios are derived from business requirements and cover all major functional areas of the system.

---

## 2. Source to Staging Scenarios

### TS_01: Validate data extraction from Shopify source
- Verify that all new and updated records are extracted correctly

---

### TS_02: Validate data extraction from Amazon source
- Verify that data from CSV is correctly ingested into staging

---

### TS_03: Validate incremental load logic
- Ensure only records newer than last run are processed

---

### TS_04: Validate source identification
- Verify that each record is tagged with correct source (Shopify/Amazon)

---

### TS_05: Validate extraction timestamp
- Ensure extracted records contain system-generated timestamp

---

## 3. Staging to Clean Layer Scenarios

### TS_06: Validate data type standardization
- Ensure data types are consistent across all fields

---

### TS_07: Validate data cleaning logic
- Verify trimming, casing, and formatting of text fields

---

### TS_08: Validate derived field calculation
- Ensure total_price is calculated correctly

---

### TS_09: Validate data filtering rules
- Ensure invalid records (quantity <= 0, price <= 0, null order_id) are filtered

---

### TS_10: Validate error handling
- Verify invalid records are stored in error table with proper reason

---

### TS_11: Validate deduplication logic
- Ensure duplicate records are removed based on order_id and source

---

## 4. Clean Layer to Data Warehouse Scenarios

### TS_12: Validate product dimension load
- Ensure unique product records are inserted/updated correctly

---

### TS_13: Validate customer dimension load
- Ensure customer records are handled correctly including null/default values

---

### TS_14: Validate fact table load
- Ensure valid records are loaded into fact table

---

### TS_15: Validate surrogate key mapping
- Ensure product_key and customer_key are correctly assigned

---

### TS_16: Validate referential integrity
- Ensure fact records have valid dimension references

---

## 5. Error Handling Scenarios

### TS_17: Validate rejection of invalid records
- Ensure records failing validation are not loaded into fact table

---

### TS_18: Validate error logging
- Ensure error records contain correct error reason

---

## 6. End-to-End Scenarios

### TS_19: Validate complete ETL workflow
- Ensure data flows correctly from source to data warehouse

---

### TS_20: Validate re-run (idempotency)
- Ensure re-running ETL does not create duplicates

---

### TS_21: Validate incremental updates
- Ensure updated records are processed correctly

---

## 7. Edge Case Scenarios

### TS_22: Validate handling of null values
- Ensure null values are handled as per business rules

---

### TS_23: Validate mixed data formats
- Ensure system handles variations in input formats

---

### TS_24: Validate late-arriving data
- Ensure delayed updates are processed correctly
