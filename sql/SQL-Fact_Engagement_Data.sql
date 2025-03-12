
-- 1. Initial overview of the Engagement data table
SELECT *
FROM dbo.engagement_data

-- 2. Clean and normalize the Engagement data table
SELECT
	EngagementID, -- Select unique identifier for each engagement record
	ContentID,	-- Select unique identifier for each piece of content
	CampaignID,	-- Select unique identifier for associated marketing campaign
	ProductID,	-- Select unique identifier for each product
	UPPER(REPLACE(ContentType, 'socialmedia', 'Social Media')) AS ContentType,	-- Adds space between "Social" and "Media" and standardize all ContentType values to uppercase
	LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) -1) AS Views,	-- Extract views data (numbers before the hyphen)
	RIGHT(ViewsClicksCombined, LEN(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) AS Clicks,	-- Extract clicks data (numbers after the hyphen)
	/*	SUBSTRING alternative for splitting the combined metrics:
		SUBSTRING(ViewsClicksCombined, 1, CHARINDEX('-', ViewsClicksCombined) - 1) AS Views,
		SUBSTRING(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) + 1, LEN(ViewsClicksCombined)) AS Clicks,	*/
	Likes,	-- Number of likes received
	FORMAT(CONVERT(DATE, EngagementDate), 'dd.MM.yyyy') AS EngagementDate	-- Converts and formats the date as dd.MM.yyyy
FROM
	dbo.engagement_data	--The souce table from which to select the data