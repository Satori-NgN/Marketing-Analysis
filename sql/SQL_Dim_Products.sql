
-- 1. Initial overview of the Products table
SELECT *
FROM dbo.products;

-- 2. Improved Products table with PriceCategory
-- Problem: The Category column is redundant as all products are in "Sports"
-- Solution: Remove redundant column and add PriceCategory for better price segmentation
SELECT
	ProductID,	-- Select the unique product identifier
	ProductName,	-- Select product names
	Price,	-- Select product prices
	CASE	-- Create price categories (Low, Medium, or High) based on price ranges
		WHEN Price < 50 THEN 'Low'	-- If the price is less then 50, categorize as 'Low'
		WHEN Price BETWEEN 50 AND 200 THEN 'Medium'	-- If the price is between 50 and 200, categorize as 'Medium'
		ELSE 'High'	-- If the price is greater than 200, categorize as 'High'
	END AS PriceCategory	--Name the new column as PriceCategory
FROM dbo.products;	--The souce table from which to select the data
