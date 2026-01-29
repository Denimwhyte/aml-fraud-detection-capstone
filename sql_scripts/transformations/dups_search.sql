SELECT
  transaction_id,
  COUNT(*) AS cnt
FROM `aml-capstone-project.aml_project.raw_transactions`
GROUP BY transaction_id
HAVING cnt > 1;
