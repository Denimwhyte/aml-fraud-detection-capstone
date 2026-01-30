#minute data discovered
SELECT
  EXTRACT(HOUR FROM timestamp) AS hour,
  COUNT(*) AS transactions
FROM `aml-capstone-project.aml_project.fact_transactions`
GROUP BY hour
ORDER BY hour;
