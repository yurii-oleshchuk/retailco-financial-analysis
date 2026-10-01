# RetailCo Finance & Procurement Controlling
### Bilingual Portfolio Project | Zweisprachiges Portfolio-Projekt — Accounting, Controlling, Einkauf & BI

## 🇩🇪 Deutsch
Dieses Portfolio-Projekt zeigt einen durchgängigen Reporting- und Controlling-Prozess auf Basis eines Retail-Transaktionsdatensatzes. Der Schwerpunkt liegt auf **Accounting, Controlling, Forecasting, Einkaufsanalyse, Datenqualität, SQL und Power BI**.

Das Projekt besteht aus zwei klar getrennten Datenströmen:

- **Finance / Sales:** Umsatz, COGS, Bruttoergebnis, Plan-Ist-Vergleich und Forecast
- **Procurement / Einkauf:** synthetische Bestellungen, Einkaufsvolumen, Lieferantenanalyse und Einkaufspreisabweichung

**Wichtig:** Die Procurement-Daten sind synthetische Portfolio-Daten. 

## 🇬🇧 English
This portfolio project demonstrates an end-to-end reporting and controlling process based on a retail transaction dataset. The focus is on **accounting, controlling, forecasting, procurement analysis, data quality, SQL and Power BI**.

The project contains two clearly separated data streams:

- **Finance / Sales:** revenue, COGS, gross profit, plan-vs-actual analysis and forecasting
- **Procurement / Purchasing:** synthetic purchase orders, purchase spend, supplier analysis and purchase price variance

**Important:** The procurement data are synthetic portfolio data. 

---

## 🛠️ Tech Stack / Technologie

| Tool | DE | EN |
|---|---|---|
| Python / pandas | Datenvorbereitung & Analyse | Data preparation & analysis |
| SQL | Einkaufs-KPIs & Datenqualität | Procurement KPIs & data quality |
| Excel | Closing & Controlling | Closing & controlling |
| Power BI | Reporting & Dashboarding | Reporting & dashboards |
| Jupyter | Dokumentierter Analyseprozess | Documented analysis process |

---

## 📁 Project Structure / Projektstruktur

```text
Retailco-finance-procurement-controlling/
│
├── data/
│   ├── raw/
│   ├── processed/
│   └── procurement/
│       ├── purchase_orders.csv
│       ├── data_quality_report.csv
│       ├── supplier_analysis.csv
│       ├── category_analysis.csv
│       ├── monthly_procurement.csv
│       ├── pbi_fact_procurement.csv
│       ├── pbi_dim_supplier.csv
│       └── pbi_dim_procurement_category.csv
│
├── notebooks/
│   ├── 00_data_preparation.ipynb
│   ├── 01_accounting_closing.ipynb
│   ├── 02_controlling_plan_ist.ipynb
│   ├── 03_data_export_powerbi.ipynb
│   ├── 04_procurement_analysis.ipynb
│   └── 05_sql_queries_demo.ipynb      ← SQL-Skripte live ausgeführt / SQL scripts executed live
│
├── sql/
│   ├── README.md                      ← Quick Start, kein Setup nötig / no setup required
│   ├── 00_setup.sql                   ← Schema-Referenz / schema reference
│   ├── 01_data_quality.sql
│   ├── 02_procurement_kpis.sql
│   ├── 03_supplier_analysis.sql
│   └── retailco.db                    ← lauffähige SQLite-DB, vorbefüllt / ready-to-run, pre-loaded
│
├── excel/
│   └── closing_checklist.xlsx
│
├── dashboard/
│   ├── dashboard.pbix
│   ├── dashboard.pdf                  ← PDF-Export des PBIX (4 Seiten) / PDF export of the PBIX (4 pages)
│   └── interactive_board.html         ← interaktives HTML-Board / interactive HTML board
│
└── docs/
    └── management_summary_final_de_en.pdf

```

---

# 1. Business Questions / Geschäftsfragen

### Finance / Finanzen
- How did revenue and gross margin develop? / Wie haben sich Umsatz und Bruttomarge entwickelt?
- How does actual revenue compare with the illustrative plan? / Wie liegt der Ist-Umsatz gegenüber dem illustrativen Plan?

### Procurement / Einkauf
- What is total purchase spend? / Wie hoch ist das Einkaufsvolumen?
- Which suppliers and categories concentrate spend? / Bei welchen Lieferanten und Warengruppen konzentriert sich das Einkaufsvolumen?
- Where do purchase price variances occur? / Wo entstehen Einkaufspreisabweichungen?

### Forecast / Prognose
- What is the expected full-year result based only on information available through September 2015? / Wie lautet die Jahresprognose auf Basis der bis September verfügbaren Ist-Daten?

### Data Quality / Datenqualität
- Are the reporting data complete and internally consistent? / Sind die Reporting-Daten vollständig und konsistent?

---

# 2. Finance & Accounting / Finanzen & Accounting

The existing finance module covers monthly P&L, closing checks, reconciliation and illustrative accrual adjustments.

**2015 core results:**

| KPI | Value / Wert |
|---|---:|
| Revenue / Umsatz | **$20.024M** |
| COGS | **$12.495M** |
| Gross Profit / Bruttoergebnis | **$7.529M** |
| Gross Margin / Bruttomarge | **37.6%** |
| Revenue vs Synthetic Plan / Umsatz vs. Synthetic Plan | **+$11.7K / +0.06%** |

The plan is an **illustrative synthetic benchmark**, not a historical management budget.

---

# 3. Controlling / Controlling

- Actual vs Synthetic Plan / Ist vs. Synthetic Plan
- Revenue variance by category / Umsatzabweichung nach Warengruppe
- Contribution margin / Deckungsbeitrag
- Country and category analysis / Länder- und Warengruppenanalyse

A price-volume-mix bridge is deliberately **not** claimed because the source data do not provide an independent planned quantity and planned price.

---

# 4. Forecasting / Forecasting

The September 2015 forecast uses only information that would have been available at that point: **Jan–Sep 2015 actuals** plus complete **2013 seasonality**.

- FY Forecast / Jahresprognose: **$20.669M**
- vs Synthetic Plan: **+3.28%**
- Retrospective Q4 backtest error: approximately **+7.0%**

This is a **seasonal benchmark forecast**, not a production-grade forecasting model.

2014 and 2016 contain January–July only and are therefore not treated as full-year comparators.

---

# 5. Procurement / Einkauf

The procurement module is intentionally small and transparent. It uses a synthetic portfolio dataset with purchase orders, suppliers, categories, quantities, actual prices and planned reference prices.

### Procurement KPIs / Einkaufs-KPIs

- Purchase Spend / Einkaufsvolumen
- Planned Spend / Geplantes Einkaufsvolumen
- Purchase Price Variance (PPV) / Einkaufspreisabweichung
- Suppliers / Lieferanten
- Purchase Orders / Bestellungen
- Average PO Value / Durchschnittlicher Bestellwert

### PPV definition / PPV-Definition

`PPV = Actual Spend − Planned Spend`

Positive PPV means actual purchase prices were above plan.
Positive PPV bedeutet, dass die tatsächlichen Einkaufspreise über Plan lagen.

The procurement data are **synthetic** and do not represent SAP or a real company procurement system.

---

# 6. SQL & Data Quality / SQL & Datenqualität

Three SQL examples are included:

1. `01_data_quality.sql` — critical data-quality checks
2. `02_procurement_kpis.sql` — procurement KPI calculation
3. `03_supplier_analysis.sql` — supplier and category analysis

The supplied synthetic procurement dataset passes all critical checks.

**Run it immediately / Sofort lauffähig:** `sql/retailco.db` is a SQLite database
already loaded from `purchase_orders.csv` — no setup step is required. Run any
script directly, e.g.:

```bash
cd sql
sqlite3 -header -column retailco.db < 02_procurement_kpis.sql
```

See `sql/README.md` for command-line, GUI (DB Browser for SQLite) and Python
options, or open `notebooks/05_sql_queries_demo.ipynb`, which runs all three
scripts against `retailco.db` with outputs already saved in the notebook.

---

# 7. Power BI / Power BI Dashboard

Das Power-BI-Dashboard (`dashboard/dashboard.pbix`) besteht aus vier Seiten. / The Power BI dashboard (`dashboard/dashboard.pbix`) consists of four pages:

1. **Management Overview / Management-Übersicht**
2. **Controlling / Controlling-Analyse**
3. **Forecast / Prognose**
4. **Procurement Controlling / Einkaufscontrolling**

Die Standardansicht ist **2015 / Alle Länder / Alle Warengruppen**. Die Procurement-Daten sind ein separater synthetischer 2015-Datenstrom und erben die Finance-Slicer nicht.

The default management view is **2015 / All Countries / All Categories**. Procurement is a separate synthetic 2015 data stream and does not inherit the Finance slicers.

**Hinweise zur Lesbarkeit / Reading notes:**

- 2014 und 2016 enthalten nur Januar–Juli und sind keine Volljahresvergleiche. / 2014 and 2016 contain January–July only and are not full-year comparators.
- Der FY-Forecast ist ein Gesamtunternehmens-Benchmark für FY2015, keine Prognose je Land oder Warengruppe. / The FY forecast is a FY2015 total-company benchmark, not a country- or category-level forecast.
- „Contribution Margin I / Deckungsbeitrag I“ = Umsatz minus variable Kosten. / Contribution Margin I = revenue minus variable costs.

`dashboard/dashboard.pdf` ist der PDF-Export des PBIX (Standardansicht 2015 / All / All). / `dashboard/dashboard.pdf` is the PDF export of the PBIX (default view 2015 / All / All).

---

# 7a. Interactive HTML Board / Interaktives HTML-Board

`dashboard/interactive_board.html` is a self-contained, browser-based board built
directly from this project's CSV outputs (Chart.js, no server, no install). It
complements the Power BI model for quick, dependency-free distribution to
stakeholders and covers the same four areas — Finance, Variance, Forecast and
Procurement — with fiscal-year, country, and category filters.

`dashboard/interactive_board.html` ist ein eigenständiges, browserbasiertes Board
auf Basis der CSV-Outputs dieses Projekts (Chart.js, kein Server, keine
Installation nötig). Es ergänzt das Power-BI-Modell für den schnellen, ohne
Zusatzsoftware nutzbaren Versand an Stakeholder und deckt dieselben vier
Bereiche ab — Finance, Abweichung, Forecast und Procurement — mit Filtern
für Geschäftsjahr, Land und Warengruppe.

Open it directly in any browser (double-click, or `open dashboard/interactive_board.html`) —
an internet connection is only needed to load the Chart.js library from a CDN.

---

# 8. Management Reporting / Management Reporting

The final management view should contain a small number of decision-relevant KPIs and three factual insights. The project deliberately avoids unnecessary complexity.

---

# 9. Methodological Notes / Methodische Hinweise

- **Synthetic plan:** derived from actual transaction data; not an independent historical budget.
- **Incomplete years:** 2014 and 2016 contain January–July only.
- **Accrual assumptions:** 5% revenue and 3% costs are illustrative portfolio assumptions.
- **Forecast:** seasonal benchmark based on complete 2013 seasonality and Jan–Sep 2015 actuals.
- **Procurement:** synthetic portfolio data;
- **Price/volume bridge:** not presented because planned quantity and planned price are not available in the original sales data.

---

# 10. Setup / Ausführung

```bash
pip install pandas numpy matplotlib openpyxl jupyter
jupyter notebook notebooks/
```

For the original finance analysis, the source dataset is required under `data/raw/bike_sales.csv`.
The procurement module is already self-contained and can be analyzed from `data/procurement/purchase_orders.csv`.

Recommended notebook order / Empfohlene Reihenfolge:

```text
00_data_preparation.ipynb
01_accounting_closing.ipynb
02_controlling_plan_ist.ipynb
03_data_export_powerbi.ipynb
04_procurement_analysis.ipynb
```

---

## Author / Autor

Yurii Oleshchuk

## License / Lizenz

Portfolio project. The original retail dataset remains subject to its source license.

*Python · SQL · Excel · Power BI | Python · SQL · Excel · Power BI*
