select 
d.salesorderid as product_id,
p.name as product_name,
d.orderqty,
d.unitprice
from {{source('adventure_works_source_kondado_11012022', 'production_product')}} p
left join {{source('adventure_works_source_kondado_11012022', 'sales_salesorderdetail')}} d on p.productid = d.productid


