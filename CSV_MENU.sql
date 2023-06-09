PROMPT ----------CREATE CSV FILES-------------;
SELECT CHR(9) || '(' || CAST(OBJECTID AS VARCHAR2(2)) || ')' || TITLE FROM CSV_MASTER
ORDER BY OBJECTID;
--PROMPT PUT YOUR CHOICE (0 to exit );
--ACCEPT CHOICE
PROMPT;
ACCEPT CHOICE NUMBER FORMAT '99' PROMPT 'PUT YOUR CHOICE (0 to exit)='
PROMPT;
--ACCEPT v_Choice NUMBER format '0' PROMPT 'PUT YOUR CONVERSION CHOICE:'
--PROMPT;
-- bind a substitution variable SELECTION to a SQL column
COLUMN SELECTED new_value SELECTION;
-- do if then else with SQL
-- the selected value is the name of the script to be executed
SET TERM off
SELECT
   CASE &CHOICE
		WHEN 0 THEN 'EXIT'
		WHEN 1 THEN 'CUSTOMER\CUSTOMER_CSV'
		WHEN 2 THEN 'ACCOUNT\ACCOUNT_CSV'
		WHEN 3 THEN 'PHOTO\PHOTO_CSV'
		WHEN 4 THEN 'SIGN\SIGNMAST_CSV'
		WHEN 5 THEN 'TRAN\TRAN_CSV'
		WHEN 6 THEN 'CHEQUE\CHEQUE_CSV'
		WHEN 8 THEN 'LOAN\LOAN_CSV'
		WHEN 9 THEN 'NPA\NPAMAST_CSV'
		WHEN 10 THEN 'SECURITY\SECURITY_CSV'
		WHEN 7 THEN 'DEPOSIT\DEPOSIT_CSV'
		WHEN 11 THEN 'PASSBOOK\PASSBOOK_CSV'
		WHEN 12 THEN 'DPINTTBL\DPINTTBL_CSV'
		WHEN 13 THEN 'LNINTTBL\LNINTTBL_CSV'
		WHEN 14 THEN 'DD\DD_CSV'
		WHEN 15 THEN 'OCC\OCC_CSV'
		WHEN 16 THEN 'ICC\ICC_CSV'
		WHEN 17 THEN 'AREA\AREA_CSV'
		WHEN 18 THEN 'SHARES\SHARES_CSV'
		WHEN 19 THEN 'LNGUAR\LNGUAR_CSV'
		WHEN 20 THEN 'CLEARING\BANKMAST_CSV'
		WHEN 21 THEN 'LOCKER\LOCKER_CSV'
		WHEN 22 THEN 'MISC\MISC_CSV'
		WHEN 23 THEN 'AGENT\AGENTMST_CSV'
		WHEN 24 THEN 'EMPLOYEE\EMPLOYEE_CSV'
		WHEN 25 THEN 'VALUER\VALUER_CSV'
		WHEN 26 THEN 'COMMODITY\COMMODITY_CSV'
		ELSE 'Exit'
  END SELECTED 
FROM DUAL;
SET TERM ON
-- execute the selected script
PROMPT ...calling the script : '&1.&SELECTION'
PAUSE 'press any key to continue';
CLEAR BUFFER;
@@'&1&SELECTION' '&1';
@@CSV_MENU.sql;


