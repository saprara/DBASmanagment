--1)SELECT PROD_ID,
--UNIT_COST - (AVG(UNIT_COST) OVER()) AS "ALL AVG"
--FROM SH.costs;



SELECT PROD_ID,
UNIT_COST - (AVG(UNIT_COST) OVER( PARTITION BY PROD_ID )) AS "ALL AVG"
FROM SH.costs;