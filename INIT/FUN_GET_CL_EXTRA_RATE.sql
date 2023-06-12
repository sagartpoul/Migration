create or replace 
FUNCTION FUN_GET_CL_EXTRA_RATE
(
p_CL_APP_FROM DATE,
p_INT_CAT NUMBER
)
RETURN NUMBER IS
v_INT_RATE NUMBER(1);
v_DATE DATE;
v_INT_RATE_CHAR VARCHAR2(5);
BEGIN

    BEGIN
    
    SELECT APP_FROM, INT_RATE INTO v_DATE, v_INT_RATE_CHAR FROM
    (
       SELECT APP_FROM, INT_RATE, ROWNUM FROM MAIN_DEP_CAT 
       WHERE APP_FROM <= p_CL_APP_FROM AND INT_CAT = p_INT_CAT
       ORDER BY APP_FROM DESC         
     )
   WHERE ROWNUM=1;
    --  WHERE APP_FROM <= TO_DATE('01-JAN-09','DD-MON-YY') AND INT_CAT = 3
    
    /*
      SELECT APP_FROM, INT_RATE INTO v_DATE, v_INT_RATE_CHAR  
      FROM 
      (
        SELECT APP_FROM, INT_RATE, ROWNUM FROM MAIN_DEP_CAT 
        WHERE APP_FROM <= p_CL_APP_FROM AND INT_CAT = p_INT_CAT
        ORDER BY APP_FROM DESC
      )
      WHERE ROWNUM = 1;
      */
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_INT_RATE_CHAR := '0';
    END;
    
       BEGIN
          v_INT_RATE := CAST( v_INT_RATE_CHAR AS NUMBER );
          EXCEPTION
            WHEN OTHERS THEN
              v_INT_RATE := 0;
       END;  
       
       RETURN v_INT_RATE;
 
END FUN_GET_CL_EXTRA_RATE;
/