create or replace function get_table_exist_count
(p_table_name varchar2)
return number is
v_ExistCount number;
begin
  begin
    select count(*) into v_ExistCount from user_tables
    where table_name =upper(p_table_name) ;
  exception
    when no_data_found then
      v_ExistCount := 0;
  end;
  
  return v_ExistCount;
end get_table_exist_count;
/

select get_table_count('tran') from dual;