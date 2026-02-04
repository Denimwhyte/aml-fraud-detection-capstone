SELECT
  SUM(CASE WHEN transaction_amount IS NULL THEN 1 ELSE 0 END) AS missing_amounts,
  SUM(CASE WHEN transaction_type IS NULL THEN 1 ELSE 0 END) AS missing_types,
  SUM(CASE WHEN timestamp IS NULL THEN 1 ELSE 0 END) AS missing_timestamps,
  SUM(CASE WHEN device_used IS NULL THEN 1 ELSE 0 END) AS missing_devices,
  SUM(CASE WHEN geo_latitude IS NULL THEN 1 ELSE 0 END) AS missing_geo_latitude,
  SUM(CASE WHEN geo_longitude IS NULL THEN 1 ELSE 0 END) AS missing_geo_longitude,
  SUM(CASE WHEN scenario_type IS NULL THEN 1 ELSE 0 END) AS missing_scenario_type
FROM `aml-capstone-project.aml_project.raw_transactions`;