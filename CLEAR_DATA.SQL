SET VERIFY OFF;
SET FEEDBACK OFF;
SET ECHO OFF;
SET SERVEROUTPUT ON;
begin
  DBMS_OUTPUT.PUT_LINE(CHR(10) || '..starting to clear the data..' || CHR(10));
  for i in (select 'drop table '||table_name||' cascade constraints' tbl from user_tables) 
  loop
     execute immediate i.tbl;
  end loop;
  PURGE RECYCLEBIN;  -- 
  DBMS_OUTPUT.PUT_LINE('..clear data process ended..' || CHR(10));
end;
/