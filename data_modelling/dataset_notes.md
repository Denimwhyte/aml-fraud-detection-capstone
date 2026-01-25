Dataset Notes
What this dataset contains
This dataset is a collection of financial transactions, where each row represents one transaction made by a customer. It includes:
who sent the money (Sender Account ID)
who received the money (Receiver Account ID)
how much was sent (Transaction Amount)
the type of transaction (Deposit, Withdrawal, Transfer)
the date and time it happened (Timestamp)
whether it succeeded or failed (Transaction Status)
whether it was flagged as fraud (Fraud Flag)
the location it came from (Geolocation)
the device used (Mobile or Desktop)
the network slice (Slice1, Slice2, Slice3)
latency and bandwidth
the PIN code used
Data cleaning needed
Even though the dataset looks organised, it still needs proper cleaning before analysis. This includes:
converting timestamps into a proper datetime format
splitting geolocation into latitude and longitude
checking for duplicates
making sure amounts are numeric
standardising device names
normalising slice names
checking for missing or inconsistent values
These steps are needed before modelling or analysis.
Network slices (simple explanation)
A network slice can be thought of as a lane on a motorway, where each lane serves a different purpose.
Lane 1 — Fast Lane
High priority
Low congestion
Used for important or time‑sensitive activity
Lane 2 — Standard Lane
Normal priority
Regular traffic
Balanced speed and performance
Lane 3 — Slow/Heavy Lane
Lower priority
Higher congestion
Used for background or less critical activity
Mapping this to the dataset
The dataset includes three slices:
Slice1
Slice2
Slice3
These behave like the motorway lanes:
Slice1 = fast lane (low latency, high reliability)
Slice2 = standard lane (normal latency and performance)
Slice3 = slow lane (higher latency, lower priority)
Who chooses the slice?
Customers do not choose their slice.
The mobile network assigns it automatically based on:
network conditions
device type
service needs
Why slice behaviour matters for fraud detection
Changes in slice usage can reveal unusual or suspicious behaviour.
For example, if an account normally appears on:
Slice1
from a consistent location
using a desktop
…but suddenly shows a transaction on:
Slice3
from a different country
using a mobile device
…it is similar to seeing a car suddenly appear in the lorry lane of a motorway in another country.
This kind of shift may indicate:
VPN use
device compromise
SIM swapping
automated scripts
fraudster tools
general network anomalies
These patterns can help identify transactions that may need further investigation.
Why latency is included
Latency is included to monitor system performance, not to detect fraud.
It helps show whether AML checks are running quickly enough to support real‑time decisions and meet operational or regulatory expectations.
Fraud Flag meaning
The dataset includes a Fraud Flag column:
TRUE = the transaction has been labelled as potentially fraudulent
FALSE = the transaction is considered normal
This label can be used later to compare against any detection rules created during analysis.  
It also helps identify false positives, false negatives, and general patterns in flagged behaviour.
Patterns commonly associated with fraud
Fraud‑flagged transactions in the dataset often show:
sudden or unusual changes in geolocation
switching between devices (desktop to mobile)
high latency or unusual network slices
repeated failed attempts
very high transaction amounts
behaviour that doesn’t match previous patterns
Normal transactions tend to be:
consistent in location
consistent in device
moderate in amount
successful on the first attempt
using typical network slices

Understanding the Project Context 
AML anomaly detection (what it means)
This means looking for transactions that don’t fit a customer’s normal behaviour.
If something looks unusual compared to their usual pattern, it may be suspicious.

Structuring (what it is)
Structuring is when someone tries to avoid detection by breaking a large amount of money into lots of smaller transactions.
For example:
Instead of sending £12,000 once, they send £2,000 six times.

Velocity checks (what they are)
Velocity checks look for transactions happening too quickly.
For example:
A customer normally sends one payment a day, but suddenly sends twenty payments in ten minutes.
This sudden speed can indicate suspicious activity.

What the dashboard must show
The dashboard should help a compliance officer quickly understand what is happening.
It needs to show:
overall transaction activity
trends over time
unusual or suspicious patterns
the ability to click into a customer and see their full history
The goal is to make suspicious behaviour easy to spot without using technical jargon.