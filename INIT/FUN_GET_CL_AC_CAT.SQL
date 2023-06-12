create or replace 
FUNCTION FUN_GET_CL_AC_CAT 
(
  p_BE_CONST_CODE VARCHAR2 -- CONSTITUTION CODE
)
RETURN VARCHAR2 IS 
 v_CL_AC_CAT VARCHAR2(1); -- ACCOUNT CATEGORIES
BEGIN
        CASE p_BE_CONST_CODE
          --GENERAL
          WHEN '1' THEN v_CL_AC_CAT := '1';
          --STAFF
          WHEN 'E' THEN v_CL_AC_CAT := '2';
          --SENIOR CITIZEN
          WHEN 'C' THEN v_CL_AC_CAT := '3';
          --SOCIETY
          WHEN 'S' THEN v_CL_AC_CAT := '4';
          -- CREDIT SOCIETY
          WHEN 'R' THEN v_CL_AC_CAT := '4';
          -- REST OF ALL 
          ELSE
            v_CL_AC_CAT := '1'; --Other
        END CASE;  
  RETURN v_CL_AC_CAT;
END FUN_GET_CL_AC_CAT;
/