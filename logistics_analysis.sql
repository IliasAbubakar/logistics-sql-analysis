-- ============================================
-- LOGISTICS SQL ANALYSIS
-- Complete Set of Queries (10 Queries)
-- ============================================

-- 1. Which month had the lowest total export value?
SELECT month, SUM(Export_Value) AS Lowest_Total_Export_Value
FROM shipments
GROUP BY month
ORDER BY Lowest_Total_Export_Value ASC
LIMIT 1;

-- 2. List ports with average delivery time faster than 4 days.
SELECT Port_Name, AVG(Delivery_Days) AS AVG_DELIVERY_DAYS
FROM shipments
GROUP BY Port_Name
HAVING AVG(Delivery_Days) < 4;

-- 3. Total trade balance for each product category.
SELECT Product_Category, SUM(Trade_Balance) AS Total_Trade_Balance
FROM shipments
GROUP BY Product_Category
ORDER BY Total_Trade_Balance DESC;

-- 4. How many shipments had a delivery time of more than 5 days?
SELECT COUNT(*) AS Shipments_Over_5_Days
FROM shipments
WHERE Delivery_Days > 5;

-- 5. Total export value and average delivery time for each port type.
SELECT Port_Type, 
		SUM(Export_Value) AS Total_Export_Value,
        AVG(Delivery_Days) AS AVG_Delivery_Time
FROM shipments
GROUP BY Port_Type;

-- 6. Which port generated the highest total export value?
SELECT 
	Port_Name, 
	SUM(Export_Value) AS Total_Export_Value
FROM shipments
GROUP BY Port_Name
ORDER BY Total_Export_Value DESC
LIMIT 1;

-- 7. Which product category had the highest average export value?
SELECT 
	Product_Category, 
    AVG(Export_Value) AS Highest_Avg_Export_Value
FROM shipments
GROUP BY Product_Category
ORDER BY Highest_Avg_Export_Value DESC
LIMIT 1;

-- 8. Find the total exports and imports for each month.
SELECT Month, 
	SUM(Export_Value) AS Total_Exports,
    SUM(Import_Value) AS Total_Imports
FROM shipments
GROUP BY Month;

-- 9. Which port has the fastest average delivery time?
SELECT Port_Name, 
	AVG(Delivery_Days) AS Fastest_AVG_Delivery_Time
FROM shipments
GROUP BY Port_Name
ORDER BY Fastest_AVG_Delivery_Time ASC   -- ✅ FIXED! ASC for fastest
LIMIT 1;

-- 10. Show all ports whose total trade balance is negative.
SELECT Port_Name,
	SUM(Trade_Balance) AS Negative_Trade_Balance
FROM shipments
GROUP BY Port_Name
HAVING SUM(Trade_Balance) < 0
ORDER BY Negative_Trade_Balance ASC;
