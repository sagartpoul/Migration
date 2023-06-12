/*
*****************************************************************************************
*	Author		:  													* 		
*	Date		: 01/08/2015															*
*	Description : Branch Parameter in Converion follwing things we are maintain here	* 
*				  Conversion Date, last Quarted Date, Intrest upto date etc.			*
*****************************************************************************************
*/

DECLARE
	v_ExistCount NUMBER := 0;
BEGIN
--STEP-1--START-INSERT DATA TO CSV_CONFIG
--DELETE RECORDS IF EXIST

	SELECT COUNT(*) INTO v_ExistCount FROM user_tables
	WHERE TABLE_NAME = 'CSV_CONFIG';
	
	IF (v_ExistCount = 1 ) THEN
		EXECUTE IMMEDIATE 'DELETE FROM CSV_CONFIG';
	END IF;
---START INSERT

INSERT INTO CSV_CONFIG VALUES 
(	
	'BALAJI URBAN CO-OP CREDIT SOCIETY LTD,UDGIR', --"TITLE", 
	TO_DATE('01/01/1990','dd/mm/yyyy'), --"SIGNMAST_DD", 
	'I', --"STATUS", 
	'Y',--"PROCESS_STATUS", 
	1, --"BRCODE", 
	TO_DATE('31/03/2022','dd/mm/yyyy'),--"INT_UPTO_DT", 
	TO_DATE('26/04/2022','dd/mm/yyyy'),--"CONV_DT" , 
	TO_DATE('31/03/2022','dd/mm/yyyy'),--"LAST_QRT_DT" ,
	TO_DATE('31/03/2022','dd/mm/yyyy'),--"HALF_YRS_DT" ,
	TO_DATE('31/03/2022','dd/mm/yyyy'),--"SB_INT_UPTO_DT",	
	TO_DATE('31/03/2014','dd/mm/yyyy'),--"DATA_SATRT_DT" 
	'ORCL',
	8, 	--PIGMY_GLAC --PIGMY DEPOSITS GL
	31, --OIR_GLAC, --OVERDUE INTEREST RECEIVABLE GL
	14, --OIR_RESERVE_CLGLAC	--OVERDUE INTEREST RESERVE
	402, --OIR_RESERVE_CLACNO	--OVERDUE INTEREST RESERVE
	NULL, --IPD_GLAC --INTEREST PAID ON DEPOSITS GL
	51, --CASH_GLAC --CASH GL ACCOUNT
	NULL,--SAVINGS_GLAC 
	NULL,--CURRENT_GLAC 
	NULL,--CC_GLAC 
	1, --SH_GLAC
	10, --SH_PRICE
	NULL, --DEFAULT_NPA_DATE
	10, -- DEPOSIT_SEC_TYPE
	NULL, --IMAGE PROCESSING FLAG
	'1', -- STATECD_CUMM, -- 30
	'G', -- DISTRICT_CUMM (i.e. PUNE), --CHANGE ACCORDING DISTICT
	'1', -- COUNTRY_CUMM, 
	37941 --MAX_CUSTID
);

COMMIT;

DBMS_OUTPUT.PUT_LINE ('....built CSV_CONFIG with default records.....');
DBMS_OUTPUT.PUT_LINE ('....NOTE - If required, you need to update CSV_CONFIG before calling the conversion process.....');
--STEP-1--END-INSERT DATA TO CSV_CONFIG
DBMS_OUTPUT.PUT_LINE ('....END...constructing CSV_CONFIG.....');
END;
/