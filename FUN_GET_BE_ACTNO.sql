/*
select fun_get_be_actno(branch_id, accounts_id, a.sub_accounts_id, a.sub_accounts_no)actno,
decode( substr(sub_accounts_no,1,3), 121,131,127,137,124,134,200,201,217,227) acno, a.* from sub_accounts a
where length(sub_accounts_no) > 6;

*/
create or replace 
FUNCTION FUN_GET_BE_ACTNO
(
	p_BRCODE NUMBER,
	p_ACCOUNTS_ID NUMBER,
	p_SUB_ACCOUNTS_ID NUMBER,
	p_SUB_ACCOUNTS_NO NUMBER
)
RETURN VARCHAR2 IS
	v_BRANCH_ID NUMBER;
	v_BEACTNO VARCHAR2(13);
	v_CL_GLAC NUMBER(3);
	v_BE_GLAC NUMBER(3);
	v_BE_ACNO_PREFIX NUMBER;
	v_BE_ACNO NUMBER;
	v_ERROR BOOLEAN;
	v_temp_acno number;
	v_CONVERSION_NAME VARCHAR2(30);
BEGIN
  v_ERROR := FALSE;
  v_BRANCH_ID := p_BRCODE;
	--FETCH FROM 
	BEGIN
		
	SELECT CONVERSION_NAME INTO v_CONVERSION_NAME from csv_config 
		where BRCODE=FUN_GET_ACTIVE_BRANCH_CODE();
		
		if(TRIM(v_CONVERSION_NAME)='MULTI')then
		
			CASE p_BRCODE
				WHEN 1 THEN	
					v_BRANCH_ID := 2;
				WHEN 2 THEN	
					v_BRANCH_ID := 1;
        ELSE
          v_BRANCH_ID := p_BRCODE;
			END CASE;
			
		end if;
		
		
		SELECT  BE_GLAC, BE_ACNO_PREFIX, BE_ACNO INTO v_BE_GLAC, v_BE_ACNO_PREFIX, v_BE_ACNO FROM GLMAP
		WHERE CL_GLAC = p_ACCOUNTS_ID AND BRANCH_ID = p_BRCODE;
		
		
	EXCEPTION	  
		WHEN NO_DATA_FOUND THEN		
			BEGIN
				
		
				SELECT  BE_GLAC, BE_ACNO_PREFIX, BE_ACNO INTO v_BE_GLAC, v_BE_ACNO_PREFIX, v_BE_ACNO FROM GLMAP
				WHERE CL_GLAC = p_ACCOUNTS_ID;
				
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
				v_ERROR := TRUE;           
				v_BEACTNO := NULL;         
			END ;			  
	END;
	
	IF( NOT( v_ERROR ) ) THEN
	
		/*
		* AJIT BANK THERE ACC_NO FIELD EXCED THE LIMIT SO WE TAKE ONLY 6 DIGIT
		*/	
		--	
		IF( p_SUB_ACCOUNTS_NO > 999999 ) THEN
	
			case substr( p_SUB_ACCOUNTS_NO,1,3)
				when 223 then
					v_temp_acno := 224 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000) ;					
				when 337 then
					v_temp_acno := 338 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000) ;					
				when 192 then
					v_temp_acno := 195 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000) ;					
				when 204 then
					v_temp_acno := 206 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000) ;					
				when 282 then
					v_temp_acno := 283 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000) ;					
				when 193 then
					v_temp_acno := 194 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000) ;										
				when 260 then
					v_temp_acno := 261 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000);				
				when 235 then
					v_temp_acno := 236 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000);											
				when 100 then
					v_temp_acno := 5 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000);												
				when 217 then
					v_temp_acno := 947 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000) ;
				when 222 then
					v_temp_acno := 946 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000) ;						
				when 121 then
					v_temp_acno := 953 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000) ;					
				when 231 then
					v_temp_acno := 951 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000) ;						
				when 232 then
					v_temp_acno := 952 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000) ;						
				when 127 then
					v_temp_acno := 137 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000) ;
				when 124 then
					v_temp_acno := 134 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000) ;
				when 200 then
					v_temp_acno := 201 || substr(p_SUB_ACCOUNTS_NO, 4, length(p_SUB_ACCOUNTS_NO));
					v_BE_ACNO := MOD(v_temp_acno,1000000) ;				
				else
					v_BE_ACNO := MOD( p_SUB_ACCOUNTS_NO,1000000) ;
			end case;
			
			v_BE_ACNO := MOD(v_BE_ACNO,1000000) ;
		--	EXECUTE IMMEDIATE 'UPDATE SUB_ACCOUNTS SET SUB_ACCOUNTS_NO =' || v_BE_ACNO || ' WHERE SUB_ACCOUNTS_ID = ' || p_SUB_ACCOUNTS_ID ;			  
		--	COMMIT;
		--	v_BE_ACNO := FUN_GET_UPDATE_SUB_ACCOUNTS_NO(p_BRCODE, p_ACCOUNTS_ID, p_SUB_ACCOUNTS_ID);
		END IF;
		
		--IF ( NVL(p_AC_NO,0) > 0 ) THEN 
			IF( NVL(v_BE_ACNO_PREFIX,0)=0 ) THEN
				v_BEACTNO := CONCAT(CONCAT(LPAD(v_BRANCH_ID,4,'0'),LPAD(v_BE_GLAC,3,'0')),  LPAD(NVL(v_BE_ACNO,p_SUB_ACCOUNTS_NO),6,0)) ;
			ELSE
				v_BEACTNO := CONCAT(CONCAT(LPAD(v_BRANCH_ID,4,'0'),LPAD(v_BE_GLAC,3,'0')),CONCAT(v_BE_ACNO_PREFIX,LPAD(NVL(v_BE_ACNO,p_SUB_ACCOUNTS_NO),3,0))) ;
			END IF;
		--ELSE
		--	v_BEACTNO := NULL;
		--END IF;
		
	END IF;
	
	RETURN v_BEACTNO;

END FUN_GET_BE_ACTNO;
/