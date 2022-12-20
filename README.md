# Amazon_Vine_Analysis
## Overview of the analysis
The purpose of this analysis was to determine any bias on reviews from products provided to Amazon Vine members. A raw dataset was selected from Amazon Review datasets and PySpark was used to perform the ETL process to extract the dataset, transform the data, connect to an AWS RDS instance, and load the transformed data into pgAdmin. Next, SQL was used to perform analysis and determine if there is any bias towards favorable reviews from Vine members in the dataset.

## Results
- There were a total of 1068 reviews on the product dataset selected. Of the 1068 reviews, only 4 reviews were Vine reviews, and 1064 were non-Vine reviews.
- There was only one Vine review that was 5 stars, and 527 non-Vine reviews were five stars.
- 25% of Vine reviews were five stars, and 49.5% of non-Vine reviews were five stars.

## Summary
Based on the results, with only 25% of Vine reviews being five stars, there does not seem to be any positivity bias for reviews in the Vine program. However, the sample size of only four Vine reviews with one being five stars is too small to make a definitive conclusion on. 
I would recommend performing the same analysis on multiple product datasets in order to come to a more informed decision. 
