    select 
        count(distinct(d.salesorderid)) as number_of_orders,
        sum(d.orderqty) as purchased_quantity,
        sum(d.unitprice) as total_amount_negotiated,
        avg(d.unitprice) as average_ticket
    
    from {{ source('adventure_works_source_kondado_11012022', 'sales_salesorderdetail')}} d