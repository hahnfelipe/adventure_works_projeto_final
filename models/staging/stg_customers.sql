select 
    sc.creditcardid as customer_id
    , concat(firstname, ' ', lastname) as customer_name
    , sc.cardtype as card_type
    , a.city
    , s.name as _state
    , cr.name as country
from {{source('adventure_works_source_kondado_11012022', 'person_person')}} p
left join {{source('adventure_works_source_kondado_11012022', 'sales_personcreditcard')}} sp on p.businessentityid = sp.businessentityid
left join {{source('adventure_works_source_kondado_11012022', 'sales_creditcard')}} sc on sp.creditcardid = sc.creditcardid
left join {{source('adventure_works_source_kondado_11012022', 'person_businessentityaddress')}} be on p.businessentityid = be.businessentityid
left join {{source('adventure_works_source_kondado_11012022', 'person_address')}} a on be.addressid = a.addressid
left join {{source('adventure_works_source_kondado_11012022', 'person_stateprovince')}} s on a.stateprovinceid = s.stateprovinceid 
left join {{source('adventure_works_source_kondado_11012022', 'person_countryregion')}} cr on s.countryregioncode = cr.countryregioncode




