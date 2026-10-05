{% set countries = ['India', 'Spain', 'USA', 'Canada', 'France'] %}

select

{% for country in countries %}

    '{{ country }}' as country{{ loop.index }}
    {% if not loop.last %},{% endif %}

{% endfor %}
