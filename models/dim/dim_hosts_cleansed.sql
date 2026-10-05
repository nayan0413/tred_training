{{
    config(
        materialized = 'table',
        partition_by = {
            "field" : "created_at",
            "data_type" : "timestamp",
            "granularity" : "day"
        },
        pre_hook = "select 'Starting Execution of the Model...' as message",
        post_hook = "select 'Model Execution finished...' as message"
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
host_id,     
COALESCE(host_name, 'Anonymous') AS host_name,     
is_superhost,     
created_at,     
updated_at
FROM cte