CREATE OR REPLACE TABLE `aml-capstone-project.aml_project.raw_transactions_synthetic` AS
WITH base AS (
  SELECT
    GENERATE_UUID() AS transaction_id,
    TIMESTAMP_SUB(
      CURRENT_TIMESTAMP(),
      INTERVAL CAST(FLOOR(RAND() * 60 * 24 * 30) AS INT64) MINUTE
    ) AS transaction_timestamp,
    -- Random amounts between 1 and 5000
    ROUND(RAND() * 5000, 2) AS amount,
    -- Random customer IDs
    CONCAT('CUST_', CAST(FLOOR(RAND() * 10000) AS STRING)) AS customer_id,
    -- Random merchant IDs
    CONCAT('MERCH_', CAST(FLOOR(RAND() * 2000) AS STRING)) AS merchant_id,
    -- Random device IDs
    CONCAT('DEV_', CAST(FLOOR(RAND() * 5000) AS STRING)) AS device_id,
    -- Random location IDs
    CONCAT('LOC_', CAST(FLOOR(RAND() * 1000) AS STRING)) AS location_id,
    -- Random transaction type
    CASE
      WHEN RAND() < 0.25 THEN 'purchase'
      WHEN RAND() < 0.50 THEN 'withdrawal'
      WHEN RAND() < 0.75 THEN 'transfer'
      ELSE 'deposit'
    END AS transaction_type,
    -- Random status
    CASE
      WHEN RAND() < 0.90 THEN 'approved'
      ELSE 'declined'
    END AS status,
    -- Random network slice
    CASE
      WHEN RAND() < 0.33 THEN 'slice_A'
      WHEN RAND() < 0.66 THEN 'slice_B'
      ELSE 'slice_C'
    END AS network_slice
  FROM UNNEST(GENERATE_ARRAY(1, 50000)) AS x
)

SELECT * FROM base;
