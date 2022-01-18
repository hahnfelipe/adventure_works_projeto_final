with staging as (

    select 
        *
    from {{ ref('stg_salesreason')}}
),

transformed as (

    select 
        salesreason_id
        , sales_reason
    from staging

)

select * 
from transformed