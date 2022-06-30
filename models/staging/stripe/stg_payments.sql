select 
    -- align id columns to rest of project
    -- makes it easier to work with later
    id as payment_id,
    orderid as order_id,

    paymentmethod,
    status,
    amount,
    created,
    _batched_at
from {{ source('stripe', 'payments') }}