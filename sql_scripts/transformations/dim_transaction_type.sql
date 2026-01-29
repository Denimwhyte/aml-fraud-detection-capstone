CREATE TABLE `aml-capstone-project.aml_project.dim_transaction_type` AS
SELECT DISTINCT transaction_type
FROM `aml-capstone-project.aml_project.raw_transactions`;
