with staging as (

    select 
        *
    from {{ ref('stg_customers') }}
),

transformed as (

    select
        row_number() over (order by customer_id) as customer_sk
        , customer_id
        , customer_name
        , card_type
        , city
        , _state
        , country
    from staging
)

select 
    *
from transformed