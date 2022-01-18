with customers as (

    select
        customer_sk
        , customer_id
        , customer_name
        , card_type
        , city
        , _state
        , country
    from {{ ref('dim_customers') }}
),

products as (

    select
        product_sk
        , product_id
    from {{ ref('dim_products') }}
),

salesreason as (

    select  
        salesreason_id
    from {{ ref('dim_salesreason') }}
), 

salesheader as (

    select
        row_number() over (order by sheader.salesorderid) as salesorder_sk
        , sheader.salesorderid
        , c.customer_sk as customer_fk
        , p.product_sk as product_fk
        , sreason.salesreason_id 
        , sheader.orderdate
        , sheader.status
        , c.customer_name
        , card_type
        , city
        , _state
        , country
    from {{ ref('stg_salesheader')}} sheader
    left join customers c on sheader.creditcardid = c.customer_id
    left join products p on sheader.salesorderid = p.product_id
    left join salesreason sreason on  sheader.salesorderid = sreason.salesreason_id  
)

select * from salesheader
