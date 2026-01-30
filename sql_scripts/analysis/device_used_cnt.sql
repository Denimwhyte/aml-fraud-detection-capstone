SELECT
  device_used,
  COUNT(*) AS total_transactions
FROM `aml-capstone-project.aml_project.fact_transactions`
GROUP BY device_used
ORDER BY total_transactions DESC;