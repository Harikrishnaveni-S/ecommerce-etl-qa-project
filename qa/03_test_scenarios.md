# Test Scenarios (BDD Style) – E-Commerce ETL Pipeline

## 1. Introduction

This document defines high-level test scenarios in BDD (Behavior Driven Development) format. These scenarios are derived from business requirements and validate the end-to-end ETL pipeline.

---

## 2. Scenarios

### TS_01: Data Extraction from Multiple Sources

**Given** data is available in source systems (Shopify and Amazon)  
**When** the ETL process is triggered  
**Then** all new and updated records should be extracted into the staging layer  

---

### TS_02: Incremental Data Processing

**Given** previous ETL run timestamp is available  
**When** the ETL process executes  
**Then** only records newer than the last run should be processed  

---

### TS_03: Data Transformation and Cleaning

**Given** raw data is available in the staging layer  
**When** transformation logic is applied  
**Then** data should be cleaned, standardized, and derived fields should be calculated correctly  

---

### TS_04: Data Validation and Error Handling

**Given** records contain invalid or missing values  
**When** validation rules are applied  
**Then** invalid records should be rejected and logged with appropriate error reasons  

---

### TS_05: Data Warehouse Loading

**Given** clean and valid data is available  
**When** data is loaded into the data warehouse  
**Then** dimension and fact tables should be populated correctly without duplication  

---

### TS_06: End-to-End ETL Execution

**Given** the ETL pipeline is configured  
**When** the full ETL job is executed  
**Then** data should flow from source to data warehouse accurately and consistently without data loss  
