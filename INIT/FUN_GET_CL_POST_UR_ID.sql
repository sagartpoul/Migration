create or replace 
FUNCTION FUN_GET_CL_POST_UR_ID
(
	p_LAST_MODIFIED_BY VARCHAR2
)
return varchar2 is
v_POST_UR_ID VARCHAR2(3);

BEGIN
	begin
  
		select EMPLOYEES_ID INTO v_POST_UR_ID from USERS
		WHERE USERS_ID = p_LAST_MODIFIED_BY;
		
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		v_POST_UR_ID := NULL;
	END;
  RETURN v_POST_UR_ID;

END FUN_GET_CL_POST_UR_ID;
/