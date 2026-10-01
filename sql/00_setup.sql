-- RetailCo Finance & Procurement Controlling
-- DE: Setup / Schema — nur zur Referenz. Die lauffähige Datenbank `retailco.db`
--     ist bereits im Repo enthalten und mit `purchase_orders.csv` befüllt; dieses
--     Skript muss NICHT ausgeführt werden, um 01–03 zu testen.
-- EN: Setup / schema — for reference only. The runnable database `retailco.db`
--     is already included in the repo and pre-loaded from `purchase_orders.csv`;
--     you do NOT need to run this script to try 01–03.
--
-- Reproduce it from scratch (e.g. in the sqlite3 CLI):
--   sqlite3 retailco.db
--   .mode csv
--   .import --skip 1 ../data/procurement/purchase_orders.csv purchase_orders

CREATE TABLE IF NOT EXISTS purchase_orders (
    PO_ID               TEXT,
    PO_Date             TEXT,
    Supplier_ID         TEXT,
    Supplier_Name       TEXT,
    Category            TEXT,
    Product             TEXT,
    Quantity            INTEGER,
    Actual_Unit_Price   REAL,
    Planned_Unit_Price  REAL,
    Actual_Spend        REAL,
    Planned_Spend       REAL,
    PPV                 REAL,
    PPV_Pct             REAL,
    Year                INTEGER,
    Month               INTEGER,
    Year_Month          TEXT
);
