
select
    order_id,
    customer_id,
    --(hint: this has to come from payments)
    amount
from {{ ref('stg_orders') }}
inner join {{ ref('stg_payments') }} using (order_id)