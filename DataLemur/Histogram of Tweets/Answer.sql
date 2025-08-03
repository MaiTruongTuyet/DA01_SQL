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
