with t1 as (
    select count(distinct customer_id) as c1
    from {{ ref('stg_customers') }}
),
t2 as (
    select count(distinct customer_id) as c2
    from {{ ref('customers') }}
)

select 
    t1.c1 = t2.c2 as result
from 
    t1, t2
where 
    result = false


 