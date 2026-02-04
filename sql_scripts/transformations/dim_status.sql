CREATE OR REPLACE TABLE `aml-capstone-project.aml_project.dim_status` AS
SELECT DISTINCT
  transaction_status
FROM `aml-capstone-project.aml_project.stg_transactions`
ORDER BY transaction_status;
