{{config(materialized='view' , schema='salesmart' )}}

select c.*,
d.divisionname
from 
{{ ref("trf_customers")}} c
inner join  {{ ref("divisions")}} d on c.divisionid=d.divisionid