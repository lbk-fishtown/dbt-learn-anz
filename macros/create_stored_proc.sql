{% macro gt() %}
{% set sp_query %}
create or replace procedure return_greater(number_1 integer, number_2 integer)
returns integer not null
language sql
as
$$
begin
  if (number_1 > number_2) then
    return number_1;
  else
    return number_2;
  end if;
end;
$$
;
{% endset %}

{% do run_query(sp_query) %}

{% endmacro %}

