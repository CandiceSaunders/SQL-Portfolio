# Agile Delivery & Operational Metrics Dashboard

<h2>Project Overview</h2>
This project simulates an Agile delivery and operational reporting workflow using SQL Server and Power BI. The project focuses on analyzing sprint performance, workload distribution, backlog health, cycle time trends, and SLA metrics using a custom-built dataset modeled after Agile and PMO environments.

</br>The workflow includes data ingestion, staging tables, validation checks, reporting views, KPI analysis, and dashboard reporting to support operational insights and business-focused reporting.

<h2>Business Problem</h2>
Agile and operational teams often manage large volumes of work items across multiple teams and sprint cycles. Without centralized reporting and KPI tracking, it can be difficult to monitor delivery performance, identify bottlenecks, track SLA breaches, and understand workload distribution across teams.

</br>This project was created to simulate how SQL and reporting tools can be used to improve reporting visibility and support operational decision-making within Agile delivery environments.

<h2>Tools & Technologies</h2>

- SQL Server
- SQL Server Management Studio (SSMS)
- SQL
- Power BI
- Microsoft Excel
- DAX
- Power Query

<h2>Concepts & Skills Demonstrated</h2>

- Data Validation
- Staging Tables
- SQL Views
- KPI Analysis
- Data Transformation
- Operational Reporting
- Dashboard Development

<h2>Data Workflow / Architecture</h2>
<img width="1536" height="865" alt="image" src="https://github.com/user-attachments/assets/5e6f935b-41ed-48d5-91c2-eb8322cdf494" />

<h2>Data Validation & Transformation</h2>

<p>
Validation and transformation checks were performed to improve data quality, validate reporting logic, and ensure the dataset was prepared for downstream reporting and dashboard development. The full SQL validation and transformation workflow can be viewed in the 
<a href="YOUR_LINK_HERE">SQL Validation Script</a>.
</p></br>
  
| Validation Check | Outcome |
| ----- | ----- |
| Row Count Validation | Verified that 500 rows were successfully loaded into the final table. |
| Required Field Validation | Verified that key fields such as work_item_id, status, team, priority, and created_date were populated. |
| Duplicate Work Item Validation | Confirmed that each work_item_id was unique. |
| Null Value Validation | Verified that open work items contained expected null closed_date values. |
| Closed Item Validation | Verified that all closed work items contained appropriate closed_date values. |
| Date Logic Validation | Verified that closed_date values did not occur before created_date values. |
| Cycle Time Datatype Validation | Validated and transformed cycle_time_days values into the appropriate datatype for reporting and analysis. |
| SLA Logic Validation | Verified SLA classifications by identifying work items that exceeded the 10-day SLA threshold. |
