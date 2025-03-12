# Part 1: SQL Data Extraction and Preparation

In this part, I used SQL to clean and prepare marketing data across multiple tables for analysis. This involved standardizing values, adding meaningful categorizations, removing duplicates, fixing inconsistencies, and addressing missing values.

These data preparation steps create a solid foundation for subsequent Python sentiment analysis and Power BI visualization components of the project, ensuring all insights are based on clean, standardized data.

## Data Overview

The data is the [Marketing Analytics](https://github.com/Satori-NgN/Marketing-Analysis/blob/7651ec757175241b5e16b3048ca9564cabed0f31/project-materials/PortfolioProject_MarketingAnalytics.bak).
The dataset consists of three data tables:

_**Fact tables:**_

- **Engagement Data Table**: Measure engagement with different types of content  

- **Customer Journey Table**: Track customer movements through the website to analyze the conversion tunnel 

- **Customer Review Table**: Analyze customer feedback to identify common themes and sentiment 

_**Dimension tables:**_ 

- **Customers Table**: Provide additional information about customers 

- **Geography Table**: Provide additional geographic information about customers 

- **Products Table**: Provide additional information about products

## Data Transformation

_**1. Products Table**_

The original Products table has limited analytical value with all items belonging to the "Sports" category. To enhance our marketing analysis, I've created a more useful version by removing the redundant Category column and adding a PriceCategory column. 

This price segmentation (High/Medium/Low) will help us analyze whether price points correlate with customer engagement and conversion rates, potentially revealing if certain price segments perform better than others. This approach allows us to identify pricing-related patterns without fabricating data. 

![SQL1](https://github.com/Satori-NgN/Marketing-Analysis/blob/2c6515552786f5eead5bcec613283f33df812f4c/sql/image/sql1.png)

_**2. JOIN customers and geography tables to enrich customer data with geographic information**_ 

As the geography table (10 rows) is a subset of the customers table (100 rows), I’ve used a LEFT JOIN to ensure we don't miss any customers without location data. However, our examination shows that all customers have valid GeographyIDs. Therefore, an INNER JOIN (JOIN) gives the same result. 

I've added an AgeGroup classification to enable age-based demographic analysis, which will help ShopEasy identify if certain age segments show different engagement patterns. 

![SQL2](https://github.com/Satori-NgN/Marketing-Analysis/blob/2c6515552786f5eead5bcec613283f33df812f4c/sql/image/sql2.png)

_**3. Customer reviews table**_

In the Customer reviews table, I've identified an issue with the ReviewText column containing double spaces that could affect text analysis and readability. The query uses the REPLACE function to convert all double spaces to single spaces, creating a standardized text format. This cleansing step is essential for accurate sentiment analysis later on. 

Additionally, the Review date is reformatted into dd.MM.yyyy. For date formatting, I combined FORMAT and CONVERT functions rather than just FORMAT function to ensure that any time components are removed and validates each value is a proper date, providing greater data integrity. 

![SQL3](https://github.com/Satori-NgN/Marketing-Analysis/blob/2c6515552786f5eead5bcec613283f33df812f4c/sql/image/sql3.png)

_**4. Engagement data table**_

The original Engagement data table contained several issues that could impact accurate analysis. 

- Problem 1: Inconsistent content type formatting 

Solution: Standardizing ContentType to uppercase with proper spacing 

- Problem 2: Combined views and clicks metrics in a single column 

Solution: Splitting the combined ViewsClicksCombined column into separate Views and Clicks metrics. For splitting the combined metrics, I chose LEFT and RIGHT functions over SUBSTRING because they provide more intuitive and potentially more efficient string manipulation. LEFT extracts everything before the hyphen (views), while RIGHT calculates and extracts everything after the hyphen (clicks). The SUBSTRING alternative (shown in comments) accomplishes the same goal but may be less readable. 

- Problem 3: Non-standardized date format 

Solution: Reformatting dates into dd.MM.yyyy 

![SQL4](https://github.com/Satori-NgN/Marketing-Analysis/blob/2c6515552786f5eead5bcec613283f33df812f4c/sql/image/sql4.png)

_**5. Customer journey table**_

Before cleaning the Customer Journey data, I checked for duplicate records by comparing total rows with distinct business-relevant combinations. The results confirmed the presence of duplicate records, indicating that deduplication should be included in the data cleaning process. The original customer journey table also contained other issues: missing values (NULL) in the Duration column for Checkout drop-offs, inconsistent capitalization in the Stage column, and non-standardized date formats.

![SQL5](https://github.com/Satori-NgN/Marketing-Analysis/blob/2c6515552786f5eead5bcec613283f33df812f4c/sql/image/sql5.png)

I implemented a data cleaning approach using a Common Table Expression (CTE) to calculate date-specific average durations, followed by deduplication using ROW_NUMBER function, standardization of Stage values to uppercase, reformatting of dates, and replacement of NULL values with relevant averages. 

I used ROW_NUMBER instead of SELECT DISTINCT because it provides control over which version of duplicate records to keep (lowest JourneyID) and allows simultaneous application of other transformations. 

NULL values were replaced with average duration by date rather than a global average to preserve temporal patterns that might reflect seasonal factors, marketing campaigns, or website changes. 

![SQL6](https://github.com/Satori-NgN/Marketing-Analysis/blob/2c6515552786f5eead5bcec613283f33df812f4c/sql/image/sql6.png)
