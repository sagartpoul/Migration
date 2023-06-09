/*
 *	Author 		: root
 *  Description : auto generated script 
 */
DECLARE
--GENERAL VARIABLES
	c_LOG_FILE_NAME VARCHAR2(30) := 'ACCOUNT.txt';
	v_FILE VARCHAR2(30) := 'ACCOUNT_INIT';
	v_ExistCount NUMBER := 0;
	v_oFile UTL_FILE.FILE_TYPE;
	v_STAGE NUMBER := 0;
	v_STAGE_TITLE VARCHAR2(50) := '';
--CONFIG VARIABLES
	v_BRCODE NUMBER;
BEGIN
	v_oFile := UTL_FILE.FOPEN('CSV_OUTPUT_DIR',c_LOG_FILE_NAME,'w');
	UTL_FILE.PUTF(v_oFile,'-------MASTER INIT : Start Time %s-------%\n',TO_CHAR(SYSTIMESTAMP, 'HH12:MI:SS.FF4 AM'));
	
	v_STAGE  := 100;
	UPDATE CSV_CONFIG SET PROCESS_STATUS = 'Y' WHERE STATUS='L';
	COMMIT;
	v_STAGE  := 200;
	--GET CONFIGURATION PARAMETERS
		SELECT BRCODE INTO v_BRCODE FROM CSV_CONFIG
		WHERE STATUS='L';
	
	--STEP-START-ALTER SOURCE TABLE
		v_STAGE  := 10401;
		v_STAGE_TITLE  := 'SOURCE_TABLE_ALTER';
		
					
			SELECT COUNT(*) INTO v_ExistCount FROM USER_TAB_COLUMNS
			WHERE TABLE_NAME = 'ACTMST' AND COLUMN_NAME = 'BE_ACTNO';
			
			IF (v_ExistCount = 0 ) THEN
				v_STAGE  := 3001;
					EXECUTE IMMEDIATE 'ALTER TABLE ACTMST ADD (BE_ACTNO VARCHAR2(13) NULL)';
				v_STAGE  := 4001;
					EXECUTE IMMEDIATE 'UPDATE ACTMST SET BE_ACTNO = NULL';
			END IF;
			
			SELECT COUNT(*) INTO v_ExistCount FROM USER_TAB_COLUMNS
			WHERE TABLE_NAME = 'ACTMST' AND COLUMN_NAME = 'ROWNO';
			
			IF (v_ExistCount = 0 ) THEN
				v_STAGE  := 300;
					EXECUTE IMMEDIATE 'ALTER TABLE ACTMST ADD (ROWNO NUMBER(7,0) NULL)';
				v_STAGE  := 400;
					EXECUTE IMMEDIATE 'UPDATE ACTMST SET ROWNO=ROWNUM';
			END IF; 
			
			SELECT COUNT(*) INTO v_ExistCount FROM USER_TAB_COLUMNS
			WHERE TABLE_NAME = 'PGMCUSTMST' AND COLUMN_NAME = 'BE_ACTNO';
			
			IF (v_ExistCount = 0 ) THEN
				v_STAGE  := 3001;
					EXECUTE IMMEDIATE 'ALTER TABLE PGMCUSTMST ADD (BE_ACTNO VARCHAR2(13) NULL)';
				v_STAGE  := 4001;
					EXECUTE IMMEDIATE 'UPDATE PGMCUSTMST SET BE_ACTNO = NULL';
			END IF;
			
			SELECT COUNT(*) INTO v_ExistCount FROM USER_TAB_COLUMNS
			WHERE TABLE_NAME = 'PGMCUSTMST' AND COLUMN_NAME = 'ROWNO';
			
			IF (v_ExistCount = 0 ) THEN
				v_STAGE  := 300;
					EXECUTE IMMEDIATE 'ALTER TABLE PGMCUSTMST ADD (ROWNO NUMBER(7,0) NULL)';
				v_STAGE  := 400;
					EXECUTE IMMEDIATE 'UPDATE PGMCUSTMST SET ROWNO=ROWNUM';
			END IF; 
					
		COMMIT;
	UTL_FILE.PUTF(v_oFile,'\n-------INIT PROCESS ENDED : END Time %s-------%\n',TO_CHAR(SYSTIMESTAMP, 'HH12:MI:SS.FF4 AM'));
	UTL_FILE.FCLOSE(v_oFile);
EXCEPTION
	WHEN OTHERS THEN
		--ROLLBACK;
		UPDATE CSV_CONFIG SET PROCESS_STATUS = 'N' WHERE STATUS='L';
		COMMIT;
		DBMS_OUTPUT.PUT_LINE('???????UNRECOVERABLE ERROR : '||v_FILE|| '   STAGE#' || v_STAGE || '-Error- ' || SQLCODE || '-' || SQLERRM );
		UTL_FILE.PUTF(v_oFile,'\n???????UNRECOVERABLE ERROR : STAGE#%s-Error-%s-%s, End Time %s-------%\n',v_STAGE,SQLCODE,SQLERRM,TO_CHAR(SYSTIMESTAMP, 'HH12:MI:SS.FF4 AM'));
		UTL_FILE.FCLOSE(v_oFile);
END;
/
