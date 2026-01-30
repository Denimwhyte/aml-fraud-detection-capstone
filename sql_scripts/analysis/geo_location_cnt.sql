SELECT
  geo_latitude,
  geo_longitude,
  COUNT(*) AS total_transactions
FROM `aml-capstone-project.aml_project.fact_transactions`
GROUP BY geo_latitude, geo_longitude
ORDER BY total_transactions DESC;