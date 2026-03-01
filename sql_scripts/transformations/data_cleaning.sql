--fact_transactions creation
CREATE OR REPLACE TABLE `aml-capstone-project.aml_project.fact_transactions` AS
SELECT
  t.transaction_id,
  t.sender_account_id,
  t.receiver_account_id,
  t.timestamp,
  t.transaction_amount,
  t.latency_ms,
  t.slice_bandwidth_mbps,
  t.fraud_flag,

  d.device_used_id,
  tt.transaction_type_id,
  s.scenario_type_id,
  ts.transaction_status_id

FROM `aml-capstone-project.aml_project.stg_transactions` t
LEFT JOIN `aml-capstone-project.aml_project.dim_device` d
  ON t.device_used = d.device_used_name
LEFT JOIN `aml-capstone-project.aml_project.dim_transaction_type` tt
  ON t.transaction_type = tt.transaction_type   -- FIXED
LEFT JOIN `aml-capstone-project.aml_project.dim_scenario` s
  ON t.scenario_type = s.scenario_type_name
LEFT JOIN `aml-capstone-project.aml_project.dim_status` ts
  ON t.transaction_status = ts.transaction_status_name;

--dim_table creation
--Creates a lookup table of all unique transaction types with a numeric ID for the ERD star schema.
CREATE OR REPLACE TABLE `aml-capstone-project.aml_project.dim_transaction_type` (
  transaction_type_id INT64 NOT NULL,
  transaction_type STRING NOT NULL,
  PRIMARY KEY (transaction_type_id) NOT ENFORCED
) AS
SELECT
  ROW_NUMBER() OVER (ORDER BY transaction_type) AS transaction_type_id,
  transaction_type
FROM (
  SELECT DISTINCT transaction_type
  FROM `aml-capstone-project.aml_project.stg_transactions`
)
ORDER BY transaction_type;

-- Creates a lookup table of all unique devices used with a numeric ID for the ERD star schema.
CREATE OR REPLACE TABLE `aml-capstone-project.aml_project.dim_device` (
  device_used_id INT64 NOT NULL,
  device_used_name STRING NOT NULL,
  PRIMARY KEY (device_used_id) NOT ENFORCED
) AS
SELECT
  ROW_NUMBER() OVER (ORDER BY device_used_name) AS device_used_id,
  device_used_name
FROM (
  SELECT DISTINCT device_used AS device_used_name
  FROM `aml-capstone-project.aml_project.stg_transactions`
)
ORDER BY device_used_name;


--Creates a lookup table of all unique transaction statuses with a numeric ID for the ERD star schema.
CREATE OR REPLACE TABLE `aml-capstone-project.aml_project.dim_status` (
  transaction_status_id INT64 NOT NULL,
  transaction_status_name STRING NOT NULL,
  PRIMARY KEY (transaction_status_id) NOT ENFORCED
) AS
SELECT
  ROW_NUMBER() OVER (ORDER BY transaction_status_name) AS transaction_status_id,
  transaction_status_name
FROM (
  SELECT DISTINCT transaction_status AS transaction_status_name
  FROM `aml-capstone-project.aml_project.stg_transactions`
)
ORDER BY transaction_status_name;

--Creates a lookup table of all unique scenario types with a numeric ID for the ERD star schema.
CREATE OR REPLACE TABLE `aml-capstone-project.aml_project.dim_scenario` (
  scenario_type_id INT64 NOT NULL,
  scenario_type_name STRING NOT NULL,
  PRIMARY KEY (scenario_type_id) NOT ENFORCED
) AS
SELECT
  ROW_NUMBER() OVER (ORDER BY scenario_type_name) AS scenario_type_id,
  scenario_type_name
FROM (
  SELECT DISTINCT scenario_type AS scenario_type_name
  FROM `aml-capstone-project.aml_project.stg_transactions`
)
ORDER BY scenario_type_name;




