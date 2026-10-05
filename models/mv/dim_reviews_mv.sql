{{
    config(
        materialized = 'materialized_view',
        partition_by = {
            "field" : "listing_id",
            "data_type" : "int64",
            "range" : {
                "start" : 3000,
                "end" : 60000000,
                "interval" : 1000000
            }
        }
    )
}}


with cte_1 as 
(
    select
    *
    from
    {{ref('src_reviews')}}
)
select
listing_id,
review_date,
reviewer_name,
review_text,
review_sentiment
from 
cte_1