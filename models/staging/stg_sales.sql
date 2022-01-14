with s_reason as (

    select * from {{ ref('stg_salesreason') }}

),

product as (

    select * from {{ ref('stg_products') }}

),


sales as (
    select
        s.status, 
        s.orderdate,
        c.cardtype as creditcard_type,
        sr.sales_reason, 
        p.product_name
    
    from {{source('adventure_works_source_kondado_11012022', 'sales_salesorderheader')}} s
    join {{source('adventure_works_source_kondado_11012022', 'sales_creditcard')}} c on s.creditcardid = c.creditcardid
    join s_reason sr on s.salesorderid = sr.salesreasonid
    join product p on s.salesorderid = p.salesorderid

)

select * from sales