{% macro get_order_maxdate() -%}

{% set max_date_query %}
select max(orderdate)
from {{ ref("trf_orders")}} 
--order by 1
{% endset %}

{% set results = run_query(max_date_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}
