{{config(materialized='view' , schema=env_var('DBT_SALESMARTDB','SALESMART') )}}

select c.*,
d.divisionname
from 
{{ ref("trf_customers")}} c
inner join  {{ ref("divisions")}} d on c.divisionid=d.divisionid