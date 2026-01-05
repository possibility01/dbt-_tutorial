{% set initial_load = 1 %}
{% set last_load = 3 %}

{% set columns = ['sales_id','date_sk','unit_price','gross_amount'] %}

SELECT 
    {% for i in columns %}
        {{i}} {% if not loop.last %} , {% endif %}
    {% endfor %}
FROM 
    {{ ref("bronze_sales") }}

{% if initial_load == 1 %}

WHERE date_sk > {{ last_load }}



{% endif %}
