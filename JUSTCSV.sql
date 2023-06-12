-- activate substitution variables
SET DEFINE ON
-- suppress echo for substitution variables
SET VERIFY OFF;
-- activate stdout
SET SERVEROUTPUT ON;
SET HEADING OFF;
SET FEEDBACK OFF;
--SET VERIFY OFF;
SET ECHO OFF;
CLEAR SCREEN;
PROMPT;
PROMPT;
PROMPT;
PROMPT ******************BANK EXPERT CSV EXPORT TOOL******************
PROMPT;
PROMPT ....please wait for some time....
PROMPT;
PROMPT ....initiating the conversion process
--PROMPT '&1.INIT\CSVMaster_Main.sql';
--@@'&1.INIT\CSVMaster_Main.sql';
PROMPT;
@@CSV_MENU.sql ;
PROMPT ----------THANK YOU-------------;
