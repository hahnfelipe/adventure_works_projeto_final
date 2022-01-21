with salesreason as (

    select 
        *
    from {{ref('dim_salesreason')}}
),

sheader as (

    select 
        salesorderid
    from {{ ref('stg_salesheader')}}
),

final as (

    select 
        s.salesorderid
        , r.salesreason_sk as salesreason_fk
        , r.sales_reason
    from sheader s
    left join salesreason r on s.salesorderid = r.salesreason_id
)

select
    *
from final
order by salesorderid