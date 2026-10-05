{{
    config(
        materialized = 'materialized_view',
        partition_by = {
            "field" : "created_at",
            "data_type" : "timestamp",
            "granularity" : "day"
        }
    )
}}


with cte_1 as 
(
    select
    *
    from
    {{ref('src_hosts')}}
)
select
host_id,
host_name,
is_superhost,
created_at,
updated_at
from 
cte_1