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
