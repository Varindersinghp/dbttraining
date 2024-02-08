{{config(materialized='table' , sort='CustomerID', alias='stg_customers')}}

select * from QWT.RAW.customers