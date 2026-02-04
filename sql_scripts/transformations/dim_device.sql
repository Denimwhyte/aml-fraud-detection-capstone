CREATE OR REPLACE TABLE `aml-capstone-project.aml_project.dim_device` AS
SELECT DISTINCT
  device_used AS device_name
FROM `aml-capstone-project.aml_project.stg_transactions`
ORDER BY device_name;
