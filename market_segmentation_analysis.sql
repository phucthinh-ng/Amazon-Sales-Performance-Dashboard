SELECT 
    "ship-state" AS State,
    COUNT("Order ID") AS Total_Orders,
    SUM(Amount) AS Total_Revenue,
    
    DENSE_RANK() OVER (ORDER BY SUM(Amount) DESC) AS Revenue_Rank,

    CASE 
        WHEN SUM(Amount) >= 5000000 THEN 'Tier 1: High Value'  
        WHEN SUM(Amount) >= 1000000 THEN 'Tier 2: Potential'   
        ELSE 'Tier 3: Low Performance'                        
    END AS Market_Tier
    
FROM Amazon_Sale_Report_Cleaned
GROUP BY "ship-state"
ORDER BY Revenue_Rank ASC;