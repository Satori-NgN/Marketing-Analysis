
-- 1. Initial overview of the Customer journey table
SELECT *
FROM dbo.customer_journey

-- 2. Check for duplicate records in Customer journey table
SELECT
    (SELECT COUNT(*) FROM dbo.customer_journey) AS TotalRows,	-- Counts the total number of rows in the table
    (SELECT COUNT(*) FROM 
        (SELECT DISTINCT CustomerID, ProductID, VisitDate, Stage, Action 
         FROM dbo.customer_journey) AS t	-- Creates a subquery that returns only distinct combinations
    ) AS DistinctCombinations;	-- Counts the distinct combinations

-- 3. Common Table Expression (CTE) to calculate average duration for each date
WITH DateAvgDurations AS (
	SELECT 
		VisitDate,-- Group by visit date
		AVG(Duration) AS avg_duration_by_date	-- Calculate average duration for each date
	FROM dbo.customer_journey
	WHERE Duration IS NOT NULL	-- Only include non-NULL durations
	GROUP BY VisitDate	-- Group by date to get date-specific averages
)

-- 4. Deduplicate and clean customer journey data
SELECT 
	s.JourneyID,	-- Select unique journey identifier
	s.CustomerID,	-- Select unique customer identifier
	s.ProductID,	-- Select unique product identifier
	FORMAT(CONVERT(Date, s.VisitDate), 'dd.MM.yyyy') AS VisitDate,	-- Format date consistently
	UPPER(Stage) AS Stage,	-- Standardize stage name to uppercase
	s.Action,	-- Select customer action
	CASE
		WHEN s.Duration IS NULL THEN d.avg_duration_by_date	-- Replace NULL with date-specific average
		ELSE s.Duration	-- Keep original duration if not NULL
	END AS Duration
FROM (
	-- Subquery to remove duplicates
	SELECT *,
	ROW_NUMBER () OVER (
				PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action	-- Group by business keys
				ORDER BY JourneyID	-- Keep lowest JourneyID when duplicates exist
	) AS row_num
	FROM dbo.customer_journey
) AS s
LEFT JOIN DateAvgDurations AS d	-- Join with date averages
	ON s.VisitDate = d.VisitDate	-- Match on VisitDate
WHERE s.row_num = 1		-- Keep only one record from each duplicate group
ORDER BY s.CustomerID, s.ProductID, s.VisitDate;	-- Group by customer, product, and chronological order
