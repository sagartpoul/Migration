/* 
*	author : Santosh G. Sirsat
*	date : 28-11-2014
*	description : this is function accept lkc_no and split first 2 digit and remaining 3 digit padding with zeros
*	if function fails to padding return user specific lck_no.
*/
CREATE OR REPLACE 
FUNCTION FUN_GET_VALID_LCK_NO
(
	p_LCK_NO VARCHAR2,
	p_SPECIAL_CHAR VARCHAR2 DEFAULT '-'
)
RETURN VARCHAR2 IS
v_LCK_NO VARCHAR2(5);	
v_NEW_LCK_NO VARCHAR2(5);
v_LENGTH NUMBER(1);
v_DASH_INDEX NUMBER(1);
v_SPECIAL_CHAR CHAR(1) := '-';
v_SCALE VARCHAR(2);
v_PRICISION VARCHAR2(3);	
v_ERROR BOOLEAN := FALSE;
BEGIN
	BEGIN
		
		v_ERROR := FALSE;
		v_SPECIAL_CHAR := TRIM(p_SPECIAL_CHAR);
		v_LCK_NO := p_LCK_NO;
		-- TRIM LEADING SPACESS;
		
		v_LCK_NO := TRIM(v_LCK_NO);

		-- COUNT TOTAL LENGTH LENGTH   
		
		v_LENGTH := LENGTH(v_LCK_NO);

		-- FIND DASH INDEX
		
		v_DASH_INDEX := INSTR(v_LCK_NO,v_SPECIAL_CHAR);

		-- SCALE IT
		
		v_SCALE := SUBSTR(v_LCK_NO,1,v_DASH_INDEX);

		-- PRECISION
		
		v_PRICISION := SUBSTR(v_LCK_NO,v_DASH_INDEX+1);
		
		-- LPAD
		v_PRICISION := LPAD(v_PRICISION, 3, '0');
		
		-- COUMPUTE  LOCKER NO	
		v_NEW_LCK_NO := v_SCALE || v_PRICISION;
		
	EXCEPTION
		WHEN OTHERS THEN
			v_ERROR := TRUE;
	END;
	
	IF( v_ERROR ) THEN
		v_NEW_LCK_NO := NULL;
	END IF;
	
	RETURN v_NEW_LCK_NO;
	
END FUN_GET_VALID_LCK_NO;
/