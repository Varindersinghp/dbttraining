{{config(materialized='view' , schema='reporting' )}}

{% set linenos = get_order_lineno() %}

select orderid,
{% for lineno in linenos %}
sum(case when lineno= {{lineno}} then linesalesamount end ) as line{{lineno}}_amount,
--sum(case when lineno=2 then linesalesamount end ) as lineno2_amount,
--sum(case when lineno=3 then linesalesamount end ) as lineno3_amount,
{% endfor %}
sum(linesalesamount) as totalsales
from 
{{ ref("trf_orderdetails")}} 
group by 1 order by 1
