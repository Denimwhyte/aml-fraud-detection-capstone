CREATE OR REPLACE TABLE `aml-capstone-project.aml_project.fact_transactions` AS
SELECT
  transaction_id,
  sender_account_id,
  receiver_account_id,
  transaction_amount,
  transaction_type,
  timestamp,
  transaction_status,
  fraud_flag,
  geo_latitude,
  geo_longitude,
  device_used,
  network_slice_id,
  latency_ms,
  slice_bandwidth_mbps,
  pin_code
FROM `aml-capstone-project.aml_project.raw_transactions`;
