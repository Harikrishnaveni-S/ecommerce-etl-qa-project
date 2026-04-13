# Test Cases – E-Commerce ETL Pipeline

## 1. Source Layer Validation

| TC ID | Scenario | Description | Validation | Expected Result |
|------|----------|-------------|------------|-----------------|
| TC_01 | TS_01 | Validate Shopify data extraction | Compare source vs staging count | Counts should match |
| TC_02 | TS_01 | Validate Amazon CSV ingestion | CSV vs staging count | Counts should match |
| TC_03 | TS_02 | Validate incremental load | Check last_updated filter | Only new records loaded |
| TC_04 | TS_01 | Validate source tagging | Check source column | Correct source assigned |
| TC_05 | TS_01 | Validate extracted timestamp | Check extracted_at field | Timestamp should be populated |

---

## 2. Transformation Layer Validation

| TC ID | Scenario | Description | Validation | Expected Result |
|------|----------|-------------|------------|-----------------|
| TC_06 | TS_03 | Validate data type standardization | Check schema consistency | Correct data types |
| TC_07 | TS_03 | Validate trimming of text fields | Compare raw vs clean | No leading/trailing spaces |
| TC_08 | TS_03 | Validate casing rules | Check transformations | Standardized casing |
| TC_09 | TS_03 | Validate total_price calculation | price * quantity | Correct calculation |
| TC_10 | TS_04 | Validate filtering of invalid quantity | quantity <= 0 | Records rejected |
| TC_11 | TS_04 | Validate filtering of invalid price | price <= 0 | Records rejected |
| TC_12 | TS_04 | Validate null order_id handling | order_id is null | Records rejected |

---

## 3. Deduplication & Data Quality

| TC ID | Scenario | Description | Validation | Expected Result |
|------|----------|-------------|------------|-----------------|
| TC_13 | TS_03 | Validate duplicate removal | Check duplicate order_id + source | Only latest record retained |
| TC_14 | TS_03 | Validate latest record retention | Compare last_updated | Most recent record kept |

---

## 4. Data Warehouse – Dimension Validation

| TC ID | Scenario | Description | Validation | Expected Result |
|------|----------|-------------|------------|-----------------|
| TC_15 | TS_05 | Validate product dimension load | Check unique product records | No duplicates |
| TC_16 | TS_05 | Validate product updates | Modify product name | Updated correctly |
| TC_17 | TS_05 | Validate customer dimension load | Check customer entries | Records inserted correctly |
| TC_18 | TS_05 | Validate null customer handling | Null values | Default values assigned |

---

## 5. Data Warehouse – Fact Validation

| TC ID | Scenario | Description | Validation | Expected Result |
|------|----------|-------------|------------|-----------------|
| TC_19 | TS_05 | Validate fact table load | Compare clean vs fact count | All valid records loaded |
| TC_20 | TS_05 | Validate surrogate key mapping | Check keys | Keys populated correctly |
| TC_21 | TS_05 | Validate referential integrity | Join with dimensions | No orphan records |

---

## 6. Error Handling Validation

| TC ID | Scenario | Description | Validation | Expected Result |
|------|----------|-------------|------------|-----------------|
| TC_22 | TS_04 | Validate rejection of invalid records | Check error table | Invalid records present |
| TC_23 | TS_04 | Validate error reason logging | Check error_reason | Correct reason captured |

---

## 7. ETL Behavior & Edge Cases

| TC ID | Scenario | Description | Validation | Expected Result |
|------|----------|-------------|------------|-----------------|
| TC_24 | TS_06 | Validate idempotency (re-run) | Re-run ETL job | No duplicate records |
| TC_25 | TS_02 | Validate incremental updates | Update existing record | Changes reflected correctly |

---

## Notes

- All validations are performed using SQL queries
- Test cases are mapped to high-level BDD scenarios
- Covers full ETL lifecycle (Source → Staging → Data Warehouse)
