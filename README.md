# RetailCo Financial Analysis
### Portfolioprojekt | Portfolio Project — Accounting & Controlling

<br>

**DE:** Dieses Projekt demonstriert praxisnahe Fähigkeiten in Accounting und Controlling
auf Basis eines realen Einzelhandelsdatensatzes (Bike Sales, 2011–2016, 113.036 Transaktionen).
Es umfasst den vollständigen Finanzanalyseprozess — von der Datenvorbereitung über
Monatsabschluss und Plan-Ist-Vergleich bis hin zum interaktiven Power BI Dashboard.

**EN:** This project demonstrates hands-on skills in Accounting and Controlling
based on a real retail dataset (Bike Sales, 2011–2016, 113,036 transactions).
It covers the complete financial analysis process — from data preparation through
monthly closing and budget vs. actual comparison to an interactive Power BI dashboard.

---

## 🛠️ Tech Stack

| Tool | Zweck / Purpose |
|---|---|
| **Python** (pandas, numpy, matplotlib) | Datenvorbereitung, Analyse, Visualisierung / Data prep, analysis, visualization |
| **Jupyter Notebook** | Dokumentierter Analyseprozess / Documented analysis process |
| **Excel** (openpyxl, Power Query) | Monatsabschluss, Closing Checklist, SUMIFS / Monthly closing, checklist, formulas |
| **Power BI** | Interaktives Dashboard / Interactive dashboard |
| **GitHub** | Versionskontrolle & Portfolio / Version control & portfolio |

---

## 📁 Projektstruktur / Project Structure

```
retailco-financial-analysis/
│
├── 📓 notebooks/
│   ├── 00_data_preparation.ipynb       ← Datenvorbereitung / Data preparation
│   ├── 01_accounting_closing.ipynb     ← Monatsabschluss / Monthly closing
│   ├── 02_controlling_plan_ist.ipynb   ← Plan-Ist-Vergleich / Budget vs. Actual
│   └── 03_data_export_powerbi.ipynb    ← Datenexport für Power BI / Data export
│
├── 📊 excel/
│   └── closing_checklist.xlsx          ← Closing Checklist + GuV + KPI Dashboard
│
├── 📈 dashboard/
│   └── retailco_dashboard.pbix         ← Power BI Dashboard (3 Seiten / pages)
│
├── 📂 data/
│   ├── raw/                            ← Originaldatensatz / Original dataset
│   └── processed/                      ← Aufbereitete Daten / Processed data
│
└── 📄 docs/
    └── management_summary.pdf          ← Management Summary (DE + EN)
```

---

## 📋 Module / Modules

### Modul 0 — Datenvorbereitung / Data Preparation
`00_data_preparation.ipynb`

**DE:**
- Laden und Bereinigen des Rohdatensatzes (113.036 Transaktionen)
- Datenqualitätsprüfung: fehlende Werte, Duplikate, Ausreißer
- Feature Engineering: `year_month`, `quarter`, `gross_margin_pct`, `land_de`
- Simulation von Planwerten: `revenue_plan = revenue × (1 ± 12%)`

**EN:**
- Loading and cleaning the raw dataset (113,036 transactions)
- Data quality check: missing values, duplicates, outliers
- Feature engineering: `year_month`, `quarter`, `gross_margin_pct`, `land_de`
- Simulation of budget values: `revenue_plan = revenue × (1 ± 12%)`

---

### Modul 1 — Accounting / Monatsabschluss
`01_accounting_closing.ipynb` | `closing_checklist.xlsx`

**DE:**
- Monatliche Gewinn- und Verlustrechnung (GuV): Umsatz → COGS → Bruttoergebnis
- Rechnungsabgrenzungsposten (ARAP/PRAP): 5% Umsatz / 3% Kosten
- Kontenabstimmung / Reconciliation: Transaktionssumme = aggregierter Monatswert
- Jahresabschluss 2011–2016 mit Wachstumsanalyse
- Excel Closing Checklist (9 Schritte, RAG-Status, DE + EN)

**EN:**
- Monthly P&L statement: Revenue → COGS → Gross Profit
- Accruals (ARAP/PRAP): 5% of revenue / 3% of costs
- Reconciliation: transaction total = aggregated monthly value
- Annual closing 2011–2016 with growth analysis
- Excel Closing Checklist (9 steps, RAG status, DE + EN)

**Excel-Datei enthält / Excel file contains:**

| Sheet | Inhalt / Content |
|---|---|
| ✅ Closing Checklist | 9-Schritte-Abschlussroutine mit Status / 9-step closing routine with status |
| 📊 Monthly P&L (GuV) | Monatliche GuV 2015 mit RAG-Farben / Monthly P&L 2015 with RAG colors |
| 📋 Annual Closing | Jahresabschluss 2011–2016 / Annual closing 2011–2016 |
| 📐 Accruals | ARAP/PRAP Berechnung / Accruals calculation |
| 🗃️ Raw Data | 300 Rohtransaktionen als Datenbasis / 300 raw transactions as data basis |
| 🧮 Excel Calculations | SUMIFS-Formeln — Python vs. Excel Vergleich / SUMIFS formulas — Python vs. Excel |
| 📊 KPI Dashboard | KPI-Tabelle + 4 Diagramme / KPI table + 4 charts |
| 📋 Plan-Ist Vergleich | Monatl. Budget vs. Actual mit RAG / Monthly budget vs. actual with RAG |
| 🧮 Deckungsbeitrag | DB I / DB II nach Kategorie & Land / CM I/II by category & country |
| 📈 Rolling Forecast | Ist + Forecast + Plan / Actual + Forecast + Budget |

---

### Modul 2 — Controlling / Plan-Ist-Vergleich
`02_controlling_plan_ist.ipynb`

**DE:**
- KPI-Dashboard: Umsatzwachstum YoY, Bruttomarge %, Plan-Abweichung %
- Plan-Ist-Vergleich mit RAG-Ampel (🟢 ≥+3% | 🟡 ±3% | 🔴 ≤-3%)
- Abweichungsanalyse: Preis- & Mengeneffekt nach Kategorie
- Deckungsbeitragsrechnung: DB I / DB II / DB-Quote % nach Kategorie & Land
- Länder- & Kategorienanalyse: gestapeltes Balkendiagramm, Margen-Trendlinie
- Rolling Forecast (Stand September 2015): Saisonalität aus 2013-Daten

**EN:**
- KPI Dashboard: Revenue growth YoY, gross margin %, budget variance %
- Budget vs. Actual with RAG traffic lights (🟢 ≥+3% | 🟡 ±3% | 🔴 ≤-3%)
- Variance analysis: price & volume effect by category
- Contribution margin analysis: CM I / CM II / CM rate % by category & country
- Country & category analysis: stacked bar chart, margin trend line
- Rolling Forecast (as of September 2015): seasonality from 2013 data

---

### Modul 3 — Power BI Dashboard
`03_data_export_powerbi.ipynb` | `retailco_dashboard.pbix`

**DE:**
- Aufbau eines Sternschemas (Star Schema) aus den Rohdaten
- 5 optimierte Tabellen für Power BI: Faktentabelle + 4 Dimensionstabellen
- DAX-Measures: Bruttomarge %, YoY-Wachstum, RAG-Status, Deckungsbeitragsquote
- 3 Dashboard-Seiten:
  - 📊 **KPI Overview** — Jahresübersicht mit Cards, Bar Chart, Matrix
  - 📋 **Plan-Ist-Vergleich** — Monatlicher Budget vs. Actual mit Waterfall Chart
  - 🧮 **Controlling Deep-Dive** — Deckungsbeitrag, Länderanalyse, Rolling Forecast

**EN:**
- Building a Star Schema from raw data
- 5 optimized tables for Power BI: fact table + 4 dimension tables
- DAX measures: gross margin %, YoY growth, RAG status, contribution margin rate
- 3 dashboard pages:
  - 📊 **KPI Overview** — Annual overview with cards, bar chart, matrix
  - 📋 **Budget vs. Actual** — Monthly comparison with waterfall chart
  - 🧮 **Controlling Deep-Dive** — Contribution margin, country analysis, rolling forecast

---

## 📊 Datensatz / Dataset

| | |
|---|---|
| **Quelle / Source** | [Bike Sales in Europe — Kaggle](https://www.kaggle.com/datasets/sadiqshah/bike-sales-in-europe) |
| **Autor / Author** | Sadiq Shah |
| **Zeilen / Rows** | 113.036 Transaktionen / transactions |
| **Zeitraum / Period** | 2011–2016 |
| **Länder / Countries** | Australia, Canada, France, **Germany**, United Kingdom, USA |
| **Kategorien / Categories** | Accessories, Bikes, Clothing |
| **Felder / Fields** | Revenue, Cost, Profit, Quantity, Unit Price, Unit Cost |

---

## 🔑 Wichtigste Ergebnisse / Key Findings (2015)

| KPI | Wert / Value | Bewertung / Assessment |
|---|---|---|
| Jahresumsatz / Annual Revenue | 20.023.991 USD | 📈 +ges.% vs. 2014 |
| Bruttomarge / Gross Margin | 37.6% | 🟡 Knapp unter Ziel 38% / Just below target |
| Plan-Abweichung / Budget Var. | +0.5% | 🟢 Über Plan / Above budget |
| Stärkste Kategorie / Top Category | Accessories | 🏆 DB-Quote 58.7% |
| Stärkstes Land / Top Country | USA | 🌍 6.3M USD Umsatz / Revenue |
| Rolling Forecast (Sep 2015) | +6% vs. Budget | 🟢 Positiver Ausblick / Positive outlook |

---

## ⚙️ Installation & Ausführung / Setup & Run

```bash
# Repository klonen / Clone repository
git clone https://github.com/[username]/retailco-financial-analysis.git
cd retailco-financial-analysis

# Abhängigkeiten installieren / Install dependencies
pip install pandas numpy matplotlib openpyxl jupyter

# Notebooks starten / Launch notebooks
jupyter notebook notebooks/
```

**Reihenfolge / Execution order:**
```
00_data_preparation.ipynb   →   Zuerst ausführen! / Run first!
01_accounting_closing.ipynb
02_controlling_plan_ist.ipynb
03_data_export_powerbi.ipynb
```

> ⚠️ **DE:** Bitte zuerst den Datensatz von Kaggle herunterladen und unter `data/raw/bike_sales.csv` speichern.  
> ⚠️ **EN:** Please download the dataset from Kaggle first and save it as `data/raw/bike_sales.csv`.

---

## 👤 Autor / Author

**Yurii Oleshchuk**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://linkedin.com/in/yurii-oleshchuk)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black?logo=github)](https://github.com/yurii-oleshchuk)

---

## 📄 Lizenz / License

Dieses Projekt ist für Portfolio-Zwecke erstellt. Der verwendete Datensatz unterliegt der Kaggle-Nutzungslizenz.  
This project is created for portfolio purposes. The dataset is subject to Kaggle's usage license.

---

*Erstellt mit Python, Excel & Power BI | Created with Python, Excel & Power BI*
