# SQL — Quick Start / Schnellstart

## DE
Die Datei **`retailco.db`** (SQLite) liegt bereits fertig befüllt in diesem Ordner —
geladen aus `data/procurement/purchase_orders.csv` (900 Bestellzeilen). Es ist
**kein Setup nötig**, um `01_data_quality.sql`, `02_procurement_kpis.sql` und
`03_supplier_analysis.sql` sofort auszuführen und die Ergebnisse zu sehen.

## EN
**`retailco.db`** (SQLite) is already included in this folder, pre-loaded from
`data/procurement/purchase_orders.csv` (900 purchase-order rows). **No setup is
required** to run `01_data_quality.sql`, `02_procurement_kpis.sql` and
`03_supplier_analysis.sql` immediately and see the results.

---

## Option A — sqlite3 command line / Kommandozeile

```bash
cd sql
sqlite3 -header -column retailco.db < 01_data_quality.sql
sqlite3 -header -column retailco.db < 02_procurement_kpis.sql
sqlite3 -header -column retailco.db < 03_supplier_analysis.sql
```

(Windows: [sqlite3.exe](https://www.sqlite.org/download.html) herunterladen /
download, dann derselbe Befehl im gleichen Ordner / same command in this folder.)

## Option B — DB Browser for SQLite (GUI, kein Terminal nötig / no terminal needed)

1. [DB Browser for SQLite](https://sqlitebrowser.org/) installieren / install.
2. `retailco.db` öffnen / open.
3. Tab **"Execute SQL"** → Inhalt einer `.sql`-Datei einfügen → **Run** (F5).

## Option C — Python (funktioniert überall, auch ohne SQLite-Installation)

```python
import sqlite3, pandas as pd

con = sqlite3.connect("retailco.db")
query = open("02_procurement_kpis.sql", encoding="utf-8").read().split(";")[0]
print(pd.read_sql(query, con))
```

## Option D — Jupyter-Demo mit bereits ausgeführten Outputs / with pre-run outputs

`../notebooks/05_sql_queries_demo.ipynb` führt alle drei Skripte gegen `retailco.db`
aus und zeigt die Ergebnisse direkt als Tabellen — auch ohne eigene SQL-Umgebung
lesbar (z. B. direkt auf GitHub). / Runs all three scripts against `retailco.db`
and displays the results as tables directly — readable even without a local SQL
setup (e.g. directly on GitHub).

---

## Struktur / Structure

| File | Purpose |
|---|---|
| `00_setup.sql` | Schema reference only — `retailco.db` is already built, no need to run this |
| `01_data_quality.sql` | Critical data-quality and business-reconciliation checks / Datenqualitäts- und Business-Reconciliation-Prüfungen |
| `02_procurement_kpis.sql` | Core procurement KPIs + monthly trend / Einkaufs-KPIs + Monatstrend |
| `03_supplier_analysis.sql` | Supplier & category analysis / Lieferanten- & Warengruppenanalyse |
| `retailco.db` | Ready-to-query SQLite database, pre-loaded from `purchase_orders.csv` |

**DE:** `retailco.db` ist eine statische Momentaufnahme aus `purchase_orders.csv`
(Portfolio-Synthetikdaten, kein SAP-System). Bei Änderungen an den Rohdaten muss
die DB neu erzeugt werden (siehe `00_setup.sql`).

**EN:** `retailco.db` is a static snapshot of `purchase_orders.csv` (synthetic
portfolio data, not a SAP system). If the raw data changes, the DB must be
regenerated (see `00_setup.sql`).
