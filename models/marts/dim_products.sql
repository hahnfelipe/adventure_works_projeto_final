with staging as (

    select 
        *
    from {{ ref('stg_products') }}
),

transformed as (

    select 
        row_number() over (order by product_id) as product_sk
        , product_id
        , product_name
        , orderqty
        , unitprice
    from staging
)

select * from transformed
