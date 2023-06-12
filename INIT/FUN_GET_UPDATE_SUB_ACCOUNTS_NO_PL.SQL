/*
*
*	alter table sub_accounts add old_sub_accounts_no number;
*	update sub_accounts 
*	set old_sub_accounts_no = sub_accounts_no;
*/
declare
--FIXED VARIABLES
	v_STAGE NUMBER := 0;
	v_STAGE_TITLE VARCHAR2(50) := 'BE_ACTNO INSERT';
	c_LOG_FILE_NAME VARCHAR2(30) := 'BE_ACTNO.txt';
	c_LOG_FILE_INSERT VARCHAR2(30) := 'BE_ACTNO_INSERT_LOG.txt';
	v_ExistCount NUMBER := 0;
	v_oFile UTL_FILE.FILE_TYPE;
	v_oFile_INSERT UTL_FILE.FILE_TYPE;
	c_REC SYS_REFCURSOR;
	rec_CONFIG CSV_CONFIG%ROWTYPE;
	v_BRCODE NUMBER(4,0);
-- OBJECT 
	p_BRANCH_ID NUMBER ;
	p_ACCOUNTS_ID NUMBER ;	
	p_SUB_ACCOUNTS_ID NUMBER; -- USER SUB_ACCOUNTS_ID
	p_SUB_ACCOUNTS_NO NUMBER;	
	v_IS_UPDATED BOOLEAN := FALSE;
	v_COUNTER NUMBER := 0;
	c_REC SYS_REFCURSOR;
	v_EXIST_COUNT NUMBER := 0;	
	c_REC SYS_REFCURSOR;
	v_SRNO NUMBER := 0;
BEGIN  
	v_oFile := UTL_FILE.FOPEN('CSV_OUTPUT_DIR',c_LOG_FILE_NAME,'w');
	UTL_FILE.PUTF(v_oFile,'-------BE_ACNO INSERT : Start Time %s-------%\n',TO_CHAR(SYSTIMESTAMP, 'HH12:MI:SS.FF4 AM'));
	v_STAGE := 100;  
--	EXECUTE IMMEDIATE 'UPDATE SUB_ACCOUNTS SET SUB_ACCOUNTS_NO = OLD_SUB_ACCOUNTS_NO';
	
	v_STAGE := 200;  
	FOR c_REC IN 
	(
		select * from sub_accounts
		where length(sub_accounts_no) > 6		
		AND ROWNUM < 20
		ORDER BY BRANCH_ID, ACCOUNTS_ID, SUB_ACCOUNTS_NO
	)	
	LOOP		
		BEGIN 
		v_STAGE := 300;  
	
		p_BRANCH_ID := c_REC.BRANCH_ID;
		p_SUB_ACCOUNTS_ID := c_REC.SUB_ACCOUNTS_ID;
		p_ACCOUNTS_ID := c_REC.ACCOUNTS_ID;
		p_SUB_ACCOUNTS_NO := c_REC.SUB_ACCOUNTS_NO;
		
		-- get already created acno 
			SELECT SUB_ACCOUNTS_NO INTO v_COUNTER FROM SUB_ACCOUNTS
			WHERE SUB_ACCOUNTS_ID = p_SUB_ACCOUNTS_ID AND SUB_ACCOUNTS_NO != NEW_SUB_ACCOUNTS_NO;
			
			GOTO SKIP_RECORD;
				
		EXCEPTION
			WHEN NO_DATA_FOUND THEN 
				BEGIN
					v_STAGE := 400;  
					v_SRNO := v_SRNO + 1;
					-- get acno
					select acno into v_COUNTER from (
					 select min_a - 1 + level as acno
						   from ( select DECODE( LENGTH(min(SUB_ACCOUNTS_NO)),6,1,7,1, min(SUB_ACCOUNTS_NO)) min_a
									   , max(SUB_ACCOUNTS_NO) max_a
								  from SUB_ACCOUNTS 
								  WHERE BRANCH_ID = p_BRANCH_ID AND ACCOUNTS_ID = p_ACCOUNTS_ID
								)
						connect by level <= max_a - min_a + 1
						  minus
						 select SUB_ACCOUNTS_NO
						 from SUB_ACCOUNTS 
								  WHERE BRANCH_ID = p_BRANCH_ID AND ACCOUNTS_ID = p_ACCOUNTS_ID
						) a where rownum < 2;
						
					-- update 	
					if( v_COUNTER != 0 ) then 						
					--	INSERT INTO NEW_BEACNO VALUES (p_BRANCH_ID,p_ACCOUNTS_ID,p_SUB_ACCOUNTS_ID,p_SUB_ACCOUNTS_NO, v_COUNTER);
						UTL_FILE.PUTF(v_oFile,'-SRNO %s SUB_ACCOUNTS_ID ::%s SUB_ACCOUNTS_NO %s NEW_SUB_ACCOUNTS_NO %s\n',v_SRNO, p_SUB_ACCOUNTS_ID,p_SUB_ACCOUNTS_NO, v_COUNTER);
						EXECUTE IMMEDIATE 'UPDATE SUB_ACCOUNTS SET SUB_ACCOUNTS_NO =' || v_COUNTER || ' WHERE SUB_ACCOUNTS_ID = ' || p_SUB_ACCOUNTS_ID ;			  
					end if;
					-- end acno		
				EXCEPTION
					WHEN OTHERS THEN 
						v_STAGE := 500;  
						v_SRNO := v_SRNO + 1;
						SELECT MAX(SUB_ACCOUNTS_NO) + 1 INTO v_COUNTER FROM NEW_BEACNO
							WHERE ACCOUNTS_ID = p_ACCOUNTS_ID AND BRANCH_ID = p_BRANCH_ID;						
							
						v_STAGE := 600;  
						-- INSERT INTO NEW_BEACNO VALUES (p_BRANCH_ID,p_ACCOUNTS_ID,p_SUB_ACCOUNTS_ID,p_SUB_ACCOUNTS_NO, v_COUNTER);
						EXECUTE IMMEDIATE 'UPDATE SUB_ACCOUNTS SET SUB_ACCOUNTS_NO =' || v_COUNTER || ' WHERE SUB_ACCOUNTS_ID = ' || p_SUB_ACCOUNTS_ID;			  
						UTL_FILE.PUTF(v_oFile_INSERT,'-ERROR STAGE##%s  SUB_ACCOUNTS_ID ::%s NEW_SUB_ACCOUNTS_NO %s Error-%s-%s\n',v_STAGE, c_REC.SUB_ACCOUNTS_ID, v_COUNTER,SQLCODE,SQLERRM);
				END;				
		END;
		<<SKIP_RECORD>>
			NULL;				
		COMMIT;
		
	END LOOP;	
	UTL_FILE.PUTF(v_oFile,'-------BE_ACNO INSERT : End Time %s-------%\n',TO_CHAR(SYSTIMESTAMP, 'HH12:MI:SS.FF4 AM'));
	UTL_FILE.FCLOSE(v_oFile);	
END;
/