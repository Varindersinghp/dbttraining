{{config(materialized='view' , schema=env_var('DBT_SALESMARTDB','SALESMART') )}}

{{dbt_date.get_date_dimension(get_order_mindate(),get_order_maxdate())  }}
