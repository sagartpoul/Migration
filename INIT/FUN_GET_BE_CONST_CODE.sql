create or replace 
FUNCTION FUN_GET_BE_CONST_CODE
(
p_CL_INT_CAT VARCHAR2, --INTEREST CATEGORY
p_CL_CONST_CODE VARCHAR2 --CONSTITUTION CODE
)
RETURN VARCHAR2 IS
v_BE_CONST_CODE VARCHAR2(1);
BEGIN

	--IF (( p_CL_INT_CAT = '0' ) OR (p_CL_CONST_CODE='0')) THEN
  --  v_BE_CONST_CODE := '1';
  --ELSE
        CASE NVL(p_CL_INT_CAT,'0')
          --GENERAL
          WHEN '1' THEN v_BE_CONST_CODE := '1';
          --STAFF
          WHEN '2' THEN v_BE_CONST_CODE := 'E';
          --SENIOR CITIZEN
          WHEN '3' THEN v_BE_CONST_CODE := 'C';
          --SOCIETY
          WHEN '4' THEN
            IF ( p_CL_CONST_CODE = 4 ) THEN
              v_BE_CONST_CODE := 'R'; --CREDIT SOCIETY
            ELSE
              v_BE_CONST_CODE := 'S'; --SOCIETY
            END IF;
          --ABOVE 15 LAKHS
          WHEN '5' THEN v_BE_CONST_CODE := '1';
          --SPECIAL
          WHEN '6' THEN v_BE_CONST_CODE := '1';
          ELSE
            v_BE_CONST_CODE := 'Z'; --Other
        END CASE;

        
        IF ( p_CL_CONST_CODE = '2' ) THEN
          --PARTNER / CO.
        	v_BE_CONST_CODE := 'F';
        END IF;

        IF ( v_BE_CONST_CODE = 'Z' ) THEN
          CASE p_CL_CONST_CODE
            --INDIVIDUAL
            WHEN '1' THEN v_BE_CONST_CODE := '1';
            --PARTNER / CO.
            WHEN '2' THEN v_BE_CONST_CODE := 'F';
            --TRUST / SOCIETY
            WHEN '3' THEN v_BE_CONST_CODE := 'S';
            --CREDIT SOCIETY
            WHEN '4' THEN v_BE_CONST_CODE := 'R';
            ELSE
              v_BE_CONST_CODE := '1'; --Other
          END CASE;
        END IF;
      
  --END IF;

  RETURN v_BE_CONST_CODE;

END FUN_GET_BE_CONST_CODE;
/