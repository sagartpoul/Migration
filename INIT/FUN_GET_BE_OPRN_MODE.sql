create or replace 
FUNCTION FUN_GET_BE_OPRN_MODE
(
p_CL_OPRN_MODE VARCHAR2
)
RETURN VARCHAR2 IS
v_BE_OPRN_MODE VARCHAR2(1);
BEGIN

	v_BE_OPRN_MODE := '0'; --NOT KNOWN
	CASE p_CL_OPRN_MODE
		--SEVERALLY
		WHEN '1' THEN v_BE_OPRN_MODE := 'S';
		--JOINTLY.
		WHEN '2' THEN v_BE_OPRN_MODE := 'J';
		--E / S
		WHEN '3' THEN v_BE_OPRN_MODE := 'E';
		--ANYONE
		WHEN '4' THEN v_BE_OPRN_MODE := 'A';
		--ANYTWO
		WHEN '5' THEN v_BE_OPRN_MODE := 'T';
		--THUMB
		WHEN '6' THEN v_BE_OPRN_MODE := 'H';
		--LATER / SURVIVOR
		WHEN '7' THEN v_BE_OPRN_MODE := 'L';
		--FORMER / SURVIVOR
		WHEN '8' THEN v_BE_OPRN_MODE := 'F';
		--ONLY FIRST
		WHEN '9' THEN v_BE_OPRN_MODE := 'S';
		--NOT KNOWN
		ELSE v_BE_OPRN_MODE := '0'; 
	END CASE;

	RETURN v_BE_OPRN_MODE;
	
END FUN_GET_BE_OPRN_MODE;
/