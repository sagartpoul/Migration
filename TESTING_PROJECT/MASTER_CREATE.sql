SET FLUSH ON;
DECLARE
   vExistCount NUMBER := 0;
BEGIN  
			DBMS_OUTPUT.PUT_LINE('------START---Creating MASTER-----');
        
				SELECT COUNT(*) INTO vExistCount FROM USER_TABLES WHERE TABLE_NAME = 'MASTER';
				IF (vExistCount = 1) THEN EXECUTE IMMEDIATE 'DROP TABLE MASTER';
				END IF;
				EXECUTE IMMEDIATE 
					'CREATE TABLE "MASTER"
					  (
								  "ACTNO" VARCHAR2(13),
								  "STATUS" VARCHAR2(1),
								  "IR_NO" NUMBER(6, 0),
								  "TRAN_DATE" DATE,
								  "CATA_CODE" VARCHAR2(4),
								  "CUST_ID" VARCHAR2(13),
								  "LONG_NAME" VARCHAR2(40),
								  "MOBILE" NUMBER(10),
								  "AADHAR" NUMBER(12)
					   )';

	DBMS_OUTPUT.PUT_LINE('   created table MASTER  ');
	COMMIT;
	END;

/



