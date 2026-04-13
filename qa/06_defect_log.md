
# 06_defect_log.md

## Objective
To track and manage defects identified during ETL testing, including their severity, impact, root cause analysis, and current status.

---

## Defect Summary

| Severity | Count |
|----------|------|
| Critical | 2 |
| High | 3 |
| Medium | 2 |
| Low | 0 |
| Total | 7 |

---

## Defect Details

---

### DEF_001 – Amazon CSV Parsing Issue

| Field | Details |
|------|--------|
| Defect ID | DEF_001 |
| Title | Missing records during Amazon CSV ingestion |
| Severity | High |
| Priority | High |
| Status | Open |
| Test Case | TC_02 |
| Description | During CSV ingestion, 3 records were not loaded into `staging_orders`. |
| Expected Result | All records from CSV should be loaded into staging |
| Actual Result | 3 records missing after ingestion |
| Impact | Data loss at source ingestion stage |
| Root Cause (Suspected) | Incorrect delimiter or malformed rows in CSV file |
| Recommendation | Validate CSV format and configure correct delimiter/escape settings in Spoon |

---

### DEF_002 – Incremental Load Duplication Issue

| Field | Details |
|------|--------|
| Defect ID | DEF_002 |
| Title | Duplicate records generated during incremental load |
| Severity | Critical |
| Priority | High |
| Status | Open |
| Test Case | TC_03, TC_24 |
| Description | Incremental logic is loading duplicate records when ETL job is re-run |
| Expected Result | Only new/updated records should be loaded |
| Actual Result | Duplicate records created in staging and downstream tables |
| Impact | Data inconsistency and incorrect reporting |
| Root Cause (Suspected) | Improper handling of `last_updated` filter or control table logic |
| Recommendation | Ensure proper update of `last_run_time` and implement deduplication logic using composite keys |

---

### DEF_003 – total_price Calculation Issue

| Field | Details |
|------|--------|
| Defect ID | DEF_003 |
| Title | Incorrect rounding in total_price calculation |
| Severity | Medium |
| Priority | Medium |
| Status | Open |
| Test Case | TC_09 |
| Description | total_price shows rounding inconsistencies for decimal values |
| Expected Result | total_price = quantity * price with accurate precision |
| Actual Result | Minor rounding differences observed |
| Impact | Financial reporting inaccuracies |
| Root Cause (Suspected) | Data type mismatch or precision handling issue |
| Recommendation | Use consistent decimal precision (e.g., DECIMAL(10,2)) |

---

### DEF_004 – Deduplication Logic Failure

| Field | Details |
|------|--------|
| Defect ID | DEF_004 |
| Title | Duplicate records not removed correctly |
| Severity | Critical |
| Priority | High |
| Status | Open |
| Test Case | TC_13, TC_14 |
| Description | Sort + Unique step is not removing duplicates based on composite key |
| Expected Result | Only latest record per order_id + source retained |
| Actual Result | Duplicate records exist in clean layer |
| Impact | Incorrect aggregations and duplicate fact entries |
| Root Cause (Suspected) | Improper sort key or missing last_updated ordering |
| Recommendation | Include order_id + source + last_updated in sorting before deduplication |

---

### DEF_005 – Fact Table Missing Records

| Field | Details |
|------|--------|
| Defect ID | DEF_005 |
| Title | Missing records in fact_sales table |
| Severity | High |
| Priority | High |
| Status | Open |
| Test Case | TC_19 |
| Description | Some valid records from clean layer are not loaded into fact table |
| Expected Result | All valid records should be loaded into fact_sales |
| Actual Result | Record count mismatch between clean and fact tables |
| Impact | Incomplete reporting data |
| Root Cause (Suspected) | Lookup failure for foreign keys or join mismatch |
| Recommendation | Validate lookup steps and ensure default handling for missing keys |

---

### DEF_006 – Missing Error Reason Logging

| Field | Details |
|------|--------|
| Defect ID | DEF_006 |
| Title | error_reason not populated for some rejected records |
| Severity | Medium |
| Priority | Medium |
| Status | Open |
| Test Case | TC_23 |
| Description | Some records in `etl_error_orders` do not have error_reason populated |
| Expected Result | All rejected records should have a valid error_reason |
| Actual Result | error_reason is NULL for some records |
| Impact | Difficult to trace data issues |
| Root Cause (Suspected) | Missing mapping in error handling step |
| Recommendation | Ensure all rejection paths populate error_reason field |

---

### DEF_007 – Incremental Update Miss Issue

| Field | Details |
|------|--------|
| Defect ID | DEF_007 |
| Title | Updates to existing records not reflected |
| Severity | High |
| Priority | Medium |
| Status | Open |
| Test Case | TC_25 |
| Description | Updated records in source are not properly reflected in downstream tables |
| Expected Result | Updated records should overwrite existing data |
| Actual Result | Old data persists in clean and fact tables |
| Impact | Stale data in reporting |
| Root Cause (Suspected) | Missing update logic in transformation or load step |
| Recommendation | Implement proper Insert/Update strategy in transformations |

---

## Defect Status Lifecycle

| Status | Description |
|--------|------------|
| Open | Defect identified but not yet fixed |
| In Progress | Fix is being implemented |
| Fixed | Code fix completed |
| Retested | Verified after fix |
| Closed | Defect resolved successfully |

---

## Observations

- Majority of defects are related to **incremental processing and deduplication**
- Critical defects impact **data accuracy and reporting reliability**
- Error handling needs improvement for better traceability

---

## Conclusion

The defects identified are **typical for ETL pipelines in early stages** and highlight:

- Gaps in incremental logic
- Weakness in deduplication strategy
- Need for improved error handling

Fixing these will significantly improve pipeline robustness and production readiness.
