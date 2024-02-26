{% macro get_order_mindate() -%}

{% set min_date_query %}
select min(orderdate)
from {{ ref("trf_orders")}} 
--order by 1
{% endset %}

{% set results = run_query(min_date_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}
