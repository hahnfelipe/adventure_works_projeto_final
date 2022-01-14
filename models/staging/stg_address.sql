with _address as (

    select 
    a.addressid,
    a.city, 
    s.name as _state, 
    c.name as country
    from {{source('adventure_works_source_kondado_11012022', 'person_address')}} a
    inner join {{source('adventure_works_source_kondado_11012022', 'person_stateprovince')}} s on a.stateprovinceid = s.stateprovinceid 
    inner join {{source('adventure_works_source_kondado_11012022', 'person_countryregion')}} c on s.countryregioncode = c.countryregioncode
    order by addressid
)


select * from _address