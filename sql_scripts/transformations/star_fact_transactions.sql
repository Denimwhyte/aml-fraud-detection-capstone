CREATE OR REPLACE TABLE `aml-capstone-project.aml_project.fact_transactions` AS
SELECT
  t.transaction_id,
  t.transaction_timestamp,
  t.transaction_amount,
  t.latency_ms,
  t.slice_bandwidth_mbps,
  t.fraud_flag,

  -- Foreign keys
  d.device_name,
  l.pin_code,
  tt.transaction_type,
  s.scenario_type,
  ts.transaction_status

FROM `aml-capstone-project.aml_project.stg_transactions` t
LEFT JOIN `aml-capstone-project.aml_project.dim_device` d
  ON t.device_used = d.device_name
LEFT JOIN `aml-capstone-project.aml_project.dim_location` l
  ON t.pin_code = l.pin_code
LEFT JOIN `aml-capstone-project.aml_project.dim_transaction_type` tt
  ON t.transaction_type = tt.transaction_type
LEFT JOIN `aml-capstone-project.aml_project.dim_scenario` s
  ON t.scenario_type = s.scenario_type
LEFT JOIN `aml-capstone-project.aml_project.dim_status` ts
  ON t.transaction_status = ts.transaction_status;
