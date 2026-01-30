SELECT
  FORMAT_TIMESTAMP('%H:%M', timestamp) AS minute_block,
  COUNT(*) AS transactions
FROM `aml-capstone-project.aml_project.fact_transactions`
GROUP BY minute_block
ORDER BY minute_block;
