SELECT
  COUNT(*) AS total_rows,
  COUNT(DISTINCT transaction_id) AS unique_transaction_ids
FROM `aml-capstone-project.aml_project.raw_transactions`;
