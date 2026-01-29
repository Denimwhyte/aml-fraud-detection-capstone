CREATE OR REPLACE TABLE `aml-capstone-project.aml_project.dim_location` AS
SELECT DISTINCT
  geo_latitude,
  geo_longitude,
  pin_code
FROM `aml-capstone-project.aml_project.raw_transactions`;