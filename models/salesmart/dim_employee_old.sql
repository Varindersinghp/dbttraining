{{config(materialized='view' , schema='salesmart' )}}

select c.*
from 
{{ ref("trf_employee")}} c
