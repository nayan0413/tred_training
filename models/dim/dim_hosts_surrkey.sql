{{
    config(
        materialized = 'table',
        partition_by = {
            "field" : "created_at",
            "data_type" : "timestamp",
            "granularity" : "day"
        }
    )
}}


with cte as 
(
    select
    *
    from 
    {{ref('src_hosts')}}
    where is_superhost is not null
)
SELECT    
{{ dbt_utils.generate_surrogate_key(['host_id','is_superhost']) }} as host_sk,
host_id,     
COALESCE(host_name, 'Anonymous') AS host_name,     
is_superhost,     
created_at,     
updated_at
FROM cte