SELECT *
FROM `aml-capstone-project.aml_project.raw_transactions`
WHERE transaction_id IS NULL
   OR sender_account_id IS NULL
   OR receiver_account_id IS NULL
   OR transaction_amount IS NULL
   OR timestamp IS NULL;
