Dataset Notes
Overview
This dataset contains synthetic financial transactions. Each row represents a single transaction and includes:

Sender Account ID

Receiver Account ID

Transaction Amount

Transaction Type (Deposit, Withdrawal, Transfer)

Timestamp of the transaction

Transaction Status (Success, Failed)

Fraud Flag

Geolocation information

Device used (Mobile, Desktop, Tablet)

Network slice (Slice1, Slice2, Slice3)

Latency and bandwidth metrics

PIN code used for authentication

Scenario Type (normal, structuring, velocity, round_sum) — used for AML pattern labelling

Data Cleaning Requirements
Before analysis, the dataset requires standard cleaning steps, including:

Converting timestamps into proper datetime format

Splitting geolocation into latitude and longitude

Checking for duplicate transactions

Ensuring transaction amounts are numeric

Standardising device names

Normalising slice names

Identifying missing or inconsistent values

These steps ensure data quality for modelling and analysis.

Network Slices
Network slices function similarly to lanes on a motorway, where each lane serves a different purpose:

Slice1 — high priority, low latency, high reliability

Slice2 — standard priority and performance

Slice3 — lower priority, higher latency

Slices are assigned automatically by the mobile network based on device type, service needs, and network conditions.

Relevance of Slice Behaviour
Changes in slice usage can indicate unusual or suspicious activity.
Examples include:

A device normally appearing on Slice1 but suddenly using Slice3

A sudden change in country or region

Switching between device types unexpectedly

Such shifts may reflect VPN usage, device compromise, SIM swapping, automated scripts, or other anomalies.

Latency
Latency is included to monitor system performance.
It supports evaluation of whether AML checks can operate in real time and meet regulatory expectations.

Fraud Flag
The Fraud Flag column indicates whether a transaction has been labelled as potentially fraudulent:

TRUE — flagged as suspicious

FALSE — considered normal

This label supports evaluation of detection rules, false positives, and false negatives.

Common Fraud Patterns
Fraud‑flagged transactions often exhibit:

Sudden or unusual geolocation changes

Device switching

High latency or unusual slice usage

Repeated failed attempts

Very high transaction amounts

Behaviour inconsistent with historical patterns

Normal transactions typically show stable location, consistent device usage, moderate amounts, and successful processing.

AML Context
Anomaly Detection
Anomaly detection identifies transactions that deviate from a customer’s typical behaviour.

Structuring
Structuring involves breaking a large amount into multiple smaller transactions to avoid detection.

Velocity Patterns
Velocity issues arise when transactions occur at an unusually high frequency within a short time window.

Dashboard Requirements
The dashboard should provide:

Overall transaction activity trends

Visibility of unusual or suspicious patterns

Customer‑level drill‑downs showing full transaction history

The purpose is to support compliance teams in identifying suspicious behaviour quickly and clearly.