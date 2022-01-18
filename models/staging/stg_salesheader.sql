select 
    s.salesorderid
    , s.creditcardid
    , s.orderdate
    , s.status
from {{ source('adventure_works_source_kondado_11012022', 'sales_salesorderheader')}} s