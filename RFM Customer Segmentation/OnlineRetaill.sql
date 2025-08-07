--Who are our most valuable customers?
-- Which customers are at risk of churning?
-- Which customers used to buy frequently but have stopped?
-- Which customers should receive re-engagement campaigns?
-- Which customers are most likely to respond to upsell or cross-sell offers?
-- How can we optimize loyalty programs for different customer segments?
SELECT * FROM [dbo].[tableRetail]

-- SALE ANALYSIS
-- YEAR
SELECT 
	Year(InvoiceDate)as Year, 
	COUNT(DISTINCT Customer_ID) as Customer,
	ROUND(SUM(Price * Quantity),2) as Amount
FROM [dbo].[tableRetail]
GROUP BY Year(InvoiceDate)

-- Finding # of customers, # of orders and the avg paid price per country 
SELECT 
	Country,
	COUNT(DISTINCT Customer_ID) as Customer,
	COUNT(DISTINCT Invoice) as 'Total Order',
	ROUND(AVG(Price * Quantity),2) as 'Average Payment'
FROM [dbo].[tableRetail]
GROUP BY Country

-- Figuring out the number of orders per date
SELECT 
	CAST(InvoiceDate AS DATE) AS OrderDate,
	COUNT(DISTINCT Invoice) as [Total Order]
FROM [dbo].[tableRetail]
GROUP BY CAST(InvoiceDate AS DATE)
ORDER BY OrderDate

-- Figuring out the quantities ordered per date
SELECT 
	CAST(InvoiceDate AS DATE) AS OrderDate,
	SUM(Quantity) AS 'Total Quantity'
FROM [dbo].[tableRetail]
GROUP BY CAST(InvoiceDate AS DATE)
ORDER BY OrderDate

-- RFM
WITH RFM AS (
	SELECT DISTINCT Customer_ID,
		MAX(CAST(InvoiceDate AS DATE)) AS 'Last Order Date',
		COUNT(DISTINCT Invoice) as 'Total Count',
		ROUND(SUM(Price * Quantity),2) as 'Total Amount'
	FROM [dbo].[tableRetail]
	GROUP BY Customer_ID
	),
	RFM2 AS (
    SELECT DISTINCT Customer_ID AS customer_id,
		(SELECT MAX(CAST(InvoiceDate AS DATE)) FROM [dbo].[tableRetail]) AS Max_order_date,
        DATEDIFF(DD, [Last Order Date],(SELECT MAX(CAST(InvoiceDate AS DATE)) FROM [dbo].[tableRetail]))  AS recency,
        [Total Count],
        [Total Amount]
    FROM RFM
),
Customer_segment AS(
	SELECT customer_id,
	NTILE(5) OVER(ORDER BY recency DESC) AS Recency,
	NTILE(5) OVER(ORDER BY [Total Count]) AS Frequency,
	NTILE(5) OVER(ORDER BY [Total Amount]) AS Monetary
	FROM RFM2
)
SELECT 
	customer_id,
	Recency,
	Frequency,
	Monetary,
    CASE WHEN (Recency + Frequency + Monetary) = 15             THEN 'Champions'
         WHEN (Recency + Frequency + Monetary) >= 12            THEN 'Loyal Customers'
         WHEN (Recency + Frequency + Monetary) BETWEEN 9 AND 11 THEN 'Potential Loyalists'
         WHEN (Recency + Frequency + Monetary) BETWEEN 6 AND 8  THEN 'Customers Needing Attention'
         WHEN (Recency + Frequency + Monetary) BETWEEN 4 AND 5  THEN 'Hibernating'
         WHEN (Recency + Frequency + Monetary) <= 3             THEN 'Lost'
    END AS customer_segment
FROM Customer_segment

