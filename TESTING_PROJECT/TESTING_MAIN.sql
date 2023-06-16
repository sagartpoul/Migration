SET TERM ON;
SET AUTOCOMMIT OFF;
SET FEEDBACK OFF;
SET SERVEROUTPUT ON;
PROMPT;
PROMPT ...TESTING conversion in process;
/* @@'&1.NPA\NPAMAST_INIT' '&1'; */
PROMPT ...initialization done.....

@@STUDENT_MASTER ;
PROMPT ...STUDENT_MASTER.....

@@INSERT_MASTER;
PROMPT ...MASTER_DATA INSERT DONE....

PAUSE 'press any key to continue';
PROMPT ...TESTING conversion successfull;
PROMPT;