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

[View Python Code here](https://github.com/Satori-NgN/Marketing-Analysis/blob/main/python/Sentiment_Analysis.ipynb)

## Key Visualizations

![Data Visualization](https://github.com/Satori-NgN/Marketing-Analysis/blob/main/python/sentiment_analysis_visualizations.png)

The visualizations reveal:

- **Sentiment Distribution**: 61.6% of reviews are positive, with the remaining ~38% distributed across negative and mixed sentiment categories. This shows that while most customers are satisfied, a significant portion express concerns.

- **Rating-Sentiment Correlation**: Reviews with 4-5 star ratings consistently show positive sentiment scores, while 1-3 star ratings correlate with negative sentiment. The correlation validates our approach but also highlights cases of mixed sentiment.

- **Sentiment Buckets**: Most reviews fall in the mildly positive (0.0 to 0.49) category, followed by strongly positive (0.5 to 1.0) and mildly negative (-0.49 to 0.0) sentiments.

- **Review Length vs. Sentiment**: The scatter plot shows no strong correlation between review length and sentiment, suggesting that customer opinions are expressed regardless of verbosity.

## Key Findings

- **Mixed Sentiment Detection**: Reviews like "Good quality, but could be cheaper" receive mixed sentiment classifications, revealing nuances that ratings alone wouldn't capture.

- **Rating-Sentiment Mismatches**: Some 3-star reviews contain distinctly negative language, while others contain positive sentiment, suggesting different customer expectations.

- **Price Sensitivity**: Reviews mentioning price often received mixed sentiment scores regardless of rating, indicating this as a potential pain point.
