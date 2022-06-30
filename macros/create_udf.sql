{% macro is_bigger_udf() %}
{% set gt_udf_query %}
create or replace function gt_udf(num1 double, num2 double)
returns double 
language javascript
strict
as '
    return NUM1 > NUM2;
';
{% endset %}

{% do run_query(gt_udf_query) %}

{% endmacro %}