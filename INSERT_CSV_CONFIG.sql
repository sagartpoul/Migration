/*
*****************************************************************************************
*	Author		: PRACHI BARGAJE ,NAGSEN GAIKWAD										* 		
*	Date		: 17/06/2016															*
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
	'Shankar Nagari Sagakari Patsanshta Malegaon bk', --"TITLE", 
	TO_DATE('01/01/1990','dd/mm/yyyy'), --"SIGNMAST_DD", 
	'I', --"STATUS", 
	'Y',--"PROCESS_STATUS", 
	5, --"BRCODE", 
	TO_DATE('31/12/2021','dd/mm/yyyy'),--"INT_UPTO_DT", 
	TO_DATE('25/01/2022','dd/mm/yyyy'),--"CONV_DT" , 
	TO_DATE('31/12/2021','dd/mm/yyyy'),--"LAST_QRT_DT" , 
	TO_DATE('17/01/1947','dd/mm/yyyy'),--DATA_SATRT_DT 17-01-1990
	'ORCL',
	65, --PIGMY_GLAC --PIGMY DEPOSITS GL
	'L30159', --THREE YEAR DEPOSITE SCHEME
	'L30162', --LAKHPATI DEPOSITE
	'L30061', --DHANRUDDHI THEV DEPOSITE
	NULL, --IPD_GLAC --INTEREST PAID ON DEPOSITS GL
	200, --CASH_GLAC --CASH GL ACCOUNT
	66,--SAVINGS_GLAC 
	71,--CURRENT_GLAC 
	351,--CC_GLAC 
	1, --SH_GLAC
	100, --SH_PRICE
	NULL, --DEFAULT_NPA_DATE
	10, -- DEPOSIT_SEC_TYPE
	NULL, --IMAGE PROCESSING FLAG
	'U', -- STATECD_CUMM, -- U-SOLAPUR CITY
	'O', -- DISTRICT_CUMM (i.e. 'OTHER'), --CHANGE ACCORDING DISTICT
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