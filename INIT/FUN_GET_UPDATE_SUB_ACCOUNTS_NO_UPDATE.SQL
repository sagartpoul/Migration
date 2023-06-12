/*
*
*	alter table sub_accounts add old_sub_accounts_no number;
*	update sub_accounts 
*	set old_sub_accounts_no = sub_accounts_no;
*/
create or replace 
FUNCTION FUN_GET_UPDATE_SUB_ACCOUNTS_NO
(
	p_BRANCH_ID NUMBER ,
	p_ACCOUNTS_ID NUMBER ,	
	p_SUB_ACCOUNTS_ID NUMBER -- USER SUB_ACCOUNTS_ID
)
RETURN NUMBER IS
	v_STAGE NUMBER ;
	v_IS_UPDATED BOOLEAN := FALSE;
	v_COUNTER NUMBER := 0;
	c_REC SYS_REFCURSOR;
	v_EXIST_COUNT NUMBER := 0;
	
BEGIN  
	v_STAGE := 300;  
   	BEGIN 
	-- get already created acno 
		SELECT SUB_ACCOUNTS_NO INTO v_COUNTER FROM SUB_ACCOUNTS
		WHERE SUB_ACCOUNTS_ID = p_SUB_ACCOUNTS_ID AND SUB_ACCOUNTS_NO != OLD_SUB_ACCOUNTS_NO;
		
		RETURN v_COUNTER;
			
	EXCEPTION
		WHEN NO_DATA_FOUND THEN 
			BEGIN
				v_STAGE := 400;  
				-- get acno
				select acno into v_COUNTER from (
				 select min_a - 1 + level as acno
					   from ( select min(SUB_ACCOUNTS_NO) min_a
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
					EXECUTE IMMEDIATE 'UPDATE SUB_ACCOUNTS SET SUB_ACCOUNTS_NO =' || v_COUNTER || ' WHERE SUB_ACCOUNTS_ID = ' || p_SUB_ACCOUNTS_ID ;			  
				end if;
				-- end acno		
			EXCEPTION
				WHEN OTHERS THEN 
					v_STAGE := 500;  
					SELECT MAX(SUB_ACCOUNTS_NO) + 1 INTO v_COUNTER FROM SUB_ACCOUNTS
					WHERE ACCOUNTS_ID = p_ACCOUNTS_ID AND BRANCH_ID = p_BRANCH_ID;
					
					v_STAGE := 600;  
					EXECUTE IMMEDIATE 'UPDATE SUB_ACCOUNTS SET SUB_ACCOUNTS_NO =' || v_COUNTER || ' WHERE SUB_ACCOUNTS_ID = ' || p_SUB_ACCOUNTS_ID;			  
			END;
			
	END;
	RETURN v_COUNTER;
END FUN_GET_UPDATE_SUB_ACCOUNTS_NO;
/