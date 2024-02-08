{{config(materialized='table' , alias='stg_products')}}

select * from QWT.RAW.Products