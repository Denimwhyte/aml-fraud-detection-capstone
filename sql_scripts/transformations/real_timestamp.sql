SELECT
  timestamp,
  SAFE_CAST(timestamp AS TIMESTAMP) AS cast_test
FROM `aml-capstone-project.aml_project.raw_transactions`
LIMIT 20;
