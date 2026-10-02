# RetailCo Finance & Procurement Controlling
### Bilingual Portfolio Project | Zweisprachiges Portfolio-Projekt — Accounting, Controlling, Einkauf & BI

🔗 **[Live Dashboard / Interaktives Board](https://yurii-oleshchuk.github.io/retailco-financial-analysis/dashboard/interactive_board.html)** &nbsp;|&nbsp; 📄 [Management Summary (DE/EN)](docs/management_summary_final_de_en.pdf) &nbsp;|&nbsp; 📊 [Power BI PDF](dashboard/dashboard.pdf)

---

## 🇩🇪 Deutsch
Dieses Portfolio-Projekt zeigt einen durchgängigen Reporting- und Controlling-Prozess auf Basis eines Retail-Transaktionsdatensatzes. Der Schwerpunkt liegt auf **Accounting, Controlling, Forecasting, Einkaufsanalyse, Datenqualität, SQL und Power BI**.

Das Projekt besteht aus zwei klar getrennten Datenströmen:

- **Finance / Sales:** Umsatz, COGS, Bruttoergebnis, Plan-Ist-Vergleich und Forecast
- **Procurement / Einkauf:** synthetische Bestellungen, Einkaufsvolumen, Lieferantenanalyse und Einkaufspreisabweichung (PPV)

**Wichtig:** Die Procurement-Daten und der Plan sind synthetische Portfolio-Daten. Sie bilden weder SAP noch ein reales Einkaufssystem ab. Details siehe Abschnitt [Datenlimitierungen / Data Limitations](#9-data-limitations--datenlimitierungen).

## 🇬🇧 English
This portfolio project demonstrates an end-to-end reporting and controlling process based on a retail transaction dataset. The focus is on **accounting, controlling, forecasting, procurement analysis, data quality, SQL and Power BI**.

The project contains two clearly separated data streams:

- **Finance / Sales:** revenue, COGS, gross profit, plan-vs-actual analysis and forecasting
- **Procurement / Purchasing:** synthetic purchase orders, purchase spend, supplier analysis and purchase price variance (PPV)

**Important:** The procurement data and the plan are synthetic portfolio data. They do not represent SAP or any real procurement system. See [Data Limitations / Datenlimitierungen](#9-data-limitations--datenlimitierungen) for details.

---

## 🛠️ Tech Stack / Technologie

| Tool | DE | EN |
|---|---|---|
| Python / pandas | Datenvorbereitung & Analyse | Data preparation & analysis |
| SQL (SQLite) | Einkaufs-KPIs & Datenqualität | Procurement KPIs & data quality |
| Excel | Closing & Controlling | Closing & controlling |
| Power BI | Reporting & Dashboarding | Reporting & dashboards |
| HTML / Chart.js | Interaktives Board ohne Zusatzsoftware | Interactive board, no extra software |
| Jupyter | Dokumentierter Analyseprozess | Documented analysis process |

---

## 📁 Project Structure / Projektstruktur

```text
retailco-financial-analysis/
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
- Wie haben sich Umsatz und Bruttomarge entwickelt? / How did revenue and gross margin develop?
- Wie liegt der Ist-Umsatz gegenüber dem illustrativen Plan? / How does actual revenue compare with the illustrative plan?

### Procurement / Einkauf
- Wie hoch ist das Einkaufsvolumen? / What is total purchase spend?
- Bei welchen Lieferanten und Warengruppen konzentriert sich das Einkaufsvolumen? / Which suppliers and categories concentrate spend?
- Wo entstehen Einkaufspreisabweichungen? / Where do purchase price variances occur?

### Forecast / Prognose
- Wie lautet die Jahresprognose auf Basis der bis September 2015 verfügbaren Ist-Daten? / What is the expected full-year result based only on information available through September 2015?

### Data Quality / Datenqualität
- Sind die Reporting-Daten vollständig und konsistent? / Are the reporting data complete and internally consistent?

---

# 2. Key Findings / Kernergebnisse

| # | 🇩🇪 Deutsch | 🇬🇧 English |
|---|---|---|
| 1 | 2015: Umsatz **$20,02 Mio.**, Bruttoergebnis **$7,53 Mio.**, Bruttomarge **37,6 %**. | 2015: revenue **$20.02M**, gross profit **$7.53M**, gross margin **37.6%**. |
| 2 | Einkaufsvolumen **$4,82 Mio.** bei einer PPV von **+$53,2 Tsd. (+1,1 %)**: Die Ist-Preise liegen leicht über Plan. | Purchase spend **$4.82M** with a PPV of **+$53.2K (+1.1%)**: actual prices are slightly above plan. |
| 3 | Die zwei größten Lieferanten (H und D) vereinen rund **40 %** des Einkaufsvolumens. | The two largest suppliers (H and D) account for about **40%** of purchase spend. |
| 4 | Benchmark-Forecast FY2015: **$20,67 Mio.** (+3,28 % vs. synthetischem Plan); der Q4-Backtest zeigt eine Überschätzung von ca. **+7 %**. | FY2015 benchmark forecast: **$20.67M** (+3.28% vs synthetic plan); the Q4 backtest shows an overestimate of about **+7%**. |
| 5 | Die Quelldaten haben strukturelle Auffälligkeiten (siehe Abschnitt 9). Wachstumsraten sind daher mit Vorsicht zu lesen. | The source data show structural anomalies (see Section 9). Growth rates should therefore be read with caution. |

---

# 3. Finance & Accounting / Finanzen & Accounting

Das Finance-Modul umfasst die monatliche GuV, Closing-Prüfungen, Abstimmungen und illustrative Abgrenzungen. / The finance module covers the monthly P&L, closing checks, reconciliation and illustrative accrual adjustments.

**2015 core results / Kernergebnisse 2015:**

| KPI | Value / Wert |
|---|---:|
| Revenue / Umsatz | **$20.024M** |
| COGS | **$12.495M** |
| Gross Profit / Bruttoergebnis | **$7.529M** |
| Gross Margin / Bruttomarge | **37.6%** |
| Revenue vs Synthetic Plan / Umsatz vs. Synthetic Plan | **+$11.7K / +0.06%** |

Der Plan ist ein **illustrativer synthetischer Benchmark**, kein historisches Management-Budget. / The plan is an **illustrative synthetic benchmark**, not a historical management budget.

---

# 4. Controlling / Controlling

- Ist vs. Synthetic Plan / Actual vs Synthetic Plan
- Umsatzabweichung nach Warengruppe / Revenue variance by category
- Deckungsbeitrag / Contribution margin
- Länder- und Warengruppenanalyse / Country and category analysis

Eine Price-Volume-Mix-Brücke wird bewusst **nicht** ausgewiesen, da die Quelldaten keine unabhängige Planmenge und keinen Planpreis enthalten. / A price-volume-mix bridge is deliberately **not** claimed because the source data do not provide an independent planned quantity and planned price.

---

# 5. Forecasting / Forecasting

Der Forecast vom September 2015 nutzt nur Informationen, die zu diesem Zeitpunkt verfügbar gewesen wären: **Ist-Daten Jan–Sep 2015** plus die vollständige **Saisonalität 2013**. / The September 2015 forecast uses only information that would have been available at that point: **Jan–Sep 2015 actuals** plus complete **2013 seasonality**.

- FY-Forecast / FY Forecast: **$20.669M**
- vs. Synthetic Plan: **+3.28%**
- Retrospektiver Q4-Backtest-Fehler / Retrospective Q4 backtest error: ca. / approx. **+7.0%**

Dies ist ein **saisonaler Benchmark-Forecast**, kein produktionsreifes Prognosemodell. / This is a **seasonal benchmark forecast**, not a production-grade forecasting model.

2014 und 2016 enthalten nur Januar–Juli und gelten daher nicht als Volljahres-Vergleichswerte. / 2014 and 2016 contain January–July only and are therefore not treated as full-year comparators.

---

# 6. Procurement / Einkauf

Das Procurement-Modul ist bewusst klein und transparent. Es nutzt einen synthetischen Portfolio-Datensatz mit Bestellungen, Lieferanten, Warengruppen, Mengen, Ist-Preisen und geplanten Referenzpreisen. / The procurement module is intentionally small and transparent. It uses a synthetic portfolio dataset with purchase orders, suppliers, categories, quantities, actual prices and planned reference prices.

### Procurement KPIs / Einkaufs-KPIs (2015)

| KPI | Value / Wert |
|---|---:|
| Purchase Spend / Einkaufsvolumen | **$4,824,721** |
| Planned Spend / Geplantes Einkaufsvolumen | **$4,771,530** |
| PPV (Purchase Price Variance / Einkaufspreisabweichung) | **+$53,191 (+1.1%)** |
| Suppliers / Lieferanten | **12** |
| Purchase Orders / Bestellungen | **900** |
| Average PO Value / Durchschnittlicher Bestellwert | **$5,361** |

### PPV definition / PPV-Definition

`PPV = Actual Spend − Planned Spend`

Ein positiver PPV bedeutet, dass die tatsächlichen Einkaufspreise über Plan lagen. / Positive PPV means actual purchase prices were above plan.

Die Procurement-Daten sind **synthetisch** und stellen weder SAP noch das Einkaufssystem eines realen Unternehmens dar. / The procurement data are **synthetic** and do not represent SAP or a real company procurement system.

---

# 7. SQL & Data Quality / SQL & Datenqualität

Drei SQL-Beispiele sind enthalten: / Three SQL examples are included:

1. `01_data_quality.sql` — kritische Datenqualitätsprüfungen / critical data-quality checks
2. `02_procurement_kpis.sql` — Berechnung der Einkaufs-KPIs / procurement KPI calculation
3. `03_supplier_analysis.sql` — Lieferanten- und Warengruppenanalyse / supplier and category analysis

Der synthetische Procurement-Datensatz besteht alle kritischen Prüfungen. Da die Daten künstlich erzeugt sind, ist dieses Ergebnis erwartbar und kein Nachweis der Qualität eines realen Systems. / The synthetic procurement dataset passes all critical checks. Because the data are artificially generated, this result is expected and not evidence of the quality of a real system.

**Sofort lauffähig / Run it immediately:** `sql/retailco.db` ist eine SQLite-Datenbank, bereits aus `purchase_orders.csv` befüllt. Es ist kein Setup nötig. / `sql/retailco.db` is a SQLite database already loaded from `purchase_orders.csv`. No setup step is required.

```bash
cd sql
sqlite3 -header -column retailco.db < 02_procurement_kpis.sql
```

Siehe `sql/README.md` für Kommandozeile, GUI (DB Browser for SQLite) und Python. Alternativ `notebooks/05_sql_queries_demo.ipynb` öffnen: Dort laufen alle drei Skripte, die Ergebnisse sind gespeichert. / See `sql/README.md` for command-line, GUI (DB Browser for SQLite) and Python options, or open `notebooks/05_sql_queries_demo.ipynb`, which runs all three scripts with the outputs already saved.

---

# 8. Dashboards / Dashboards

### 8.1 Power BI

Das Power-BI-Dashboard (`dashboard/dashboard.pbix`) besteht aus vier Seiten. / The Power BI dashboard (`dashboard/dashboard.pbix`) consists of four pages:

1. **Management Overview / Management-Übersicht**
2. **Controlling / Controlling-Analyse**
3. **Forecast / Prognose**
4. **Procurement Controlling / Einkaufscontrolling**

Die Standardansicht ist **2015 / Alle Länder / Alle Warengruppen**. Die Procurement-Daten sind ein separater synthetischer 2015-Datenstrom und erben die Finance-Slicer nicht. / The default management view is **2015 / All Countries / All Categories**. Procurement is a separate synthetic 2015 data stream and does not inherit the Finance slicers.

**Hinweise zur Lesbarkeit / Reading notes:**

- 2014 und 2016 enthalten nur Januar–Juli und sind keine Volljahresvergleiche. / 2014 and 2016 contain January–July only and are not full-year comparators.
- Der FY-Forecast ist ein Gesamtunternehmens-Benchmark für FY2015, keine Prognose je Land oder Warengruppe. / The FY forecast is a FY2015 total-company benchmark, not a country- or category-level forecast.
- „Contribution Margin I / Deckungsbeitrag I“ = Umsatz minus variable Kosten. / Contribution Margin I = revenue minus variable costs.

`dashboard/dashboard.pdf` ist der PDF-Export des PBIX (Standardansicht 2015 / All / All). / `dashboard/dashboard.pdf` is the PDF export of the PBIX (default view 2015 / All / All).

### 8.2 Interactive HTML Board / Interaktives HTML-Board

🔗 **[Live öffnen / Open live](https://yurii-oleshchuk.github.io/retailco-financial-analysis/dashboard/interactive_board.html)**

`dashboard/interactive_board.html` ist ein eigenständiges, browserbasiertes Board auf Basis der CSV-Outputs dieses Projekts (Chart.js, kein Server, keine Installation). Es ergänzt das Power-BI-Modell für den schnellen Versand an Stakeholder ohne Zusatzsoftware und deckt dieselben vier Bereiche ab — Finance, Abweichung, Forecast und Procurement — mit Filtern für Geschäftsjahr, Land und Warengruppe. / `dashboard/interactive_board.html` is a self-contained, browser-based board built directly from this project's CSV outputs (Chart.js, no server, no install). It complements the Power BI model for quick distribution to stakeholders without extra software and covers the same four areas — Finance, Variance, Forecast and Procurement — with fiscal-year, country and category filters.

Lokal: Datei per Doppelklick im Browser öffnen. Eine Internetverbindung wird nur zum Laden der Chart.js-Bibliothek (CDN) benötigt. / Locally: open the file in any browser (double-click). An internet connection is only needed to load the Chart.js library from a CDN.

---

# 9. Data Limitations / Datenlimitierungen

Diese Punkte sind für die Interpretation der Ergebnisse wesentlich. / These points are essential for interpreting the results.

### 9.1 Source data structure / Struktur der Quelldaten

- 🇩🇪 In `bike_sales.csv` haben die Jahrespaare **2011/2012, 2013/2015 und 2014/2016 jeweils exakt dieselbe Zeilenzahl** (2.677 / 24.443 / 29.398). Kundenalter, Geschlecht, Land, Bundesland, Produkt, Tag und Monat sind in jedem Paar **zeilenweise identisch**; auch Stückkosten und Stückpreise sind gleich. Nur Mengen (±2 %) und die Beträge für Umsatz, Kosten und Gewinn unterscheiden sich. Das deutet auf eine synthetisch bzw. künstlich vervielfältigte Struktur hin und nicht auf unabhängige Geschäftsjahre.
- 🇬🇧 In `bike_sales.csv`, the year pairs **2011/2012, 2013/2015 and 2014/2016 each have exactly the same row count** (2,677 / 24,443 / 29,398). Customer age, gender, country, state, product, day and month are **row-for-row identical** within each pair; unit cost and unit price are identical as well. Only quantities (±2%) and the revenue, cost and profit amounts differ. This points to a synthetically replicated structure rather than independent business years.
- 🇩🇪 **Folge:** Wachstumsraten und Saisonalität (inkl. des Forecasts, der auf 2013 basiert) bilden kein reales Geschäft ab, sondern die Struktur des Datensatzes.
- 🇬🇧 **Consequence:** growth rates and seasonality (including the forecast, which is based on 2013) describe the structure of the dataset, not a real business.
- 🇩🇪 Die Bestellmenge springt von ca. 5.000 (2012) auf ca. 295.000 (2013). Dieser Sprung ist nicht erklärt. Auch die Monatsverteilung 2015 ist extrem verzerrt (Januar 244 vs. Dezember 5.270 Zeilen).
- 🇬🇧 Order quantity jumps from about 5,000 (2012) to about 295,000 (2013). This jump is unexplained. The 2015 monthly distribution is also extremely skewed (January 244 vs December 5,270 rows).
- 🇩🇪 Der Umsatz liegt in allen Jahren bei ca. 89–90 % von Menge × Stückpreis (implizite Rabatte). Die Kosten stimmen exakt mit Menge × Stückkosten überein.
- 🇬🇧 Revenue is about 89–90% of quantity × unit price in every year (implicit discounts). Costs match quantity × unit cost exactly.

### 9.2 Year-over-year comparison / Vorjahresvergleich

- 🇩🇪 2014 und 2016 enthalten nur Januar–Juli. Eine YoY-Kennzahl 2015 vs. 2014 (z. B. im HTML-Board) vergleicht daher ein **volles Jahr mit sieben Monaten** und überzeichnet das Wachstum. Für belastbare Aussagen sollte 2015 mit 2013 oder auf Jan–Jul-Basis verglichen werden.
- 🇬🇧 2014 and 2016 contain January–July only. A YoY figure for 2015 vs 2014 (e.g. in the HTML board) therefore compares a **full year with seven months** and overstates growth. For robust statements, compare 2015 with 2013, or on a Jan–Jul basis.

### 9.3 Plan / Plan

- 🇩🇪 Der Plan wird aus den Ist-Transaktionsdaten abgeleitet. Die Abweichung von **+0,06 %** ist daher kein Beleg für Planungsgüte, sondern eine Konsistenzprüfung.
- 🇬🇧 The plan is derived from the actual transaction data. The **+0.06%** variance is therefore not evidence of planning quality but a consistency check.

### 9.4 Forecast / Forecast

- 🇩🇪 Der Backtest zeigt eine systematische Überschätzung von ca. **+7 %**. Der Forecast ist als Punktschätzung ohne Unsicherheitsintervall dargestellt und nicht bias-korrigiert.
- 🇬🇧 The backtest shows a systematic overestimate of about **+7%**. The forecast is presented as a point estimate without an uncertainty interval and is not bias-corrected.

### 9.5 Procurement / Einkauf

- 🇩🇪 Die Daten sind synthetisch (Lieferanten „A–L“, 900 Bestellungen, 60 Artikel). Alle Qualitätsprüfungen bestehen erwartungsgemäß. Die Kategorie „Bikes“ (Preise bis ca. $2.468) und Accessoires (ab ca. $2) liegen in einer Tabelle auf sehr unterschiedlichen Preisniveaus. Es gibt keine Pareto-/ABC-Analyse und keine PPV-Zeitreihe je Lieferant.
- 🇬🇧 The data are synthetic (suppliers "A–L", 900 purchase orders, 60 items). All quality checks pass, as expected. The category "Bikes" (prices up to about $2,468) and accessories (from about $2) sit in one table at very different price levels. There is no Pareto/ABC analysis and no PPV time series per supplier.

### 9.6 Other assumptions / Weitere Annahmen

- **Accruals / Abgrenzungen:** 5 % Umsatz und 3 % Kosten sind illustrative Portfolio-Annahmen. / 5% revenue and 3% costs are illustrative portfolio assumptions.
- **PVM:** nicht ausgewiesen, da Planmenge und Planpreis fehlen. / not presented because planned quantity and planned price are not available.

---

# 10. Management Reporting / Management Reporting

Die Management-Sicht enthält bewusst nur wenige entscheidungsrelevante Kennzahlen und drei faktenbasierte Erkenntnisse (siehe Abschnitt 2). Der Bericht liegt unter `docs/management_summary_final_de_en.pdf`. / The management view deliberately contains only a few decision-relevant KPIs and three fact-based insights (see Section 2). The report is available at `docs/management_summary_final_de_en.pdf`.

---

# 11. Setup / Ausführung

```bash
pip install pandas numpy matplotlib openpyxl jupyter
jupyter notebook notebooks/
```

Für die ursprüngliche Finance-Analyse wird der Quelldatensatz unter `data/raw/bike_sales.csv` benötigt. Das Procurement-Modul ist eigenständig und kann direkt aus `data/procurement/purchase_orders.csv` analysiert werden. / For the original finance analysis, the source dataset is required under `data/raw/bike_sales.csv`. The procurement module is self-contained and can be analyzed directly from `data/procurement/purchase_orders.csv`.

Empfohlene Reihenfolge der Notebooks / Recommended notebook order:

```text
00_data_preparation.ipynb
01_accounting_closing.ipynb
02_controlling_plan_ist.ipynb
03_data_export_powerbi.ipynb
04_procurement_analysis.ipynb
05_sql_queries_demo.ipynb
```

---

## Author / Autor

Yurii Oleshchuk

## License / Lizenz

Portfolio-Projekt. Der ursprüngliche Retail-Datensatz unterliegt seiner Quelllizenz. / Portfolio project. The original retail dataset remains subject to its source license.

*Python · SQL · Excel · Power BI · HTML*
