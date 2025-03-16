# Part 2: Customer Sentiment Analysis with Python

In part 2 of the project, we built on the SQL data cleaning conducted in [Part 1](https://github.com/Satori-NgN/Marketing-Analysis/blob/main/sql/README.md) by implementing sentiment analysis on customer reviews using Python. This analysis prepares customer feedback data for visualization in Power BI, setting the foundation for addressing ShopEasy's declining customer engagement and conversion rates.

## Implementation Approach

The sentiment analysis used NLTK's VADER sentiment analyzer, which is well-suited for social media content and short customer reviews. The key advantage of this approach is the ability to detect sentiment nuances in text that star ratings alone miss.

Key implementation features:

- Connection to SQL Server database containing cleaned customer reviews

- Sentiment scoring using VADER's compound polarity scores (-1 to +1)

- Enhanced categorization combining text sentiment with numerical ratings

- Bucketing of sentiment scores for easier visualization

This approach provides the nuanced sentiment categorization that identifies cases where review text sentiment doesn't align with numerical ratings.

## Key Visualizations
