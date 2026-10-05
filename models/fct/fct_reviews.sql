{{
    config(
        materialized = 'incremental',
        incremental_strategy = 'merge',
        on_schema_change = 'fail'     
    )
}}

with cte_1 as
(
select 
* 
from 
{{ref('src_reviews')}}
)
select * from cte_1
where 1=1
{% if is_incremental() %}
    and review_date > (select MAX(review_date) from {{this}})
{% endif  %}