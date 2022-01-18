select
so.salesorderid as salesreason_id
, sr.name as sales_reason

from {{source('adventure_works_source_kondado_11012022', 'sales_salesorderheadersalesreason')}} so
join {{source('adventure_works_source_kondado_11012022', 'sales_salesreason')}} sr on so.salesreasonid = sr.salesreasonid
order by so.salesreasonid



