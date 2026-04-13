-- ========================================
-- SOURCE vs STAGING COUNT VALIDATION
-- ========================================
SELECT COUNT(*) AS source_count 
FROM source_db.shopify_orders;

SELECT COUNT(*) AS staging_count 
FROM staging_db.staging_orders 
WHERE source = 'SHOPIFY';

-- ========================================
-- DUPLICATE CHECK (STAGING)
-- ========================================
SELECT order_id, source, COUNT(*) 
FROM staging_db.staging_orders
GROUP BY order_id, source
HAVING COUNT(*) > 1;

-- ========================================
-- NULL CHECK (CLEAN LAYER)
-- ========================================
SELECT * 
FROM staging_db.stg_clean_orders
WHERE order_id IS NULL;

-- ========================================
-- INVALID DATA CHECK
-- ========================================
SELECT * 
FROM staging_db.stg_clean_orders
WHERE quantity <= 0 OR price <= 0;

-- ========================================
-- FACT vs CLEAN COUNT VALIDATION
-- ========================================
SELECT COUNT(*) AS clean_count 
FROM staging_db.stg_clean_orders;

SELECT COUNT(*) AS fact_count 
FROM dw_db.fact_sales;

-- ========================================
-- REFERENTIAL INTEGRITY CHECK
-- ========================================
SELECT f.*
FROM dw_db.fact_sales f
LEFT JOIN dw_db.dim_product p 
    ON f.product_key = p.product_key
WHERE p.product_key IS NULL;

-- ========================================
-- ERROR TABLE VALIDATION
-- ========================================
SELECT * 
FROM dw_db.etl_error_orders;
