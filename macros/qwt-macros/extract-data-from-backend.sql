{% macro get_order_lineno() -%}

{% set distinct_lineno_query %}
select distinct
lineno
from {{ ref("trf_orderdetails")}} 
order by 1
{% endset %}

{% set results = run_query(distinct_lineno_query) %}

{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}

{{ return(results_list) }}

{%- endmacro %}
