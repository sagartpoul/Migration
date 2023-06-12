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
PROMPT **********BANK EXPERT CSV EXPORT TOOL - BRANCH INITIALIZATION**********
PROMPT;
PROMPT ....please wait for some time....
PROMPT;
PROMPT ....constructing GLMAP data....
@@'&1.INIT_SAGAR\INSERT_GLMAP.sql';
PROMPT ....activating the branch
@@'&1.INIT_SAGAR\SET_BRANCH.sql';


PROMPT ....building branch dependency
PROMPT .... branch initialzed successfully ....
PROMPT;
PROMPT ----------THANK YOU-------------;
