# SC-Venue-sustainability-learning-SQL-project
This project was created to develop intermediate SQL skills including joins, aggregations, and CTEs. It uses estimated data based on industry benchmarks to analyze how energy consumption differs across South Carolina entertainment venues. It compares concerts, professional sports, and college sports events across 8 venues from 2023 to 2025. 
# SC Venue Sustainability Project

## Overview
Analysis of energy efficiency across 8 South Carolina 
venues using SQLite. Compares sustainability across 
concert, professional sports, and college sports events.

## Data Sources
- Energy benchmarks sourced from Green Sports Alliance
- Created formula: 15,000 base *(capacity/70,000) * Leed(.65 if yes 1 if no)* Roof(1.15 if indoor 1 if outdoor)* attendance factor (.3*(attendance/capacity)+.7) for kWh
- Attendance figures from public records
- LEED certification data from US Green Building Council
- Estimated values documented in queries.sql comments

## Schema
- Venues — 8 SC venues with capacity and certification data
- Events — 40 events across 2023-2025
- Energy Usage — kwh consumption scaled by capacity and attendance

## Key Queries
1. Energy efficiency per attendee by event type
2. Most efficient venues per attendee 
3. LEED certification impact on energy consumption 
4. Year over year efficiency trend by venue 
5. Composite sustainability score and final ranking

## Key Findings
<img width="367" height="137" alt="image" src="https://github.com/user-attachments/assets/e2c633c7-45d6-4d98-bab1-78ebfbc913cd" />

-Query indicates that in South Carolina pro sports produce the most kWh per attendee on average where as college sports produce the least. This is likely due to college sports having the highest attendace percentages.

<img width="455" height="237" alt="image" src="https://github.com/user-attachments/assets/9c39f519-0018-4864-8b34-391ddf676a30" />

-Query shows that North Charelston Colesium has the highest kwh per attendee, where as Segra park is the most energy efficent.

<img width="403" height="113" alt="image" src="https://github.com/user-attachments/assets/c069f40e-831f-45ec-8ca2-5fdaa5a46d22" />

-LEED Certification does appear to have an impact on kWh

<img width="581" height="602" alt="image" src="https://github.com/user-attachments/assets/d2e686b3-79ff-4701-986a-c1ba04034267" />

-Shows emmisions getting worse overtime for most venues, however as there was often only one 2025 event for most venues, singularly low attendance could screw this result

<img width="720" height="251" alt="image" src="https://github.com/user-attachments/assets/a8042e65-98f2-454f-a758-9617eae72803" />

-Segra park has the best energy efficency. This makes sense because it is both outdoor and LEED certified

## What I Would Add With More Time
- Waste management table
- Transportation and transit data
- Composite score VIEW for easy querying
- Additional years of data

## What I learned
- Designing Schema and Questions
- Created Tabled
- Learned about linking tables
- Learned about data types compared to python
- REAL instead of float
- UNIQUE- limits entries for event
- Inserted Values into tables
- Querying
-  Use ORDER BY to sort the results in ascending (or descending) order. 
-  Use GROUP BY to arrange data with identical values into groups.
-  Use CASE for conditions
-  Use INNER JOIN to return rows with the matching values in both of the tables
-  CTE structure: Make a mini take by using select statements like normal and then query that table.

## Limitations and Problems
- Leed is not different enough in small numbers
- Outputs seem much too small for smaller venues
- Data was not avliable
- Currently only have one sustainability metric

## AI acknowledgement
-Claude AI was used to generate INSERT statements for the Events and Energy Usage tables after formulas were defined independently. All energy
consumption formulas were researched and designed by the author, however Claude was used to apply the math across 40 events to save time for focus on SQL schema design and querying. All CREATE TABLE statements, analytical queries, and project design decisions were written independently.
