SELECT I_ID, I_COST, AVG(I_COST) OVER() AS "ALL AVG",
AVG(I_COST) OVER (PARTITION BY I_ManufactureYear) AS "FOR THE YEAR" 
FROM s7.item;