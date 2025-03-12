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

**Products Table**

The original Products table has limited analytical value with all items belonging to the "Sports" category. To enhance our marketing analysis, I've created a more useful version by removing the redundant Category column and adding a PriceCategory column. 

This price segmentation (High/Medium/Low) will help us analyze whether price points correlate with customer engagement and conversion rates, potentially revealing if certain price segments perform better than others. This approach allows us to identify pricing-related patterns without fabricating data. 
