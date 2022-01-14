select 
p.name as product_name,
d.salesorderid
from {{source('adventure_works_source_kondado_11012022', 'sales_salesorderdetail')}} d
join {{source('adventure_works_source_kondado_11012022', 'sales_specialofferproduct')}} s on d.productid = s.productid
join {{source('adventure_works_source_kondado_11012022', 'production_productproductphoto')}} pp on s.productid = pp.productid
join {{source('adventure_works_source_kondado_11012022', 'production_product')}} p on pp.productid = p.productid
