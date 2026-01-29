Column Name	Data Type	Mode	Description
transaction_id	STRING	REQUIRED	Unique identifier for each transaction
sender_account_id	STRING	REQUIRED	ID of the account sending the funds
receiver_account_id	STRING	REQUIRED	ID of the account receiving the funds
transaction_amount	FLOAT64	REQUIRED	Monetary value of the transaction
transaction_type	STRING	REQUIRED	Type of transaction (Deposit, Withdrawal, Transfer)
transaction_timestamp	TIMESTAMP	REQUIRED	Date and time the transaction occurred
transaction_status	STRING	REQUIRED	Status of the transaction (Success, Failed)
fraud_flag	BOOL	REQUIRED	Indicates whether the transaction is fraudulent
geolocation	STRING	NULLABLE	Latitude/Longitude or region of the transaction
device_used	STRING	NULLABLE	Device used to perform the transaction (Mobile, Desktop, Tablet)
network_slice_id	STRING	NULLABLE	Identifier for the network slice used during the transaction
latency_ms	FLOAT64	NULLABLE	Network latency during the transaction in milliseconds
slice_bandwidth_mbps	FLOAT64	NULLABLE	Bandwidth allocated to the network slice in Mbps
pin_code	STRING	NULLABLE	PIN code used for authentication synthetic data