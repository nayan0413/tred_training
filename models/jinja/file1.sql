{% set my_host_id = 10 %}

{% if my_host_id < 10 %}
    select 2+3

{% else %}
    select 4+5

{% endif %}
