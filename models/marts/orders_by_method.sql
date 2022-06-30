{% set payment_methods_query %}
select distinct paymentmethod from {{ ref('stg_payments') }}
order by 1
{% endset %}

{% set results = run_query(payment_methods_query) %}

{% if execute %}
{# Return the first column #}
{% set payment_methods = results.columns[0].values() %}
{% else %}
{% set payment_methods = [] %}
{% endif %}


-- create model with results of database query
select
    order_id,

    {% for payment_method in payment_methods -%}
    sum(case when paymentmethod = '{{ payment_method }}' then amount else 0 end) as {{ payment_method }}_amount,
    {% endfor -%}

    sum(amount) as total_amount

from {{ ref('stg_payments') }}
group by order_id
