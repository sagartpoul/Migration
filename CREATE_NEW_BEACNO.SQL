DECLARE
v_ExistCount NUMBER := 0;
BEGIN
DBMS_OUTPUT.PUT_LINE ('....START...creating NEW_BEACNO.....');
--DROP TABLE IF EXISTS
	SELECT COUNT(*) INTO v_ExistCount FROM user_tables
	WHERE TABLE_NAME = 'NEW_BEACNO';
	
	IF (v_ExistCount = 1 ) THEN
		EXECUTE IMMEDIATE 'DROP TABLE NEW_BEACNO';
	END IF;
--STEP-1--START-CREATE TABLE NEW_BEACNO
EXECUTE IMMEDIATE
'CREATE TABLE  "NEW_BEACNO" 
   (
	"BRCODE" NUMBER, 
	"CL_AC_TYPE" NUMBER(3), 
	"OLD_ACNO" NUMBER(8), 
	"NEW_ACNO" NUMBER(6) 
	)';
EXECUTE IMMEDIATE 'CREATE INDEX "NEW_BEACNO_IDX1" ON  "NEW_BEACNO" ("CL_AC_TYPE", "OLD_ACNO")'; 	
	
DBMS_OUTPUT.PUT_LINE ('....created table NEW_BEACNO.....');
--STEP-1--END-CREATE TABLE GLMAP
DBMS_OUTPUT.PUT_LINE ('....END...creating NEW_BEACNO.....');
END;
/