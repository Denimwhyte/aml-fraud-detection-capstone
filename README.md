Anti‑Money Laundering (AML) Anomaly Detection Project  

Project Overview  
This project simulates the work of a bank’s compliance analytics team. The goal is to detect suspicious financial behaviour such as structuring, rapid‑fire transactions, and scenario misuse, and to communicate these insights clearly to non‑technical stakeholders.

The project includes:

A star schema data model  
Fact and dimension tables built in BigQuery  
Advanced SQL using window functions, CTEs, joins, and aggregation  
A Looker Studio dashboard following a clear narrative:  
Summary → Trends → Deep Dive  
A focus on communication, including how to explain false positives and ethical considerations in AML

Data Model (Star Schema)

Fact Table  
fact_transactions  
Contains all transactional activity including timestamps, amounts, scenario types, devices, and transaction status.

Dimension Tables  
Created using SQL transformations:

dim_transaction_type – Lookup for transaction types  
dim_device – Lookup for device types  
dim_status – Lookup for transaction statuses  
dim_scenario – Lookup for scenario categories  

These tables support efficient joins and clear ERD documentation.

SQL Features Demonstrated  
The project includes advanced SQL techniques:

Window functions (RANK(), ROW_NUMBER())  
Aggregation (COUNT, SUM, MIN, MAX)  
JOIN logic across fact and dimension tables  
HAVING filters for anomaly detection  
Analytical queries for AML patterns  

Example patterns detected:

High‑value transactions  
Rapid‑fire activity  
Structuring (multiple small payments)  
Scenario misuse  
Transaction type anomalies  

Dashboard Overview (Looker Studio)  
The dashboard is designed for compliance officers and follows a logical flow:

1. Summary View  
Total transactions  
High‑risk transactions  
Scenario distribution  
Device usage patterns

2. Trend View  
Transaction volume over time  
High‑value transaction trends  
Scenario spikes

3. Deep Dive View  
Sender activity summary  
High‑value transaction ranking  
Scenario × transaction type matrix  
Drill‑down into individual accounts  

Conditional formatting is used to highlight risk flags (e.g., fraud_risk_flag = 1 shown in red).

Key Analytical Queries  
Sender Activity Summary  
Counts transactions per sender, first/last activity, and total sent.

High‑Value Transaction Ranking  
Ranks transactions using RANK() and flags those above £5,000.

Scenario × Transaction Type  
Shows unusual combinations that may indicate misuse.

Scenario Totals  
Identifies which scenarios dominate activity.

All queries are stored in the sql_scripts/analysis/ folder.

Folder Structure  
Code  
├── README.md  
├── data_modelling/  
│   ├── star_schema.png  
│   ├── erd_diagram.pdf  
├── sql_scripts/  
│   ├── transformations/  
│   │   ├── dim_transaction_type.sql  
│   │   ├── dim_device.sql  
│   │   ├── dim_status.sql  
│   │   ├── dim_scenario.sql  
│   ├── analysis/  
│       ├── sender_activity_summary.sql  
│       ├── high_value_transactions.sql  
│       ├── scenario_transaction_types.sql  
│       ├── scenario_totals.sql  
├── notebooks/  
│   └── exploratory_analysis.ipynb  
├── dashboard/  
│   ├── looker_studio_link.txt  
│   ├── dashboard_screenshots/  
└── .gitignore

How to Run the Project  
1. Clone the Repository  
git clone <https://github.com/Denimwhyte/aml-fraud-detection-capstone.git>  
cd aml-project

2. Load Data into BigQuery  
Upload your staging data into:  
aml-capstone-project.aml_project.stg_transactions

3. Build Dimension Tables  
Run the SQL files in sql_scripts/transformations/.

4. Build the Fact Table  
Ensure fact_transactions is populated and linked to all dimensions.

5. Run Analytical Queries  
Execute the SQL in sql_scripts/analysis/.

6. Connect to Looker Studio  
Add BigQuery as a data source  
Connect each view (not raw tables)  
Build visuals using the dashboard guide

Data Ethics & Bias Mitigation  
AML systems can unintentionally introduce bias. This project addresses:

Avoiding over‑flagging of specific customer groups  
Explaining false positives clearly  
Ensuring transparency in rule‑based alerts  
Documenting limitations of automated detection

