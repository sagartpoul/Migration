PROMPT .... CHANGE SUB_ACCOUNTS_NO -1 TO MEMBERS_ID IS START ....

BEGIN
UPDATE SUB_ACCOUNTS SET SUB_ACCOUNTS_NO=MEMBERS_ID WHERE SUB_ACCOUNTS_NO=-1;
dbms_output.put_line(' sub_accounts no is updated');
 delete from ACCOUNTS_FAMILY where RELATED_ACCOUNTS_ID=2 and ACCOUNTS_ID=1;
dbms_output.put_line(' related account id 2 no is deleted');
 /*
   		IF(RELATED_ACCOUNTS_ID=2 AND .ACCOUNTS_ID=1) THEN 
			GOTO SKIP_RECORD;	
		END IF;
		
		
		<<SKIP_RECORD>>
		NULL;*/
	END;
	/
PROMPT .... CHANGE SUB_ACCOUNTS_NO -1 TO MEMBERS_ID IS FINISH....