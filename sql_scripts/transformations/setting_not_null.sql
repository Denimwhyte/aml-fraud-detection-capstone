CREATE OR REPLACE TABLE `aml-capstone-project.aml_project.raw_transactions_synthetic`
(
  transaction_id STRING NOT NULL,
  sender_account_id STRING NOT NULL,
  receiver_account_id STRING NOT NULL,
  transaction_amount FLOAT64 NOT NULL,
  transaction_type STRING NOT NULL,
  timestamp TIMESTAMP NOT NULL,
  transaction_status STRING NOT NULL,
  fraud_flag BOOL NOT NULL,
  geo_latitude FLOAT64,
  geo_longitude FLOAT64,
  device_used STRING,
  network_slice_id STRING,
  latency_ms INT64,
  slice_bandwidth_mbps INT64,
  pin_code STRING
)
AS
SELECT * FROM `aml-capstone-project.aml_project.raw_transactions_synthetic`;

