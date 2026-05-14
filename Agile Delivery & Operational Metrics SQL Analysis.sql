/* ============================================================
   Project: Agile Delivery & Operational Metrics SQL Analysis
   Purpose: Analyze Agile delivery work items using SQL
   ============================================================ */

USE AgileDeliveryPortfolio;
GO

/* 1. Validate row count */
SELECT COUNT(*) as total_row_count
FROM agile_delivery_work_items;

/* 2. Preview final table */
SELECT TOP 20 *
FROM agile_delivery_work_items;

/* 3. Data Quality Check: Check Null Values */
SELECT 
	COUNT(*) AS total_row_count,
	SUM(CASE WHEN work_item_id IS NULL THEN 1 ELSE 0 END) AS missing_work_item_id,
	SUM(CASE WHEN created_date IS NULL THEN 1 ELSE 0 END) AS missing_created_date,
	SUM(CASE WHEN closed_date IS NULL THEN 1 ELSE 0 END) AS missing_closed_date,
	SUM(CASE WHEN cycle_time_days IS NULL THEN 1 ELSE 0 END) AS missing_cycle_time
FROM agile_delivery_work_items;

/* 4. Data Quality Check: Closed Items Missing Closed Date or Cycle Time */
SELECT 
    COUNT(*) AS invalid_closed_records
FROM agile_delivery_work_items
WHERE status = 'Closed'
	AND (closed_date IS NULL OR cycle_time_days IS NULL);

/* 5. KPI Summary */
SELECT
	COUNT(*) AS total_work_items,
	SUM(CASE WHEN status <> 'Closed' THEN 1 ELSE 0 END) AS open_work_items,
	SUM(CASE WHEN status = 'Closed' THEN 1 ELSE 0 END) AS closed_work_items,
	AVG(CASE WHEN status = 'Closed' THEN cycle_time_days END) AS avg_cycle_time,
	SUM(CASE WHEN cycle_time_days > 10 THEN 1 ELSE 0 END) AS sla_breaches
FROM agile_delivery_work_items;

/* 6. Work Item Count by Status */
SELECT
	status, 
	COUNT(*) AS work_item_count
FROM agile_delivery_work_items
GROUP BY status
ORDER BY work_item_count DESC;

/* 7. Workload Distribution by Team */
SELECT
	team,
	COUNT(*) AS work_item_count
FROM agile_delivery_work_items
GROUP BY team
ORDER BY work_item_count DESC;

/* 8. Average Cycle Time by Priority */
SELECT
	priority,
	COUNT(*) AS work_item_count
FROM agile_delivery_work_items
GROUP BY priority
ORDER BY work_item_count DESC;

/* 9. Sprint Velocity */
SELECT
	sprint,
	COUNT(*) AS work_item_count
FROM agile_delivery_work_items
GROUP BY sprint
ORDER BY sprint ASC;

/* 10. SLA Breach Overview */
SELECT
	CASE
		WHEN cycle_time_days > 10 THEN 'SLA Breach'
		WHEN cycle_time_days IS NULL THEN 'Not Closed'
		ELSE 'Within SLA'
	END AS sla_staus,
	COUNT(*) AS work_item_count
FROM agile_delivery_work_items
GROUP BY
	CASE
		WHEN cycle_time_days > 10 THEN 'SLA Breach'
		WHEN cycle_time_days IS NULL THEN 'Not Closed'
		ELSE 'Within SLA'
	END;

/* 11. Monthly Work Item Trend */
SELECT
	FORMAT(created_date, 'yyyy-MM') AS created_month,
	COUNT(*) as work_item_count
FROM agile_delivery_work_items
GROUP BY FORMAT(created_date, 'yyyy-MM')
ORDER BY created_month;

/* Bug Volume by Sprint */
SELECT
	sprint,
	COUNT(*) AS bug_count
FROM agile_delivery_work_items
WHERE work_item_type = 'Bug'
GROUP BY sprint
ORDER BY sprint;

/* 13. Reopened Work Items by Team */
SELECT
	team,
	COUNT(*) AS total_work_items,
	SUM(CASE WHEN reopened = 'Yes' THEN 1 ELSE 0 END) AS reopened_items,
	CAST(100.0*SUM(CASE WHEN reopened = 'Yes' THEN 1 ELSE 0 END)/COUNT(*) AS DECIMAL(5,2)) AS reopened_rate_percent
FROM agile_delivery_work_items
GROUP BY team
ORDER BY reopened_rate_percent DESC;

/*14. Escalated Work Items by Priority */
SELECT
	priority,
	COUNT(*) AS total_work_items,
	SUM(CASE WHEN escalated = 'Yes' THEN 1 ELSE 0 END) AS escalated_items,
	CAST(100.0*SUM(CASE WHEN escalated = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) AS DECIMAL(5,2)) AS escalation_rate_percent
FROM agile_delivery_work_items
GROUP BY priority
ORDER BY escalation_rate_percent DESC;

/* 15. Cycle Time by Work Item Type */
SELECT
	work_item_type,
	COUNT(*) AS closed_items,
	AVG(cycle_time_days) AS avg_cycle_time_days,
	MIN(cycle_time_days) AS min_cycle_time_days,
	MAX(cycle_time_days) AS max_cycle_time_days
FROM agile_delivery_work_items
WHERE status = 'Closed'
GROUP BY work_item_type
ORDER BY avg_cycle_time_days DESC;

/* 16. Backlog by Team */
SELECT
	team,
	COUNT(*) AS open_backlog_items
FROM agile_delivery_work_items
WHERE status <> 'Closed'
GROUP BY team
ORDER BY open_backlog_items DESC;

/* 17. Priority Distribution */
SELECT
	priority,
	COUNT(*) AS work_item_count
FROM agile_delivery_work_items
GROUP BY priority
ORDER BY work_item_count DESC;

/* 18. Create Final Analytical View */
USE AgileDeliveryPortfolio;
GO

CREATE VIEW vw_agile_delivery_reporting AS
SELECT
	work_item_id,
	sprint,
	work_item_type,
	priority,
	team,
	assigned_to,
	status,
	created_date,
	closed_date,
	story_points,
	cycle_time_days,

	CASE
		WHEN status <> 'Closed' THEN 'Open Backlog'
		ELSE 'Closed'
	END AS backlog_status,

	CASE
		WHEN cycle_time_days > 10 THEN 'SLA Breach'
		WHEN cycle_time_days IS NULL THEN 'Not Closed'
		ELSE 'Within SLA'
	END AS sla_status,

	CASE
		WHEN cycle_time_days <= 5 THEN '0-5 Days'
		WHEN cycle_time_days <= 10 THEN '6-10 Days'
		WHEN cycle_time_days > 10 THEN '11+ Days'
	END AS cycle_time_bucket,

	reopened,
	escalated

FROM agile_delivery_work_items;

/* 19. Validate view */
SELECT *
FROM vw_agile_delivery_reporting;



