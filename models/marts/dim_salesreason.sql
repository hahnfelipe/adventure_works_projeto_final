with staging as (

    select 
        *
    from {{ ref('stg_salesreason')}}
),

transformed as (

    select 
        row_number() over (order by salesreason_id) as salesreason_sk
        , salesreason_id
        , sales_reason
    from staging

)

select * 
from transformed