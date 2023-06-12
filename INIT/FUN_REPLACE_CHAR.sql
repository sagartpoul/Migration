create or replace 
FUNCTION FUN_REPLACE_CHAR
(
p_STRING VARCHAR2
)
RETURN VARCHAR2 IS
v_VALID NUMBER;
v_STRING VARCHAR2(32767);
BEGIN
	-- REPALCE 
	v_STRING := REPLACE(TRIM(p_STRING), CHR(10),'');
	-- REPLACE 
	v_STRING := REPLACE(TRIM(v_STRING), CHR(13),'');
  -- REPLACE '|' WITH ' '
	v_STRING := REPLACE(TRIM(v_STRING), '|',' ');
	--REPLACE ',' WITH ' '
--	v_STRING := REPLACE(TRIM(v_STRING), ' ','');
	
	v_STRING := REPLACE(TRIM(v_STRING), ',',' ');
	RETURN v_STRING;

RETURN v_STRING;

END FUN_REPLACE_CHAR;
/