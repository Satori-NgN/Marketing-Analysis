
-- 1. Initial overview of the Customers table and Geography table
SELECT *
FROM dbo.customers

SELECT *
FROM dbo.geography

-- 2. Join dim_customers with dim_geography to enrich customer data with geographic information
-- Using LEFT JOIN to ensure we don't miss any customers, even those without location data
-- In this case, all customers have valid GeographyIDs, so a INNER JOIN (or JOIN) would give the same result
SELECT
	c.CustomerID,	-- Select unique customer identifier
	c.CustomerName,	-- Select customer's name
	c.Email,	-- Select customer's email
	c.Gender,	-- Select customer's gender
	c.Age,	-- Select customer's age
	CASE	-- Create age groups for demographic segmentation
		WHEN c.Age < 25 THEN 'Young Adult'
		WHEN c.Age BETWEEN 25 AND 40 THEN 'Adult'
		ELSE 'Senior Adult'
	END AS AgeGroup,
	g.Country,	-- Select customer's country from the geography table
	g.City	 -- Select customer's city from the geography table
FROM 
	dbo.customers AS c	-- Alias 'c' for the dim_customers table
JOIN
	dbo.geography AS g	-- Alias 'g' for the dim_geography table
ON c.GeographyID = g.GeographyID;	-- Join condition
