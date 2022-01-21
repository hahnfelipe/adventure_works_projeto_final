with sum_customers as (
    
    select 
        count(distinct(customer_name)) as dif_customer
    from {{ ref('dim_customers')}}

)

select *
from sum_customers
where dif_customer != 19516