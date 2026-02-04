CREATE OR REPLACE TABLE `aml-capstone-project.aml_project.dim_scenario` AS
SELECT DISTINCT
  scenario_type
FROM `aml-capstone-project.aml_project.stg_transactions`
ORDER BY scenario_type;
