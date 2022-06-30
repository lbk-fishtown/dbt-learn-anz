{% macro hello( name = 'no name' ) -%}
Hello {{ name }}
{% endmacro -%}

{% macro cents_to_dollars() -%}
::number(10,2)
{% endmacro -%}