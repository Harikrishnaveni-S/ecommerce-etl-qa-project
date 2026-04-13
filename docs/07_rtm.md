# 07_rtm.md (Requirement Traceability Matrix)

## Objective
To establish traceability between business requirements, test scenarios, test cases, and identified defects, ensuring complete test coverage of the ETL pipeline.

---

## RTM Summary

| Metric | Count |
|--------|------|
| Total Requirements | 6 |
| Total Scenarios | 6 |
| Total Test Cases | 25 |
| Total Defects | 7 |
| Coverage | 100% |

---

## Requirement Traceability Matrix

| Req ID | Requirement Description | Scenario ID | Test Case ID(s) | Defect ID(s) |
|--------|------------------------|------------|------------------|--------------|
| RQ_01 | Extract data from Shopify and Amazon sources | TS_01 | TC_01, TC_02, TC_04, TC_05 | DEF_001 |
| RQ_02 | Support incremental data extraction using last_updated | TS_02 | TC_03, TC_25 | DEF_002, DEF_007 |
| RQ_03 | Perform data transformation and cleaning | TS_03 | TC_06, TC_07, TC_08, TC_09 | DEF_003 |
| RQ_04 | Validate data and handle invalid records | TS_04 | TC_10, TC_11, TC_12, TC_22, TC_23 | DEF_006 |
| RQ_05 | Load data into Data Warehouse (dimensions & fact) | TS_05 | TC_15, TC_16, TC_17, TC_18, TC_19, TC_20, TC_21 | DEF_005 |
| RQ_06 | Ensure end-to-end ETL execution and data consistency | TS_06 | TC_24 | DEF_002 |

---

## Coverage Analysis

### Requirement Coverage
- All business requirements are mapped to at least one test case
- No requirement is left untested

### Test Case Coverage
- Each test case is linked to a scenario and requirement
- Ensures structured validation across ETL layers

### Defect Mapping Insights
- Multiple defects mapped to **incremental logic (RQ_02)**
- Critical defects linked to:
  - Incremental processing (DEF_002)
  - Deduplication (DEF_004 indirectly via TS_03)
  - Fact loading (DEF_005)

---

## Key Observations

- **RQ_02 (Incremental Load)** is the most defect-prone area
- **RQ_03 (Transformation)** has precision-related issues
- **RQ_05 (DW Loading)** shows data consistency gaps
- Error handling (RQ_04) needs improvement for traceability

---

## Traceability Benefits

This RTM ensures:

- ✔ Full visibility of test coverage  
- ✔ Easy impact analysis of defects  
- ✔ Clear linkage between requirements and validation  
- ✔ Improved audit readiness  

---

## Conclusion

The RTM confirms that:

- All requirements are **fully validated**
- Defects are **properly traceable**
- Testing process is **systematic and complete**

👉 This ensures high confidence in identifying gaps before production deployment.
