{% set payment_methods = ["bank_transfer", "credit_card", "gift_card", "coupon"] %}

select
    order_id,
    {% for payment_method in payment_methods -%}
    sum(case when paymentmethod = '{{payment_method}}' then amount end) as {{payment_method}}_amount,
    {% endfor -%}
    sum(amount) as total_amount
from {{ ref('stg_payments') }}
group by 1