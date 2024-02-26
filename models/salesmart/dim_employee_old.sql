{{config(materialized='view' , schema=env_var('DBT_SALESMARTDB','SALESMART') )}}

select c.*
from 
{{ ref("trf_employee")}} c
