-- RetailCo Finance & Procurement Controlling
-- DE/EN: Core procurement KPIs / Zentrale Einkaufs-KPIs

SELECT
    SUM(Quantity * Actual_Unit_Price) AS purchase_spend,
    SUM(Quantity * Planned_Unit_Price) AS planned_spend,
    SUM(Quantity * (Actual_Unit_Price - Planned_Unit_Price)) AS purchase_price_variance,
    COUNT(DISTINCT Supplier_ID) AS supplier_count,
    COUNT(DISTINCT PO_ID) AS purchase_order_count,
    AVG(Quantity * Actual_Unit_Price) AS average_po_value
FROM purchase_orders;

-- Monthly reporting view
SELECT
    SUBSTR(PO_Date, 1, 7) AS year_month,
    SUM(Quantity * Actual_Unit_Price) AS purchase_spend,
    SUM(Quantity * Planned_Unit_Price) AS planned_spend,
    SUM(Quantity * (Actual_Unit_Price - Planned_Unit_Price)) AS ppv
FROM purchase_orders
GROUP BY SUBSTR(PO_Date, 1, 7)
ORDER BY year_month;
