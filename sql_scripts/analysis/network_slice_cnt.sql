SELECT
  network_slice_id,
  COUNT(*) AS total_transactions
FROM `aml-capstone-project.aml_project.fact_transactions`
GROUP BY network_slice_id
ORDER BY total_transactions DESC;
