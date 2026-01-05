{%- set apples = ["apple1","apple2","apple3","apple4"] -%}

{% for i in apples %}
    {% if i != "apple2"  %}
        {{i}}

    {% endif %}       
{% endfor %}