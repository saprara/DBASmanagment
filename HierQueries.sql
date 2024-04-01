--SELECT I_ID, I_Name,I_color,I_Composition_ID,LEVEL
--FROM s7.Item
--START WITH I_ID = 1
----CONNECT BY PRIOR I_ID=I_Composition_ID this goes downwards
-- CONNECT BY PRIOR I_Composition_ID = I_ID
--
--ORDER BY LEVEL, I_ID;
SELECT employee_id, FIRST_NAME,LAST_NAME,  LEVEL 

FROM HR.employees
START WITH first_name='Lex' AND last_name='De Haan'

CONNECT BY PRIOR employee_id=manager_id
ORDER BY LEVEL 
