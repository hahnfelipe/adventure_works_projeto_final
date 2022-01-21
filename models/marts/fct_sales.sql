with customers as (

    select
        *
    from {{ ref('dim_customers') }}
),

products as (

    select
        *
    from {{ ref('dim_products') }}
),

salesreason as (

    select 
        *
    from {{ ref('dim_salesreason')}}
),

salesheader as (

    select
        row_number() over (order by sheader.salesorderid) as salesorder_sk
        , sheader.salesorderid
        , c.customer_sk as customer_fk
        , p.product_sk as product_fk
        , sheader.orderdate
        , sheader.status
        , p.product_name
        , p.orderqty
        , p.unitprice
        , s.sales_reason
        , c.customer_name
        , card_type
        , city
        , _state
        , country
    from {{ ref('stg_salesheader')}} sheader
    left join customers c on sheader.creditcardid = c.customer_id
    left join products p on sheader.salesorderid = p.product_id
    left join salesreason s on sheader.salesorderid = s.salesreason_id
  
)

select 
    * 
from salesheader

