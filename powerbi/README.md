# Part 3: Data Visualization with Power BI

In this part, I utilized Power BI to create interactive visualizations based on the cleaned and prepared data. This involved importing data from SQL Server, transforming it within Power BI, and establishing relationships between tables to build a coherent data model. Key performance indicators (KPIs) and measures were defined using DAX to facilitate dynamic analysis. 

The visualizations included dashboards and detailed pages focusing on conversion rates, social media engagement, and customer reviews.

Interactive report can be downloaded [here](https://github.com/Satori-NgN/Marketing-Analysis/blob/0752c49e110952e384bc0d50f287b7bfb9a1a76e/powerbi/Marketing%20Analysis%20Dashboard.pbix)

## Data Modeling

- Establish One-to-Many relationships between Fact and Dimension tables to create a Snowflake schema data model.
- Create a date table to facilitate time-based analysis.

![Data model](https://github.com/Satori-NgN/Marketing-Analysis/blob/0905d3ac51ff6ccfa16600359f54c77003807cf3/powerbi/image/pbi%201.png)

## Creating Calculations in DAX

Create specific measures for calculations using DAX. Key measures include: clicks, likes, views, number of campaigns, number of customer journeys, number of customer reviews, average rating, and conversion rate.

## Data Visualization and Findings

### Overview

- _**Decreased Conversion Rates**_: The conversion rate demonstrated a strong rebound in December, reaching 10.3%, despite a notable dip to 5.1% in October.
- _**Reduced Customer Engagement**_:

  • There is a decline in overall social media engagement, with views dropping throughout the year.
  
  • While clicks and likes are low compared to views, the click-through rate stands at 15.37%, meaning that engaged users are still interacting effectively.

- _**Customer Feedback Analysis**_:

  • Customer ratings have remained consistent, averaging around 3.7 throughout the year.
  
  • target of 4.0, suggesting a need for focused improvements in customer satisfaction, for products below 3,5.

![Overview](https://github.com/Satori-NgN/Marketing-Analysis/blob/0905d3ac51ff6ccfa16600359f54c77003807cf3/powerbi/image/pbi%202.png)

### Decreased Conversion Rates

- _**General Conversion Trend**_: Throughout the year, conversion rates varied, with higher numbers of products converting successfully in months like February and September. This suggests that while some products had strong seasonal peaks, there is potential to improve conversions in lower-performing months through targeted interventions.
-  _**Lowest Conversion Month**_: May experienced the lowest overall conversion rate at 4.5%, with no products standing out significantly in terms of conversion. This indicates a potential need to revisit marketing strategies or promotions during this period to boost performance.
-  _**Highest Conversion Rates**_: January recorded the highest overall conversion rate at 19.6%, driven significantly by the Ski Boots with a remarkable 150% conversion. This indicates a strong start to the year, likely fueled by seasonal demand and effective marketing strategies.

![Conversion Rates](https://github.com/Satori-NgN/Marketing-Analysis/blob/0905d3ac51ff6ccfa16600359f54c77003807cf3/powerbi/image/pbi%203.png)

### Reduced Customer Engagement

- _**Declining Views**_: Views peaked in March and May but declined from August and on, indicating reduced audience engagement in the later half of the year.
- _**Low Interaction Rates**_: Clicks and likes remained consistently low compared to views, suggesting the need for more engaging content or stronger calls to action.
- _**Content Type Performance**_: Blog content drove the most views, especially in May and March, while social media and video content maintained steady but slightly lower engagement.

![Customer Engagement](https://github.com/Satori-NgN/Marketing-Analysis/blob/0905d3ac51ff6ccfa16600359f54c77003807cf3/powerbi/image/pbi%204.png)

### Customer Feedback Analysis

- _**Customer Ratings Distribution**_: The majority of customer reviews are in the higher ratings, with 140 reviews at 4 stars and 135 reviews at 5 stars, indicating overall positive feedback. Lower ratings (1-2 stars) account for a smaller proportion, with 26 reviews at 1 star and 57 reviews at 2 stars.
- _**Sentiment Analysis**_: Positive sentiment dominates with 275 reviews, reflecting a generally satisfied customer base. Negative sentiment is present in 82 reviews, with a smaller number of mixed and neutral sentiments, suggesting some areas for improvement but overall strong customer approval.
- _**Opportunity for Improvement**_: The presence of mixed positive and mixed negative sentiments suggests that there are opportunities to convert those mixed experiences into more clearly positive ones, potentially boosting overall ratings. Addressing the specific concerns in mixed reviews could elevate customer satisfaction.

![Customer Feedback](https://github.com/Satori-NgN/Marketing-Analysis/blob/0905d3ac51ff6ccfa16600359f54c77003807cf3/powerbi/image/pbi%205.png)

## Proposed Actions

- **Increase Conversion Rates**

_**Target High-Performing Product Categories**_: Focus marketing efforts on products with demonstrated high conversion rates, such as Kayaks, Ski Boots, and Baseball Gloves. Implement seasonal promotions or personalized campaigns during peak months (e.g., January and September) to capitalize on these trends.

- **Enhance Customer Engagement**

_**Revitalize Content Strategy**_: To turn around declining views and low interaction rates, experiment with more engaging content formats, such as interactive videos or user-generated content. Additionally, boost engagement by optimizing call-to-action placement in social media and blog content, particularly during historically lower engagement months (September-December).

- **Improve Customer Feedback Scores**

_**Address Mixed and Negative Feedback**_: Implement a feedback loop where mixed and negative reviews are analyzed to identify common issues. Develop improvement plans to address these concerns. Consider following up with dissatisfied customers to resolve issues and encourage re-rating, aiming to move average ratings closer to the 4.0 target.
