
-- 1. Initial overview of the Customer reviews table
SELECT *
FROM dbo.customer_reviews

-- 2. Clean ReviewText by replacing double spaces with single spaces
-- This improves text readability and standardizes the format for the sentimental analysis later
SELECT
	ReviewID,	-- Select unique review identifier
	CustomerID,	-- Select unique customer identifier
	ProductID,	-- Select unique product identifier
	FORMAT(CONVERT(DATE, ReviewDate), 'dd.MM.yyyy') AS ReviewDate,	-- Converts and formats the date as dd.MM.yyyy
	Rating,	-- Selects the numerical rating given by the customer
	REPLACE(ReviewText, '  ', ' ') AS ReviewText	-- Replace double spaces with single spaces
FROM 
	dbo.customer_reviews;	--The souce table from which to select the data
