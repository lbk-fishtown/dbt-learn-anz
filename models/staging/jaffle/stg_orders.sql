{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}

select
    id as order_id,
    user_id as customer_id,
    order_date,
    status

from {{ source('jaffle', 'orders') }}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where order_date > (select max(order_date) from {{ this }}) 
{% endif %}