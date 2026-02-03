CREATE OR REPLACE TABLE `aml-capstone-project.aml_project.raw_transactions_synthetic` AS
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

  -- FIXED LATENCY
  CAST(10 + FLOOR(RAND() * 90) AS INT64) AS latency_ms,

  slice_bandwidth_mbps,
  pin_code
FROM `aml-capstone-project.aml_project.raw_transactions_synthetic`;

