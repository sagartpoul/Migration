create or replace function get_sequence_exist_count
(p_sequence_name varchar2)
return number is
v_ExistCount number;
begin
  begin
    select count(*) into v_ExistCount from user_sequences
  where sequence_name =  upper(p_sequence_name) ;
  exception
    when no_data_found then
      v_ExistCount := 0;
  end;
  
  return v_ExistCount;
end get_sequence_exist_count;
/