-- RetailCo Finance & Procurement Controlling
-- DE/EN: Supplier analysis / Lieferantenanalyse

SELECT
    Supplier_ID,
    Supplier_Name,
    SUM(Quantity * Actual_Unit_Price) AS purchase_spend,
    SUM(Quantity * Planned_Unit_Price) AS planned_spend,
    SUM(Quantity * (Actual_Unit_Price - Planned_Unit_Price)) AS ppv,
    COUNT(DISTINCT PO_ID) AS purchase_orders
FROM purchase_orders
GROUP BY Supplier_ID, Supplier_Name
ORDER BY purchase_spend DESC;

-- Category analysis
SELECT
    Category,
    SUM(Quantity * Actual_Unit_Price) AS purchase_spend,
    SUM(Quantity * Planned_Unit_Price) AS planned_spend,
    SUM(Quantity * (Actual_Unit_Price - Planned_Unit_Price)) AS ppv
FROM purchase_orders
GROUP BY Category
ORDER BY purchase_spend DESC;
