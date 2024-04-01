-- Create Oracle stored procedure that will copy all sales that were made in a certain year from 
--sh.sales table to mysales table . You need to pass the year as an argument to the procedure.
--You must use bulk operators in this code

--CREATE TABLE mysales AS SELECT * FROM sh.sales where 1 = 2

CREATE OR REPLACE PROCEDURE COPYTABLE(sales_year  NUMBER) IS
 

   TYPE arr_sales IS TABLE OF sh.sales%ROWTYPE;
   l_sales arr_sales;
   
CURSOR cr IS SELECT *
                FROM sh.sales
                WHERE EXTRACT(YEAR FROM TIME_ID) = sales_year;
BEGIN
    OPEN cr;
        FETCH cr BULK COLLECT INTO l_sales;
    CLOSE cr;
    FORALL i IN 1.. l_sales.LAST
        INSERT INTO mysales VALUES l_sales(i);
        COMMIT;
END;


EXECUTE COPYTABLE(1998);
SELECT * FROM mysales
 

                


