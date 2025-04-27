SELECT 
    "Order".Order_Priority,
    COUNT(CASE WHEN EXTRACT(YEAR FROM "Order".Order_Date) = 2012 THEN 1 END) AS "2012",
    COUNT(CASE WHEN EXTRACT(YEAR FROM "Order".Order_Date) = 2013 THEN 1 END) AS "2013",
    COUNT(CASE WHEN EXTRACT(YEAR FROM "Order".Order_Date) = 2014 THEN 1 END) AS "2014",
    COUNT(CASE WHEN EXTRACT(YEAR FROM "Order".Order_Date) = 2015 THEN 1 END) AS "2015"
FROM "Order"
GROUP BY "Order".Order_Priority
ORDER BY "Order".Order_Priority;

SELECT Region,
       segment,
       COUNT(*) AS Total_Orders
FROM "Customer"
GROUP BY Region, segment
ORDER BY Region, Total_Orders DESC;

SELECT Order_Priority,
       ROUND(AVG(Shipping_Cost), 2) AS Average_Shipping_Cost
FROM "Order"
GROUP BY Order_Priority;

SELECT "Product".Category,
       COUNT(*) AS Return_Count
FROM "Order_Details"
JOIN "Product" ON "Order_Details".Product_ID = "Product".Product_ID
GROUP BY "Product".Category
ORDER BY Return_Count DESC
LIMIT 3;

SELECT State,
       COUNT(*) AS Total_Returns
FROM "Customer"
GROUP BY State
ORDER BY Total_Returns DESC
LIMIT 5;

SELECT State,
       COUNT(*) AS Total_Returns
FROM "Customer"
GROUP BY State
ORDER BY Total_Returns ASC
LIMIT 5;

SELECT "Product".Category,
       ROUND(SUM("Order_Details".Sales), 2) AS Total_Sales
FROM "Order_Details"
JOIN "Product" ON "Order_Details".Product_ID = "Product".Product_ID
GROUP BY "Product".Category
ORDER BY Total_Sales DESC;


WITH Sales_By_State AS (
    SELECT "Customer".State,
           ROUND("Order_Details".Sales, 2) AS Sales
    FROM "Order_Details"
    JOIN "Order" ON "Order_Details".Order_ID = "Order".Order_ID
    JOIN "Customer" ON "Order".Customer_ID = "Customer".Customer_ID
)
SELECT State,
       SUM(Sales) AS Total_Sales
FROM Sales_By_State
GROUP BY State
ORDER BY Total_Sales ASC
LIMIT 3;

WITH Sales_By_State AS (
    SELECT "Customer".State,
           ROUND("Order_Details".Sales, 2) AS Sales
    FROM "Order_Details"
    JOIN "Order" ON "Order_Details".Order_ID = "Order".Order_ID
    JOIN "Customer" ON "Order".Customer_ID = "Customer".Customer_ID
)
SELECT State,
       SUM(Sales) AS Total_Sales
FROM Sales_By_State
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 3;

SELECT "Customer".State,
       ROUND(AVG("Order".Shipping_Cost), 2) AS Avg_Shipping_Cost
FROM "Order_Details"
JOIN "Order" ON "Order_Details".Order_ID = "Order".Order_ID
JOIN "Customer" ON "Order".Customer_ID = "Customer".Customer_ID
GROUP BY "Customer".State
ORDER BY Avg_Shipping_Cost ASC
LIMIT 3;

SELECT "Order".ship_mode,
       COUNT(*) AS Return_Count
FROM "Order"
GROUP BY "Order".ship_mode
ORDER BY Return_Count DESC;
