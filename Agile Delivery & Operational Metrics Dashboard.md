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
<a href="https://github.com/CandiceSaunders/SQL-Repository/blob/main/Agile%20Delivery%20%26%20Operational%20Metrics%20SQL%20Analysis.sql">SQL Validation Script</a>. A few of the validation checks performed have been called out below.
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

<h2>SQL Reporting View / Architecture</h2>

To prepare the data for reporting, I created a SQL reporting view that serves as the final reporting layer for the Power BI dashboard. Instead of connecting Power BI directly to the raw work item table, the view was used to centralize reporting logic and prepare the dataset for analysis ahead of time.

The view includes the original work item data along with additional reporting fields used throughout the dashboard, including:

- backlog_status to identify open backlog vs. closed work items
- sla_status to classify whether work items were within SLA, breached SLA, or still open
- cycle_time_bucket to group work items into reporting categories based on cycle time
- sprint_sort to support proper sprint ordering within Power BI visuals

Building the reporting view in SQL helped simplify the Power BI layer by handling business logic, reporting classifications, and transformation steps before the data was loaded into the dashboard.

<h2>Dashboard Preview</h2>
<img width="1780" height="930" alt="image" src="https://github.com/user-attachments/assets/f9f4265b-b073-402e-a2d9-9313244dfbef" />

<h2>Key Insights</h2>

- Claims and Reporting teams handled the highest workload volume.
- SLA breaches represented a significant portion of open work items.
- Lower-priority work items showed slightly lower average cycle times.
- Sprint throughput fluctuated across reporting periods, indicating varying delivery capacity.

<h2>Deliverables / Files</h2>

- [Agile Delivery Dashboard (.pbix)]()
- [Raw Data (CSV File)]()
- [SQL Validation Check Script](https://github.com/CandiceSaunders/SQL-Repository/blob/main/Agile%20Delivery%20%26%20Operational%20Metrics%20SQL%20Analysis.sql)

