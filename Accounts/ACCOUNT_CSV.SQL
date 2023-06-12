PROMPT .....inside spooling.....
SET FEEDBACK OFF;
SET ECHO OFF;
SET PAGESIZE 0;
SET HEADING OFF;
SET LINESIZE 1024;
SET TRIMSPOOL ON;
SET TRIMOUT ON;
SET VERIFY OFF;
SET TERM OFF;

--------------------------START-MASTER.CSV--------------------------------
SET TERM ON;
PROMPT ...creating csv for MASTER
SET TERM OFF;

SPOOL 'D:\CSVTOOL_BALAJI_URBAN\OUTPUT\MASTER.CSV';

PROMPT;
SELECT
POST_UR_ID||'|'|| POST_UR_TIME||'|'|| PASS_UR_ID||'|'|| PASS_UR_TIME||'|'|| BR_CODE||'|'||
ACTNO||'|'|| STATUS||'|'|| RSTATUS||'|'|| IR_NO||'|'|| TO_CHAR(TRAN_DATE,'dd/mm/yyyy')||'|'|| TRAN_NO||'|'|| CATA_CODE||'|'||
CUST_ID||'|'||MINOR_CUSTID||'|'|| FUN_REPLACE_CHAR(SH_NAME)||'|'|| FUN_REPLACE_CHAR(LONG_NAME)
||'|'|| FUN_REPLACE_CHAR(F_NAME) ||'|'|| FUN_REPLACE_CHAR(M_NAME)
||'|'|| FUN_REPLACE_CHAR(L_NAME)||'|'|| CONST_CODE||'|'|| 
FUN_REPLACE_CHAR(GUAR_NAME)||'|'|| GUAR_REL||'|'||
ATTACH_CODE||'|'|| FREEZ_CODE||'|'|| RISK_CATA||'|'|| KYC_FLAG||'|'|| TO_CHAR(AC_OP_DATE,'dd/mm/yyyy')||'|'|| OPRN_MODE||'|'||
NPA_TAG||'|'|| INTRO_ACTNO||'|'|| NOMI_NAME||'|'|| NOMI_REL||'|'|| MINOR_TAG||'|'|| MG_NAME||'|'|| MG_REL||'|'||
TO_CHAR(MINOR_BIRTH_DT,'dd/mm/yyyy')||'|'|| DORMANT_TAG||'|'|| FUN_REPLACE_CHAR(FLASH_MESSG) ||'|' || TYPEOFAC || '|' || INSTCODE || '|' || ISDEAF || '|' || TO_CHAR(INT_UPTO_DT,'DD/MM/YYYY') || '|' || INT_ALLOW || '|' || OLD_ACTNO || '|'|| STP_TRAN || '|'|| SPC_AC||
'|'|| SH_CIBIL || '|'|| WRTN_OFF_ST || '|'|| SUIT_FLD_ST || '|'|| TOTAL_WTN_OFF || '|'|| PRN_WTN_OFF || '|'|| WTN_SETTL_AMT || '|'
FROM MASTER 
ORDER BY ACTNO;

SPOOL OFF;
--------------------------START-MASTER.CSV--------------------------------

--------------------------START-CLOSEDET.CSV--------------------------------
SET TERM ON;
PROMPT ...creating csv for CLOSEDET
SET TERM OFF;
SPOOL 'D:\CSVTOOL_BALAJI_URBAN\OUTPUT\CLOSEDET.CSV';

PROMPT;
SELECT POST_UR_ID ||'|'|| POST_UR_TIME ||'|'|| PASS_UR_ID ||'|'|| PASS_UR_TIME ||'|'|| 
BR_CODE ||'|'|| ACTNO ||'|'|| STATUS ||'|'|| IR_NO ||'|'|| TO_CHAR(TRAN_DATE,'dd/mm/yyyy') ||'|'|| TRAN_CODE ||'|'|| TRAN_NO ||'|'|| 
BATCH_NO ||'|'|| BLACTNO1 ||'|'|| BLACTNO2 ||'|'|| BLACTNO3 ||'|'|| BLACTNO4 ||'|'|| BLACTNO5 ||'|'|| TRAMT1 ||'|'|| TRAMT1_AMT_DC ||'|'|| TRAMT2 ||'|'|| TRAMT2_AMT_DC ||'|'|| TRAMT3 ||'|'|| TRAMT3_AMT_DC ||'|'|| TRAMT4 ||'|'|| TRAMT4_AMT_DC ||'|'|| TRAMT5 ||'|'|| TRAMT5_AMT_DC ||'|'|| OLDINTRT ||'|'|| PERIOD_DAYS ||'|'|| PERIOD_MONTHS ||'|'|| INT_RT ||'|'|| 
PRIN_AMT ||'|'|| PRIN_AMT_DC ||'|'|| INT_AMT ||'|'|| INT_AMT_DC ||'|'|| TO_CHAR( INT_UPTO_DT, 'DD/MM/YYYY') ||'|'|| CHRG_AMT ||'|'|| CHRG_AMT_DC ||'|' || RDUE_AMT ||'|'|| RDUE_AMT_DC ||'|'|| AUTO_RENEW ||'|'|| TDS_AMT ||'|'|| TDS_AMT_DC || '|' 
|| SBRK_INT || '|' || BCINT_RT || '|' || LBRK_INT ||'|' || TRAN_PART ||'|' || TRAN_PART1 ||'|' 
FROM CLOSEDET ORDER BY ACTNO;

SPOOL OFF;
--------------------------END-CLOSEDET.CSV--------------------------------
/*
--------------------------START-DORM_DET.CSV--------------------------------
SET TERM ON;
PROMPT ...creating csv for DORM_DET
SET TERM OFF;
SPOOL 'D:\OUTPUT\ANTRUJ_MAHAL\TRAN.CSV';
PROMPT;
SELECT 
POST_UR_ID ||'|'|| POST_UR_TIME ||'|'|| PASS_UR_ID ||'|'|| PASS_UR_TIME ||'|'|| BR_CODE ||'|'|| 
ACTNO ||'|'|| STATUS ||'|'|| RSTATUS ||'|'|| IR_NO ||'|'|| TO_CHAR(TRAN_DATE,'dd/mm/yyyy') || '|' || TO_CHAR(LAST_TR_DATE,'dd/mm/yyyy') ||'|'|| TRAN_NO ||'|' 
FROM DORM_DET ORDER BY ACTNO;

SPOOL OFF;
--------------------------END-DORM_DET.CSV--------------------------------
/*
--------------------------START-BALANCE.CSV--------------------------------
SET TERM ON;
PROMPT ...creating csv for BALANCE
SET TERM OFF;

SPOOL 'D:\OUTPUT\ANTRUJ_MAHAL\TRAN.CSV';

PROMPT;
SELECT BLACTNO ||'|'|| GEN_LEDG_NO ||'|'|| CLR_BAL ||'|'|| CLR_BAL_DC ||'|'|| 
UNCLR_BAL ||'|'|| UNCLR_BAL_DC ||'|'|| LEDG_BAL ||'|'|| LEDG_BAL_DC ||'|'|| 
NULL ||'|'|| SHADOW_BAL_DC ||'|'|| LIEN_BAL ||'|'|| LIEN_BAL_DC ||'|'|| 
ATTACH_BAL ||'|'|| ATTACH_BAL_DC ||'|'|| TO_CHAR(LAST_TR_DATE,'dd/mm/yyyy') || '|' 
FROM BALANCE ORDER BY BLACTNO;

SPOOL OFF;
--------------------------END-BALANCE.CSV--------------------------------
*/
--------------------------START-CUSTREL.CSV--------------------------------

SET TERM ON;
PROMPT ...creating csv for CUSTREL
SET TERM OFF;
SPOOL 'D:\CSVTOOL_BALAJI_URBAN\OUTPUT\CUSTREL.CSV';
PROMPT;
SELECT ACTNO || '|' || IR_NO || '|' || CUST_ID || '|' || SR_NO || '|' 
FROM CUSTREL ORDER BY ACTNO;

SPOOL OFF;
--------------------------END-CUSTREL.CSV--------------------------------

--------------------------START-SIGNAUTH.CSV--------------------------------
SET TERM ON;
PROMPT ...creating csv for SIGNAUTH
SET TERM OFF;

SPOOL 'D:\CSVTOOL_BALAJI_URBAN\OUTPUT\SIGNAUTH.CSV';
PROMPT;
SELECT 
ACTNO ||'|'|| IR_NO ||'|'|| SR_NO ||'|'|| TO_CHAR(TRAN_DATE ,'dd/mm/yyyy') ||'|'|| CUST_ID ||'|'|| CAPACITY ||'|'|| TO_CHAR(VALDATE ,'dd/mm/yyyy') || '|'
FROM SIGNAUTH ORDER BY ACTNO;

SPOOL OFF;
--------------------------END-SIGNAUTH.CSV--------------------------------


SET TERM ON;

PROMPT .....spooling done successfully.....