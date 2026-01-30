SELECT
  transaction_status,
  COUNT(*) AS total_transactions
FROM `aml-capstone-project.aml_project.fact_transactions`
GROUP BY transaction_status
ORDER BY total_transactions DESC;