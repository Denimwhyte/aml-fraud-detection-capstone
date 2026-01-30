SELECT
  AVG(transaction_amount) AS average_amount,
  MIN(transaction_amount) AS minimum_amount,
  MAX(transaction_amount) AS maximum_amount
FROM `aml-capstone-project.aml_project.fact_transactions`;
