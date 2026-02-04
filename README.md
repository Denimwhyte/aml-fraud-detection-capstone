Project Brief: AML Transaction Analysis & Fraud Pattern Detection
Goal
This project examines a large set of financial transactions to identify behaviour that appears unusual or out of character. By analysing patterns in activity, location, device usage, and network behaviour, the objective is to highlight transactions that may indicate fraud, account misuse, or suspicious movement of funds.

Data
The dataset contains detailed information about each transaction, including:

account identifiers

transaction amounts and types

timestamps and statuses

fraud flags

geolocation

device information

network‑related fields such as latency and slice allocation

scenario_type, which labels each transaction as normal, structuring, velocity, or round_sum for AML pattern identification

The project uses at least two connected tables (raw transactions plus supporting dimensions), joined in SQL/BigQuery using fields such as account ID, device type, or time.

Tasks
The work begins with cleaning and standardising the raw transaction data to ensure reliability.
Once prepared, the data is structured into clear tables in BigQuery and joined to add additional context such as device, time, and location.

With the data organised, analytical queries are used to highlight behaviour that appears unusual or suspicious. Visualisations are then created to make these patterns easy to interpret.
The findings are presented in a clear and accessible format suitable for compliance teams.

Outcome
This project focuses on preparing real‑world operational data that may not be perfectly structured and transforming it into a format suitable for meaningful analysis.

A key part of the work involves identifying behavioural anomalies such as:

velocity spikes

structuring patterns

device changes

unexpected shifts in location

scenario‑based anomalies captured in the scenario_type field

SQL plays a central role in uncovering patterns that may not be immediately obvious, and the insights are communicated in a way that remains understandable to non‑technical audiences.

The overall aim is to demonstrate how thoughtful analysis can support AML investigations by highlighting transactions that fall outside a customer’s usual behaviour.