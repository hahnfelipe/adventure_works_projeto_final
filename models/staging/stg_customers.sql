with customers as (

    select 
    businessentityid as customerid,
    concat(firstname, ' ', lastname) as customer_name

    from {{source('adventure_works_source_kondado_11012022', 'person_person')}} p
    order by customerid

)


select * from customers