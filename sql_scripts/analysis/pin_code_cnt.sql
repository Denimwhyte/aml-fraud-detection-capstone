SELECT
  pin_code,
  COUNT(*) AS total_transactions
FROM `aml-capstone-project.aml_project.fact_transactions`
GROUP BY pin_code
ORDER BY total_transactions DESC;