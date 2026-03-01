--number of transactions, first/last time, and total sent.
SELECT
  sender_account_id,
  COUNT(*) AS transaction_count,
  MIN(timestamp) AS first_transaction,
  MAX(timestamp) AS last_transaction,
  SUM(transaction_amount) AS total_sent
FROM `aml-capstone-project.aml_project.fact_transactions`
GROUP BY sender_account_id
HAVING COUNT(*) > 1
ORDER BY transaction_count DESC;

--This ranks only the high value transactions and also adds a fraud risk flag for each one.
SELECT
  transaction_id,
  transaction_amount,
  RANK() OVER (ORDER BY transaction_amount DESC) AS amount_rank,
IF(transaction_amount >= 5000, 1, 0) AS fraud_risk_flag
FROM aml_project. fact_transactions
where transaction_amount >= 5000

--This query counts how many transactions of each transaction type occur within each scenario type, by grouping on both fields and ordering by the highest totals.
SELECT
  f.scenario_type_id,
  dt.transaction_type,
  COUNT(*) AS total_transactions
FROM `aml-capstone-project.aml_project.fact_transactions` f
JOIN `aml-capstone-project.aml_project.dim_transaction_type` dt
  ON f.transaction_type_id = dt.transaction_type_id
GROUP BY
  f.scenario_type_id,
  dt.transaction_type
ORDER BY total_transactions DESC;


--This query counts how many transactions of each transaction type occur within each scenario type, by grouping on both fields and ordering by the highest totals.
SELECT
  f.scenario_type_id,
  dt.transaction_type,
  COUNT(*) AS total_transactions
FROM `aml-capstone-project.aml_project.fact_transactions` f
JOIN `aml-capstone-project.aml_project.dim_transaction_type` dt
  ON f.transaction_type_id = dt.transaction_type_id
GROUP BY
  f.scenario_type_id,
  dt.transaction_type
ORDER BY total_transactions DESC;


--counts how many transactions belong to each scenario type by joining the fact table to the scenario dimension.
*SELECT
  f.scenario_type_id,
  sc.scenario_type_name,
  COUNT(*) AS total_transactions
FROM `aml-capstone-project.aml_project.fact_transactions` f
JOIN `aml-capstone-project.aml_project.dim_scenario` sc
  ON f.scenario_type_id = sc.scenario_type_id
GROUP BY
  f.scenario_type_id,
  sc.scenario_type_name
ORDER BY total_transactions DESC;





