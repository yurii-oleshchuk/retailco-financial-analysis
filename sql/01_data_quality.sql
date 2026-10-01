-- RetailCo Finance & Procurement Controlling
-- DE/EN: Data quality + business reconciliation checks / Datenqualität + Business-Reconciliation

-- 1) Duplicate purchase order IDs
SELECT PO_ID, COUNT(*) AS row_count
FROM purchase_orders
GROUP BY PO_ID
HAVING COUNT(*) > 1;

-- 2) Missing supplier IDs
SELECT COUNT(*) AS missing_supplier_ids
FROM purchase_orders
WHERE Supplier_ID IS NULL OR TRIM(Supplier_ID) = '';

-- 3) Invalid quantities
SELECT COUNT(*) AS invalid_quantities
FROM purchase_orders
WHERE Quantity <= 0;

-- 4) Missing / invalid prices
SELECT COUNT(*) AS invalid_prices
FROM purchase_orders
WHERE Actual_Unit_Price <= 0
   OR Planned_Unit_Price <= 0;

-- 5) Invalid dates
SELECT COUNT(*) AS invalid_dates
FROM purchase_orders
WHERE PO_Date IS NULL;

-- 6) Actual spend reconciliation
-- Business rule: Actual_Spend = Quantity * Actual_Unit_Price
SELECT COUNT(*) AS actual_spend_mismatches
FROM purchase_orders
WHERE ABS(Actual_Spend - (Quantity * Actual_Unit_Price)) > 0.01;

-- 7) Planned spend reconciliation
-- Business rule: Planned_Spend = Quantity * Planned_Unit_Price
SELECT COUNT(*) AS planned_spend_mismatches
FROM purchase_orders
WHERE ABS(Planned_Spend - (Quantity * Planned_Unit_Price)) > 0.01;

-- 8) PPV reconciliation
-- Business rule: PPV = Actual_Spend - Planned_Spend
SELECT COUNT(*) AS ppv_mismatches
FROM purchase_orders
WHERE ABS(PPV - (Actual_Spend - Planned_Spend)) > 0.01;

-- 9) PPV percentage reconciliation
-- Business rule: PPV_Pct = PPV / Planned_Spend
SELECT COUNT(*) AS ppv_pct_mismatches
FROM purchase_orders
WHERE Planned_Spend = 0
   OR ABS(PPV_Pct - (PPV / Planned_Spend)) > 0.0001;

-- 10) Year reconciliation
SELECT COUNT(*) AS year_mismatches
FROM purchase_orders
WHERE CAST(strftime('%Y', PO_Date) AS INTEGER) <> Year;

-- 11) Month reconciliation
SELECT COUNT(*) AS month_mismatches
FROM purchase_orders
WHERE CAST(strftime('%m', PO_Date) AS INTEGER) <> Month;

-- 12) Year-Month reconciliation
SELECT COUNT(*) AS year_month_mismatches
FROM purchase_orders
WHERE Year_Month <> strftime('%Y-%m', PO_Date);

-- 13) Negative / impossible spend values
SELECT COUNT(*) AS invalid_spend_values
FROM purchase_orders
WHERE Actual_Spend <= 0
   OR Planned_Spend <= 0;
