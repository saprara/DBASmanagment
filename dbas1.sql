--SET SERVEROUTPUT ON
--DECLARE
--    l_num INTEGER:=0;
--    l_str VARCHAR2(2):=', ';
--BEGIN
--FOR i IN 1..100 LOOP
--    IF MOD(i,2)!=0 THEN
--        DBMS_OUTPUT.PUT_LINE(i||l_str);
--    END IF;
--END LOOP;
--END;









--
--SET SERVEROUTPUT ON
--DECLARE
--    l_id sh.Customers.Cust_ID%TYPE;
--    l_fname sh.Customers.Cust_First_Name%TYPE;
--    l_lname sh.Customers.Cust_Last_Name%TYPE;
--BEGIN
--    SELECT Cust_ID,Cust_First_Name,Cust_Last_Name
--    INTO l_id,l_fname,l_lname
--    FROM sh.Customers
----    WHERE Cust_ID=1;
--    DBMS_OUTPUT.PUT_LINE(l_id||' '||
--                         l_fname||' '||
--                         l_lname);
--END;



--SET SERVEROUTPUT ON
--DECLARE
--     l_id sh.Customers.Cust_ID%TYPE;
--    l_fname sh.Customers.Cust_First_Name%TYPE;
--    l_lname sh.Customers.Cust_Last_Name%TYPE;
--    CURSOR cr IS SELECT  Cust_ID,Cust_First_Name,Cust_Last_Name
--        FROM sh.Customers
--        WHERE Cust_ID<100;
--BEGIN
--OPEN cr;
--LOOP
--    FETCH cr INTO l_id,l_fname,l_lname;
--    
--    DBMS_OUTPUT.PUT_LINE(l_id||' '||
--                         l_fname||' '||
--                         l_lname);
--    EXIT WHEN cr%NOTFOUND;
--     END LOOP;
--     CLOSE cr;
--END;




--SET SERVEROUTPUT ON
--DECLARE
--    TYPE rec_Cust IS RECORD
--    (l_id NUMBER,
--    l_fname VARCHAR2(20),
--    l_lname VARCHAR2(40));
--    Cust Rec_Cust;
--   
--    CURSOR cr IS SELECT  Cust_ID,Cust_First_Name,Cust_Last_Name
--        FROM sh.Customers
--        WHERE Cust_ID<100;
--BEGIN
--OPEN cr;
--LOOP
--    FETCH cr INTO Cust;
--    
--    DBMS_OUTPUT.PUT_LINE(Cust.l_id||' '||
--                         Cust.l_fname||' '||
--                        CUST.l_lname);
--    EXIT WHEN cr%NOTFOUND;
--     END LOOP;
--     CLOSE cr;
--END;




--SET SERVEROUTPUT ON
--DECLARE
--
--    TYPE rec_Cust IS RECORD
--(
--    l_id NUMBER,
--    l_fname VARCHAR2(20),
--    l_lname VARCHAR2(40)
-- );
--    Cust Rec_Cust;
--   TYPE Arr_Cust IS TABLE OF rec_Cust;
--   l_cust Arr_Cust;
--    CURSOR cr IS SELECT  Cust_ID,Cust_First_Name,Cust_Last_Name
--        FROM sh.Customers
--        WHERE Cust_ID<5;
--BEGIN
--    OPEN cr;
--        FETCH cr BULK COLLECT INTO l_cust;
--    CLOSE cr;
--    FOR i IN 1..l_cust.LAST LOOP
--    DBMS_OUTPUT.PUT_LINE(l_cust(i).l_id||' '||
--                         l_cust(i).l_fname||' '||
--                        l_cust(i).l_lname);
--   
--     END LOOP;
--    
--END;
--


--


