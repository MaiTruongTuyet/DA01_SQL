## Histogram of Tweets
Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.

In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.

**tweets Table**:
<img width="309" height="183" alt="image" src="https://github.com/user-attachments/assets/7ecd4173-6104-4270-bd65-6790eb72188e" />


**tweets Example Input:**
<img width="718" height="210" alt="image" src="https://github.com/user-attachments/assets/90abc6f7-21bc-4492-852b-0e3c07d1f852" />

**Example Output:**
tweet_bucket	users_num
1	2
2	1

**Answer**
WITH CTE AS 
(SELECT COUNT(tweet_id) as tweet_bucket, user_id
FROM tweets
WHERE YEAR(tweet_date) = 2022
GROUP BY user_id 
)

SELECT tweet_bucket, COUNT(user_id) as users_num
FROM CTE
GROUP BY tweet_bucket
ORDER BY tweet_bucket
<img width="424" height="108" alt="image" src="https://github.com/user-attachments/assets/97180835-b8ee-434e-9a96-83e8f03ddfa7" />



