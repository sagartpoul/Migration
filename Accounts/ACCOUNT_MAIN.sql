/*
*   Author 		: root
*   Description : auto generated script 
*/

PROMPT 
PROMPT ...ACCOUNT conversion in process;
 
PROMPT ...ACCOUNT_CREATE STARTS .....
 @@'&1.ContinueCheck' '&1'
@@'&1.ACCOUNT\ACCOUNT_CREATE' '&1';
PROMPT ...ACCOUNT_CREATE ENDED .....

PROMPT ...ACCOUNT_INIT STARTS .....
@@'&1.ContinueCheck' '&1'
@@'&1.ACCOUNT\ACCOUNT_INIT' '&1';
PROMPT ...ACCOUNT_INIT ENDED.....

PROMPT ...ACCOUNT_INSERT STARTS .....
@@'&1.ContinueCheck' '&1'
@@'&1.ACCOUNT\ACCOUNT_INSERT' '&1';
PROMPT ...ACCOUNT_INSERT ENDED.....

PROMPT ...ACCOUNT_INSERT - PIGMY STARTS .....
@@'&1.ContinueCheck' '&1'
@@'&1.ACCOUNT\ACCOUNT_INSERT - PIGMY' '&1';
PROMPT ...ACCOUNT_INSERT - PIGMY ENDED.....

PROMPT ...ACCOUNT_INSERT_GL STARTS .....
@@'&1.ContinueCheck' '&1'
@@'&1.ACCOUNT\ACCOUNT_INSERT_GL' '&1';
PROMPT ...ACCOUNT_INSERT_GL ENDED.....


PROMPT ...CLOSEDET_INSERT STARTED.....
--@@'&1.ContinueCheck' '&1'
--@@'&1.ACCOUNT\CLOSEDET_INSERT' '&1'; --IN TRAN  
PROMPT ...CLOSEDET_INSERT ENDED.....

--PROMPT ...CUSTREL_INSERT STARTED.....
--@@'&1.ContinueCheck' '&1'
--@@'&1.ACCOUNT\CUSTREL_INSERT' '&1';
--PROMPT ...CUSTREL_INSERT ENDED.....

/* PROMPT ...MASTER INSERTION STARTS .ACCOUNT_INSERT -PIGMY
@@'&1.ContinueCheck' '&1'
@@'&1.ACCOUNT\ACCOUNT_INSERT -PIGMY' '&1';
 */

@@'&1.ContinueCheck' '&1'
PROMPT .. ACCOUNT CSV BUILDING ....
--@@'&1.ACCOUNT\ACCOUNT_CSV' '&1'  IN TRAN

@@'&1.ContinueCheck' '&1'
PAUSE 'press any key to continue'; 

PROMPT ...ACCOUNT conversion successfull;
PROMPT;
