{{config(materialized='table' , alias='stg_products')}}

select * from {{env_var('DBT_SOURCEDB','QWT')}}.{{env_var('DBT_SOURCESCHEMA','RAW')}}.Products