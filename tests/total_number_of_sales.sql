with sum_sales as (

    select 
        count(distinct(salesorderid)) as cnt_sales
    from {{ ref('fct_sales') }}
    where orderdate 
    between '2011-05-31T00:00:00+00:00' and '2014-06-30T00:00:00+00:00'
)

select
    *
from sum_sales where cnt_sales != 31465